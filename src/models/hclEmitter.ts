import type { TerraformProject, TerraformResource } from "./terraform";
import {
  PROVIDER_CONFIG,
  type CloudProvider,
  type ProviderSettings,
  detectProvidersInUse,
} from "./providerConfig";

type HclBlockNode = {
  attributes: Record<string, unknown>;
  blocks: Record<string, HclBlockNode>;
};

// A dotted expression like `aws_vpc.main.id` is only a Terraform reference if
// its first segment names a resource type or a known top-level scope. This
// avoids treating plain strings such as `s3.amazonaws.com` (a domain, not a ref)
// as bare references — those must stay quoted.
const TERRAFORM_REF_SHAPE = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;
const TERRAFORM_REF_SCOPES = new Set(["data", "var", "local", "module", "each", "self", "count"]);
const isTerraformReference = (value: string): boolean => {
  if (!TERRAFORM_REF_SHAPE.test(value)) return false;
  const head = value.split(".")[0];
  // Resource types (aws_*, google_*, …) always contain an underscore; other
  // genuine references start with a known scope keyword.
  return head.includes("_") || TERRAFORM_REF_SCOPES.has(head);
};

// HCL expressions that must be emitted verbatim (not quoted as a string):
//  - function calls like `file(...)`, `jsonencode({...})`, `templatefile(...)`
//  - interpolations like `"${path.module}/x"` (already quoted) or bare `${...}`
const HCL_FUNCTION_CALL_PATTERN = /^[a-zA-Z_][a-zA-Z0-9_]*\s*\([\s\S]*\)$/;
const isRawHclExpression = (value: string): boolean =>
  HCL_FUNCTION_CALL_PATTERN.test(value) || value.includes("${");

const isPlainObject = (value: unknown): value is Record<string, unknown> =>
  typeof value === "object" && value !== null && !Array.isArray(value);

const isMeaningfulValue = (value: unknown): boolean => {
  if (value === undefined || value === null) return false;
  if (typeof value === "string") {
    const trimmed = value.trim();
    if (!trimmed) return false;
    if (trimmed === "[" || trimmed === "]" || trimmed === "{" || trimmed === "}") return false;
    return true;
  }
  if (Array.isArray(value)) {
    if (!value.length) return false;
    if (value.every((item) => isPlainObject(item))) {
      return value.some((item) =>
        Object.values(item).some((nested) => isMeaningfulValue(nested)),
      );
    }
    return value.some((item) => isMeaningfulValue(item));
  }
  if (isPlainObject(value)) {
    return Object.values(value).some((nested) => isMeaningfulValue(nested));
  }
  return true;
};

