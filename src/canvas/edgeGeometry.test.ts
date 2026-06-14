import { describe, it, expect } from "vitest";
import { parseOutAttr, routeKey } from "./edgeGeometry";

describe("parseOutAttr", () => {
  it("returns the last dotted segment", () => {
    expect(parseOutAttr("aws_vpc.main.id")).toBe("id");
    expect(parseOutAttr("data.aws_ami.ubuntu.id")).toBe("id");
  });

  it("returns the whole expression when there is no dot", () => {
    expect(parseOutAttr("standalone")).toBe("standalone");
  });

  it("trims surrounding whitespace", () => {
    expect(parseOutAttr("  aws_vpc.main.id  ")).toBe("id");
  });
});

describe("routeKey", () => {
  const base = {
    fromNodeId: "a",
    toNodeId: "b",
    sourceExpression: "aws_vpc.main.id",
    targetAttribute: "vpc_id",
  };

  it("produces a stable key from the trimmed tuple", () => {
    expect(routeKey(base)).toBe("a|b|aws_vpc.main.id|vpc_id");
    expect(routeKey({ ...base, sourceExpression: " aws_vpc.main.id " })).toBe(routeKey(base));
  });

  it("differs when any field differs", () => {
    expect(routeKey({ ...base, targetAttribute: "subnet_id" })).not.toBe(routeKey(base));
    expect(routeKey({ ...base, toNodeId: "c" })).not.toBe(routeKey(base));
  });

  it("deduplicates identical mappings via a Map", () => {
    const mappings = [base, { ...base }, { ...base, targetAttribute: "other" }];
    const deduped = [...new Map(mappings.map((m) => [routeKey(m), m])).values()];
    expect(deduped).toHaveLength(2);
  });
});
