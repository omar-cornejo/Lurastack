import { describe, it, expect } from "vitest";
import { highlightHcl, highlightHclAttributeMode } from "./hclHighlight";

// These assert structural/semantic properties (escaping, token coloring, the
// editable-value wrapping) rather than the exact HTML string, which churns.

describe("highlightHcl", () => {
  it("escapes HTML special characters in the source", () => {
    const out = highlightHcl('x = "<b> & </b>"');
    expect(out).toContain("&lt;b&gt;");
    expect(out).toContain("&amp;");
    // No raw angle brackets from the source leak through as markup.
    expect(out).not.toContain("<b>");
  });

  it("wraps every token in a colored span", () => {
    const out = highlightHcl('region = "eu-west-1"');
    expect(out).toContain("<span");
    expect(out).toContain("</span>");
  });

  it("colors keywords with the keyword color", () => {
    const out = highlightHcl('resource "aws_vpc" "main" {}');
    // keyword color is #569cd6
    expect(out).toContain('<span style="color:#569cd6">resource</span>');
  });

  it("colors strings", () => {
    const out = highlightHcl('ami = "ami-123"');
    // string color is #ce9178
    expect(out).toContain("#ce9178");
  });

  it("colors booleans and null with the keyword/bool color", () => {
    expect(highlightHcl("enabled = true")).toContain('<span style="color:#569cd6">true</span>');
    expect(highlightHcl("x = null")).toContain('<span style="color:#569cd6">null</span>');
  });

  it("colors comments", () => {
    const out = highlightHcl("# a comment");
    // comment color is #6a9955
    expect(out).toContain("#6a9955");
  });

  it("treats a dotted identifier as a reference", () => {
    const out = highlightHcl("vpc_id = aws_vpc.main.id");
    // ref color is #9cdcfe
    expect(out).toContain('<span style="color:#9cdcfe">aws_vpc.main.id</span>');
  });

  it("does not treat == as an attribute assignment", () => {
    // `foo` before `==` must not be highlighted as an attribute key.
    const out = highlightHcl("foo == bar");
    expect(out).not.toContain('<span style="color:#9cdcfe">foo</span>');
  });
});

describe("highlightHclAttributeMode", () => {
  it("dims structural lines and emphasizes editable values", () => {
    const src = ['resource "aws_vpc" "main" {', '  cidr_block = "10.0.0.0/16"', "}"].join("\n");
    const out = highlightHclAttributeMode(src);
    // The header line is dimmed.
    expect(out).toContain("opacity:0.35");
    // The value zone gets the editable highlight background.
    expect(out).toContain("background:rgba(96,165,250,0.10)");
  });

  it("appends a type hint when a resolver is provided", () => {
    const src = ['resource "aws_vpc" "main" {', '  cidr_block = "10.0.0.0/16"', "}"].join("\n");
    const out = highlightHclAttributeMode(src, (_header, _path, attr) =>
      attr === "cidr_block" ? "string" : undefined,
    );
    expect(out).toContain(": string");
  });

  it("escapes the source safely", () => {
    const out = highlightHclAttributeMode('resource "x" "y" {\n  a = "<i>"\n}');
    expect(out).toContain("&lt;i&gt;");
  });
});
