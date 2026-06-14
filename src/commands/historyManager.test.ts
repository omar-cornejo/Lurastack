import { describe, it, expect } from "vitest";
import { summarizePlanChanges } from "./historyManager";
import type { ResourcePlanChange, PlanAction } from "../canvas/types";

// historyManager imports Tauri fs (and projectManager → dialog/core); those are
// stubbed globally in vitest.setup.ts. summarizePlanChanges is pure.

const change = (action: PlanAction): ResourcePlanChange => ({
  action,
  attrActions: new Map(),
});

describe("summarizePlanChanges", () => {
  it("counts created, changed and destroyed resources", () => {
    const planChanges = new Map<string, ResourcePlanChange>([
      ["aws_vpc.main", change("create")],
      ["aws_subnet.a", change("create")],
      ["aws_instance.web", change("change")],
      ["aws_s3_bucket.old", change("destroy")],
    ]);

    const { summary, changes } = summarizePlanChanges(planChanges);
    expect(summary).toEqual({ created: 2, changed: 1, destroyed: 1 });
    expect(changes).toHaveLength(4);
    expect(changes).toContainEqual({ address: "aws_vpc.main", action: "create" });
    expect(changes).toContainEqual({ address: "aws_s3_bucket.old", action: "destroy" });
  });

  it("returns zero counts for an empty plan", () => {
    const { summary, changes } = summarizePlanChanges(new Map());
    expect(summary).toEqual({ created: 0, changed: 0, destroyed: 0 });
    expect(changes).toHaveLength(0);
  });
});
