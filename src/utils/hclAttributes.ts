// Attribute-value parsing and literal emission, extracted verbatim from the
// inspector (RightPanel) and the code editor (CodePanel) so both share ONE
// implementation and ONE `INVALID_HCL_VALUE` sentinel — callers compare against
// it by identity, so a single shared instance is required for correctness.
//
// NOTE: `toHclLiteral` here is the INSPECTOR variant. It is intentionally
// distinct from the canonical emitter literal in models/hclEmitter.ts (which
// formats whole resources and is guarded by the template round-trip invariant).
// Do not merge them.

export const terraformRefPattern =
  /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+(?:\.[a-zA-Z0-9_]+)+$/;

export const INVALID_HCL_VALUE = Symbol("invalid-hcl-value");

export const isPlainObject = (value: unknown): value is Record<string, unknown> =>
  typeof value === "object" && value !== null && !Array.isArray(value);

export const isMeaningfulValue = (value: unknown): boolean => {
  if (value === undefined || value === null) return false;
  if (typeof value === "string") return value.trim().length > 0;
  if (Array.isArray(value)) {
    if (!value.length) return false;
    if (value.every((item) => isPlainObject(item))) {
      return value.some((item) => Object.values(item).some((nested) => isMeaningfulValue(nested)));
    }
    return value.some((item) => isMeaningfulValue(item));
  }
  if (isPlainObject(value)) return Object.values(value).some((nested) => isMeaningfulValue(nested));
  return true;
};

export const parseHclValueToAttribute = (
  input: string,
): unknown | typeof INVALID_HCL_VALUE => {
  const trimmed = input.trim();
  // Empty value or empty HCL string literal → treat as cleared
  if (!trimmed || trimmed === '""') return "";
  if (trimmed === "[" || trimmed === "]" || trimmed === "{" || trimmed === "}") {
    return INVALID_HCL_VALUE;
  }
  if (
    (trimmed.startsWith("[") && !trimmed.endsWith("]")) ||
    (trimmed.startsWith("{") && !trimmed.endsWith("}"))
  ) {
    return INVALID_HCL_VALUE;
  }
  // Store raw HCL as-is — user is responsible for HCL syntax.
  return trimmed;
};

export const parseInspectorInputValue = (input: string): unknown => {
  return input;
};

export const formatInspectorInputValue = (value: unknown): string => {
  if (value === undefined || value === null) return "";
  if (typeof value === "string") {
    return value;
  }
  if (Array.isArray(value)) return JSON.stringify(value);
  if (typeof value === "object") return JSON.stringify(value);
  return String(value);
};

// Inspector-side HCL literal rendering (see note above re: emitter divergence).
export const toHclLiteral = (value: unknown): string => {
  if (value === null || value === undefined) return "null";
  if (typeof value === "boolean" || typeof value === "number") return String(value);
  if (Array.isArray(value)) {
    if (value.length === 0) return "[]";
    if (value.every((item) => typeof item === "object" && item !== null && !Array.isArray(item))) {
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
    if (terraformRefPattern.test(trimmed) || trimmed.startsWith("var.")) return trimmed;
    if (
      trimmed === "true" || trimmed === "false" ||
      /^-?\d+(\.\d+)?$/.test(trimmed) ||
      (trimmed.startsWith('"') && trimmed.endsWith('"')) ||
      (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
      (trimmed.startsWith("{") && trimmed.endsWith("}"))
    ) return trimmed;
    return JSON.stringify(value);
  }
  return JSON.stringify(String(value));
};
