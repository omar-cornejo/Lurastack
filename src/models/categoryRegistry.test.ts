import { describe, it, expect } from "vitest";
import { getCategoryForType } from "./categoryRegistry";

describe("getCategoryForType", () => {
  it("returns the mapped category for known types", () => {
    expect(getCategoryForType("aws_instance")).toBe("compute");
    expect(getCategoryForType("aws_vpc")).toBe("networking");
  });

  it("falls back to 'other' for unmapped types", () => {
    expect(getCategoryForType("aws_made_up_resource")).toBe("other");
    expect(getCategoryForType("")).toBe("other");
  });
});
