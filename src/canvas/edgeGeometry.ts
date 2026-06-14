// Pure helpers extracted from MappingEdge so the edge-label and dedup logic is
// unit-testable (the rest of MappingEdge is coupled to ReactFlow hooks).

// Returns the last dotted segment of a source expression (e.g.
// `aws_vpc.main.id` → `id`), falling back to the whole trimmed expression.
export const parseOutAttr = (sourceExpression: string): string => {
  const parts = sourceExpression.trim().split(".");
  return parts[parts.length - 1] || sourceExpression.trim();
};

// Stable dedup key for a mapping route: identical routes collapse, any field
// difference produces a distinct key.
export const routeKey = (route: {
  fromNodeId: string;
  toNodeId: string;
  sourceExpression: string;
  targetAttribute: string;
}): string =>
  [route.fromNodeId, route.toNodeId, route.sourceExpression.trim(), route.targetAttribute.trim()].join("|");
