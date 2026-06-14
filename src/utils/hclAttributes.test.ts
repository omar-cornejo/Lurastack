import { describe, it, expect } from "vitest";
import {
  INVALID_HCL_VALUE,
  parseHclValueToAttribute,
  isMeaningfulValue,
  toHclLiteral,
} from "./hclAttributes";

describe("parseHclValueToAttribute", () => {
  it("treats empty/whitespace/empty-literal as cleared", () => {
    expect(parseHclValueToAttribute("")).toBe("");
    expect(parseHclValueToAttribute("   ")).toBe("");
    expect(parseHclValueToAttribute('""')).toBe("");
  });

  it("rejects lone brackets/braces", () => {
    for (const v of ["[", "]", "{", "}"]) {
      expect(parseHclValueToAttribute(v)).toBe(INVALID_HCL_VALUE);
    }
  });

  it("rejects unbalanced brackets/braces", () => {
    expect(parseHclValueToAttribute("[1, 2")).toBe(INVALID_HCL_VALUE);
    expect(parseHclValueToAttribute("{a = 1")).toBe(INVALID_HCL_VALUE);
  });

  it("returns trimmed raw HCL for balanced/plain values", () => {
    expect(parseHclValueToAttribute('  "hello"  ')).toBe('"hello"');
    expect(parseHclValueToAttribute("aws_vpc.main.id")).toBe("aws_vpc.main.id");
    expect(parseHclValueToAttribute("[1, 2]")).toBe("[1, 2]");
    expect(parseHclValueToAttribute("{ a = 1 }")).toBe("{ a = 1 }");
  });
});

describe("isMeaningfulValue", () => {
  it("prunes empties", () => {
    expect(isMeaningfulValue(null)).toBe(false);
    expect(isMeaningfulValue(undefined)).toBe(false);
    expect(isMeaningfulValue("")).toBe(false);
    expect(isMeaningfulValue("   ")).toBe(false);
    expect(isMeaningfulValue([])).toBe(false);
    expect(isMeaningfulValue([{}])).toBe(false);
    expect(isMeaningfulValue([{ a: "" }])).toBe(false);
  });

  it("keeps real values", () => {
    expect(isMeaningfulValue("x")).toBe(true);
    expect(isMeaningfulValue([{ a: "x" }])).toBe(true);
    expect(isMeaningfulValue(0)).toBe(true);
    expect(isMeaningfulValue(false)).toBe(true);
  });
});

describe("toHclLiteral (inspector variant)", () => {
  it("renders primitives", () => {
    expect(toHclLiteral(null)).toBe("null");
    expect(toHclLiteral(true)).toBe("true");
    expect(toHclLiteral(42)).toBe("42");
    expect(toHclLiteral([])).toBe("[]");
  });

  it("passes through references and var.* without quoting", () => {
    expect(toHclLiteral("aws_vpc.main.id")).toBe("aws_vpc.main.id");
    expect(toHclLiteral("var.project")).toBe("var.project");
  });

  it("quotes arbitrary strings", () => {
    expect(toHclLiteral("hello world")).toBe('"hello world"');
  });

  it("renders an array of objects as a pretty block", () => {
    const out = toHclLiteral([{ from_port: 80 }]);
    expect(out).toContain("from_port = 80");
    expect(out.startsWith("[")).toBe(true);
  });

  it("renders a scalar array inline", () => {
    expect(toHclLiteral(["a", "b"])).toBe('["a", "b"]');
  });
});
