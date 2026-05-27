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

const TERRAFORM_REF_PATTERN =
  /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;

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
    if (TERRAFORM_REF_PATTERN.test(trimmed) || trimmed.startsWith("var.")) return trimmed;
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

  const renderObjectBlock = (
    blockName: string,
    value: Record<string, unknown>,
    indent: string,
  ): string => {
    const entries = Object.entries(value).filter(([, item]) => isMeaningfulValue(item));
    if (!entries.length) return "";

    let lines = `${indent}${blockName} {\n`;
    entries.forEach(([k, v]) => {
      lines += renderAssignment(k, v, `${indent}  `);
    });
    lines += `${indent}}\n`;
    return lines;
  };

  const renderNode = (node: HclBlockNode, indent: string): string => {
    let lines = "";

    Object.entries(node.attributes).forEach(([key, value]) => {
      if (!isMeaningfulValue(value)) return;

      if (Array.isArray(value) && value.every((item) => isPlainObject(item))) {
        value.forEach((item) => {
          const rendered = renderObjectBlock(key, item as Record<string, unknown>, indent);
          if (rendered) lines += rendered;
        });
        return;
      }

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
