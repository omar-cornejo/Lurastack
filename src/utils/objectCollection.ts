// Helpers for Terraform schema "object collection" types (a set/list whose
// element is an object), e.g. `["set", ["object", { from_port: "number", ... }]]`.
// Extracted verbatim from RightPanel so the schema-shape logic is unit-testable.

export const isObjectCollection = (rawType: unknown): boolean => {
  if (!Array.isArray(rawType) || rawType.length < 2) return false;
  const [container, inner] = rawType as [unknown, unknown];
  if (container !== "set" && container !== "list") return false;
  return Array.isArray(inner) && inner[0] === "object";
};

// Returns the field-name → raw-type map for the object inside the collection.
export const getObjectFields = (rawType: unknown): Record<string, unknown> => {
  if (!Array.isArray(rawType) || rawType.length < 2) return {};
  const inner = rawType[1] as unknown[];
  if (!Array.isArray(inner) || inner.length < 2 || inner[0] !== "object") return {};
  return (inner[1] as Record<string, unknown>) ?? {};
};
