import { describe, it, expect } from "vitest";
import {
  getAttributeValueRanges,
  canEditOnlyInAttributeValues,
  pruneEmptyAttributeAssignments,
} from "./hclEditGuards";

describe("getAttributeValueRanges", () => {
  it("yields a range for an attribute line, excluding the wrapper quotes", () => {
    const text = 'ami = "ami-123"';
    const ranges = getAttributeValueRanges(text);
    expect(ranges).toHaveLength(1);
    // The range covers `ami-123`, not the surrounding quotes.
    expect(text.slice(ranges[0].start, ranges[0].end)).toBe("ami-123");
  });

  it("yields no range for block headers, braces, or blank lines", () => {
    expect(getAttributeValueRanges('resource "aws_vpc" "x" {')).toHaveLength(0);
    expect(getAttributeValueRanges("}")).toHaveLength(0);
    expect(getAttributeValueRanges("")).toHaveLength(0);
  });

  it("covers a non-string value fully", () => {
    const text = "count = 3";
    const [r] = getAttributeValueRanges(text);
    expect(text.slice(r.start, r.end)).toBe("3");
  });
});

describe("canEditOnlyInAttributeValues", () => {
  const hcl = 'resource "aws_instance" "web" {\n  ami = "ami-123"\n}';

  it("allows identical strings", () => {
    expect(canEditOnlyInAttributeValues(hcl, hcl)).toBe(true);
  });

  it("allows an edit inside a value", () => {
    const next = hcl.replace("ami-123", "ami-999");
    expect(canEditOnlyInAttributeValues(hcl, next)).toBe(true);
  });

  it("blocks renaming a key", () => {
    const next = hcl.replace("ami =", "xyz =");
    expect(canEditOnlyInAttributeValues(hcl, next)).toBe(false);
  });

  it("blocks inserting a newline", () => {
    const next = hcl.replace('ami = "ami-123"', 'ami = "ami-123"\n  extra = "x"');
    expect(canEditOnlyInAttributeValues(hcl, next)).toBe(false);
  });

  it("blocks editing a block header", () => {
    const next = hcl.replace('"web"', '"renamed"');
    expect(canEditOnlyInAttributeValues(hcl, next)).toBe(false);
  });
});

describe("pruneEmptyAttributeAssignments", () => {
  it("removes empty assignments inside a block", () => {
    const hcl = 'resource "aws_vpc" "x" {\n  cidr = "10.0.0.0/16"\n  tags = ""\n  name =\n}';
    const pruned = pruneEmptyAttributeAssignments(hcl);
    expect(pruned).toContain('cidr = "10.0.0.0/16"');
    expect(pruned).not.toContain("tags =");
    expect(pruned).not.toMatch(/name =\s*$/m);
  });

  it("keeps top-level (depth 0) empty assignments", () => {
    const hcl = 'foo = ""\nresource "x" "y" {\n  a = "v"\n}';
    expect(pruneEmptyAttributeAssignments(hcl)).toContain('foo = ""');
  });
});