const toHclLiteral = (value: unknown): string => {
  if (value === null || value === undefined) return "null";
  if (typeof value === "boolean" || typeof value === "number") return String(value);
  if (Array.isArray(value)) {
    if (value.length === 0) return "[]";
    if (value.every((item) => isPlainObject(item))) {
      const entries = (value as Array<Record<string, unknown>>).map((item) => {
        const fields = Object.entries(item)
          .filter(([, v]) => v !== undefined)
          .map(([k, v]) => `      ${k} = ${toHclLiteral(v)}`)
          .join("\n");
        return `    {\n${fields}\n    }`;
      });
      return `[\n${entries.join(",\n")}\n  ]`;
    }
    return `[${value.map(toHclLiteral).join(", ")}]`;
  }
  if (typeof value === "string") {
    const trimmed = value.trim();
    if (!trimmed) return '""';
    if (isTerraformReference(trimmed) || trimmed.startsWith("var.")) return trimmed;
    if (isRawHclExpression(trimmed)) return trimmed;
    if (
      trimmed === "true" ||
      trimmed === "false" ||
      /^-?\d+(\.\d+)?$/.test(trimmed) ||
      (trimmed.startsWith('"') && trimmed.endsWith('"')) ||
      (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
      (trimmed.startsWith("{") && trimmed.endsWith("}"))
    ) {
      return trimmed;
    }
    return JSON.stringify(value);
  }
  return JSON.stringify(String(value));
};

// Splits a comma/brace/bracket-aware HCL fragment at top-level commas only,
// ignoring commas nested inside [...], {...}, or "...". Used to break an inline
// object's entries or an inline array's items into pieces.
const splitTopLevel = (input: string): string[] => {
  const parts: string[] = [];
  let depth = 0;
  let inString = false;
  let current = "";
  for (let i = 0; i < input.length; i += 1) {
    const ch = input[i];
    if (inString) {
      current += ch;
      if (ch === '"' && input[i - 1] !== "\\") inString = false;
      continue;
    }
    if (ch === '"') {
      inString = true;
      current += ch;
      continue;
    }
    if (ch === "[" || ch === "{") depth += 1;
    if (ch === "]" || ch === "}") depth -= 1;
    if (ch === "," && depth === 0) {
      parts.push(current);
      current = "";
      continue;
    }
    current += ch;
  }
  if (current.trim()) parts.push(current);
  return parts;
};

// Parses a single inline HCL object literal body (without the outer braces),
// e.g. `description = "HTTP", from_port = 80` → { description: '"HTTP"', from_port: '80' }.
// Values are kept as raw HCL strings so the emitter renders them verbatim.
const parseInlineObjectBody = (body: string): Record<string, unknown> | null => {
  const result: Record<string, unknown> = {};
  for (const entry of splitTopLevel(body)) {
    const eq = entry.indexOf("=");
    if (eq < 0) return null;
    const key = entry.slice(0, eq).trim();
    const value = entry.slice(eq + 1).trim();
    if (!/^[a-zA-Z_][a-zA-Z0-9_-]*$/.test(key)) return null;
    result[key] = value;
  }
  return result;
};

// Detects strings shaped like an inline HCL array of objects
// (`[{ ... }, { ... }]`) and parses them into a real array of objects so the
// emitter can render each element as its own nested block. Returns null when the
// string is not an array-of-objects literal (e.g. a list of strings).
const parseInlineObjectArray = (
  value: unknown,
): Array<Record<string, unknown>> | null => {
  if (typeof value !== "string") return null;
  const trimmed = value.trim();
  if (!trimmed.startsWith("[") || !trimmed.endsWith("]")) return null;
  const inner = trimmed.slice(1, -1).trim();
  if (!inner.startsWith("{")) return null;

  const items: Array<Record<string, unknown>> = [];
  for (const rawItem of splitTopLevel(inner)) {
    const item = rawItem.trim();
    if (!item.startsWith("{") || !item.endsWith("}")) return null;
    const parsed = parseInlineObjectBody(item.slice(1, -1).trim());
    if (!parsed) return null;
    items.push(parsed);
  }
  return items.length ? items : null;
};

export const terraformResourceToHCL = (resource: TerraformResource): string => {
  const blockKind = resource.kind ?? "resource";
  const attrs = resource.config.attributes ?? {};
  const root: HclBlockNode = { attributes: {}, blocks: {} };

  Object.entries(attrs).forEach(([rawKey, rawValue]) => {
    if (!isMeaningfulValue(rawValue)) return;

    const pathParts = rawKey.split(".").filter(Boolean);
    if (!pathParts.length) return;

    if (pathParts.length === 1) {
      root.attributes[pathParts[0]] = rawValue;
      return;
    }

    let cursor = root;
    for (const blockName of pathParts.slice(0, -1)) {
      if (!cursor.blocks[blockName]) {
        cursor.blocks[blockName] = { attributes: {}, blocks: {} };
      }
      cursor = cursor.blocks[blockName];
    }

    cursor.attributes[pathParts[pathParts.length - 1]] = rawValue;
  });

  const renderAssignment = (key: string, value: unknown, indent: string): string => {
    if (key === "protocol" && typeof value === "number" && value === -1) {
      return `${indent}${key} = "-1"\n`;
    }
    return `${indent}${key} = ${toHclLiteral(value)}\n`;
  };

  // Renders one object as a nested block `name { ... }`. Properties that are
  // themselves an array of objects (or a string-encoded one) become nested
  // blocks recursively — GCP especially nests blocks several levels deep
  // (e.g. boot_disk > initialize_params, network_interface > access_config).
  // An empty object still emits an empty block (e.g. `access_config {}` asks
  // GCP for an ephemeral public IP), so callers can force that with `[{}]`.
  const renderObjectBlock = (
    blockName: string,
    value: Record<string, unknown>,
    indent: string,
  ): string => {
    const inner = `${indent}  `;
    let body = "";
    Object.entries(value).forEach(([k, v]) => {
      if (Array.isArray(v) && v.length && v.every((item) => isPlainObject(item))) {
        v.forEach((item) => {
          body += renderObjectBlock(k, item as Record<string, unknown>, inner);
        });
        return;
      }
      const nestedInline = parseInlineObjectArray(v);
      if (nestedInline) {
        nestedInline.forEach((item) => {
          body += renderObjectBlock(k, item, inner);
        });
        return;
      }
      if (!isMeaningfulValue(v)) return;
      body += renderAssignment(k, v, inner);
    });

    return `${indent}${blockName} {\n${body}${indent}}\n`;
  };

  const renderNode = (node: HclBlockNode, indent: string): string => {
    let lines = "";

    Object.entries(node.attributes).forEach(([key, value]) => {
      // Array of objects → one nested block per item. Checked before the
      // meaningfulness guard so a deliberately-empty block like
      // `access_config = [{}]` still emits `access_config {}`.
      if (Array.isArray(value) && value.length && value.every((item) => isPlainObject(item))) {
        value.forEach((item) => {
          lines += renderObjectBlock(key, item as Record<string, unknown>, indent);
        });
        return;
      }

      // String-encoded array of objects (e.g. `ingress = "[{ ... }, { ... }]"`,
      // as stored by templates) → render each element as its own nested block.
      const inlineObjects = parseInlineObjectArray(value);
      if (inlineObjects) {
        inlineObjects.forEach((item) => {
          lines += renderObjectBlock(key, item, indent);
        });
        return;
      }

      if (!isMeaningfulValue(value)) return;
      lines += renderAssignment(key, value, indent);
    });

    Object.entries(node.blocks).forEach(([blockName, blockNode]) => {
      const inner = renderNode(blockNode, `${indent}  `);
      if (!inner.trim()) return;
      lines += `${indent}${blockName} {\n`;
      lines += inner;
      lines += `${indent}}\n`;
    });

    return lines;
  };

  const body = renderNode(root, "  ");
  return `${blockKind} "${resource.type}" "${resource.name}" {\n${body}}`;
};

export function buildMultiProviderHcl(
  project: TerraformProject,
  providerSettings: ProviderSettings,
  activeProvider: CloudProvider,
): string {
  const providers = detectProvidersInUse(project.resources, activeProvider);

  let hcl = "terraform {\n";
  hcl += "  required_providers {\n";
  providers.forEach((p) => {
    const cfg = PROVIDER_CONFIG[p];
    hcl += `    ${cfg.name} = {\n`;
    hcl += `      source  = "${cfg.source}"\n`;
    hcl += `      version = "${cfg.version}"\n`;
    hcl += "    }\n";
  });
  hcl += "  }\n";
  hcl += "}\n\n";

  providers.forEach((p) => {
    const cfg = PROVIDER_CONFIG[p];
    const region = providerSettings[p]?.region ?? cfg.defaultRegion;
    hcl += `provider "${cfg.name}" {\n`;
    // GCP needs a project to deploy (and a zone for Compute). The project comes
    // from a `var.project` so each template stays portable across accounts;
    // an explicit setting wins when present. Emitted only for the google provider.
    if (cfg.name === "google") {
      const project = providerSettings[p]?.project;
      hcl += project && project.trim()
        ? `  project = "${project}"\n`
        : "  project = var.project\n";
      const zone = providerSettings[p]?.zone ?? cfg.defaultZone;
      if (zone && zone.trim()) hcl += `  zone = "${zone}"\n`;
    }
    if (region.trim()) hcl += `  region = "${region}"\n`;
    hcl += "}\n\n";
  });

  project.resources.forEach((resource) => {
    const block = terraformResourceToHCL(resource);
    hcl += block;
    hcl += "\n\n";
  });

  return hcl.trimEnd() + "\n";
}
