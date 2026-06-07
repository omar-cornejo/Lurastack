import { describe, it, expect } from "vitest";
import { computeLocalEditDiff } from "./snapshotDiff";
import type { ViewSnapshot } from "../types/project";
import type { TerraformResource } from "../models/terraform";

const res = (type: string, name: string, config = {}): TerraformResource => ({
  id: `${type}.${name}`,
  type,
  name,
  config: { attributes: config, blocks: {} },
  ui: { x: 0, y: 0, icon: "" },
});

const snapshot = (
  resources: TerraformResource[],
  edges: Array<{ source: string; target: string }> = [],
): ViewSnapshot =>
  ({
    id: "v1",
    name: "View 1",
    resources,
    nodes: [],
    edges: edges.map((e, i) => ({ id: `e${i}`, ...e })),
    codeFiles: [],
  }) as unknown as ViewSnapshot;

describe("computeLocalEditDiff", () => {
  it("detects a created resource", () => {
    const before = snapshot([]);
    const after = snapshot([res("aws_vpc", "main")]);
    const { summary, changes } = computeLocalEditDiff(before, after);
    expect(summary.created).toBe(1);
    expect(changes).toContainEqual({ address: "aws_vpc.main", action: "create" });
  });

  it("detects a destroyed resource", () => {
    const before = snapshot([res("aws_vpc", "main")]);
    const after = snapshot([]);
    const { summary } = computeLocalEditDiff(before, after);
    expect(summary.destroyed).toBe(1);
  });

  it("detects a changed resource by config", () => {
    const before = snapshot([res("aws_vpc", "main", { cidr_block: "10.0.0.0/16" })]);
    const after = snapshot([res("aws_vpc", "main", { cidr_block: "10.1.0.0/16" })]);
    const { summary, changes } = computeLocalEditDiff(before, after);
    expect(summary.changed).toBe(1);
    expect(changes).toContainEqual({ address: "aws_vpc.main", action: "change" });
  });

  it("reports no change when nothing differs", () => {
    const snap = snapshot([res("aws_vpc", "main", { cidr_block: "10.0.0.0/16" })]);
    const { summary, changes } = computeLocalEditDiff(snap, snap);
    expect(summary).toEqual({ created: 0, changed: 0, destroyed: 0 });
    expect(changes).toHaveLength(0);
  });

  it("detects edge add/remove by source→target, ignoring edge id", () => {
    const r = [res("aws_vpc", "main"), res("aws_subnet", "a")];
    const before = computeLocalEditDiff(
      snapshot(r, [{ source: "n1", target: "n2" }]),
      snapshot(r, []),
    );
    expect(before.summary.destroyed).toBe(1);

    const idChangeOnly = computeLocalEditDiff(
      snapshot(r, [{ source: "n1", target: "n2" }]),
      snapshot(r, [{ source: "n1", target: "n2" }]),
    );
    expect(idChangeOnly.changes).toHaveLength(0);
  });
});
