// Local-edit diff between two view snapshots, hoisted verbatim from
// WorkspaceView (it was a closure that referenced only its parameters). One
// meaningful change (resource add/remove, attribute change, edge add/remove)
// produces one entry; pure node-position drags do not change resources/edges
// and so produce no diff.

import type { ViewSnapshot } from "../types/project";

export const computeLocalEditDiff = (
  before: ViewSnapshot,
  after: ViewSnapshot,
): {
  changes: Array<{ address: string; action: "create" | "change" | "destroy" }>;
  summary: { created: number; changed: number; destroyed: number };
} => {
  const beforeRes = new Map(before.resources.map((r) => [`${r.type}.${r.name}`, r]));
  const afterRes = new Map(after.resources.map((r) => [`${r.type}.${r.name}`, r]));
  const changes: Array<{ address: string; action: "create" | "change" | "destroy" }> = [];
  let created = 0, changed = 0, destroyed = 0;

  for (const [key, afterR] of afterRes) {
    const beforeR = beforeRes.get(key);
    if (!beforeR) {
      changes.push({ address: key, action: "create" });
      created++;
    } else if (JSON.stringify(beforeR.config) !== JSON.stringify(afterR.config)) {
      changes.push({ address: key, action: "change" });
      changed++;
    }
  }
  for (const key of beforeRes.keys()) {
    if (!afterRes.has(key)) {
      changes.push({ address: key, action: "destroy" });
      destroyed++;
    }
  }

  // Edges added / removed (identified by source→target pair, ignoring id changes)
  const edgeKey = (e: { source: string; target: string }) => `${e.source}→${e.target}`;
  const beforeEdges = new Set(before.edges.map(edgeKey));
  const afterEdges = new Set(after.edges.map(edgeKey));
  for (const key of afterEdges) {
    if (!beforeEdges.has(key)) {
      changes.push({ address: `edge: ${key}`, action: "create" });
      created++;
    }
  }
  for (const key of beforeEdges) {
    if (!afterEdges.has(key)) {
      changes.push({ address: `edge: ${key}`, action: "destroy" });
      destroyed++;
    }
  }

  return { changes, summary: { created, changed, destroyed } };
};
