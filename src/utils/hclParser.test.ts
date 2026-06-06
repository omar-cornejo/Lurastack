import { describe, it, expect } from "vitest";
import {
  extractProviderFromHcl,
  extractManualSegments,
  mergeWithManualCode,
  hasManualContent,
  extractResourceBlocks,
} from "./hclParser";

describe("extractProviderFromHcl", () => {
  it("extracts provider name and region", () => {
    const hcl = 'provider "aws" {\n  region = "eu-west-1"\n}';
    const info = extractProviderFromHcl(hcl);
    expect(info).not.toBeNull();
    expect(info?.name).toBe("aws");
    expect(info?.region).toBe("eu-west-1");
  });

  it("normalizes the google provider name to gcp", () => {
    const hcl = 'provider "google" {\n  region = "europe-west1"\n}';
    expect(extractProviderFromHcl(hcl)?.name).toBe("gcp");
  });

  it("returns null when there is no provider block", () => {
    expect(extractProviderFromHcl('resource "aws_vpc" "x" {}')).toBeNull();
  });

  it("captures custom config lines, excluding region", () => {
    const hcl = 'provider "google" {\n  region = "europe-west1"\n  project = "my-proj"\n}';
    const info = extractProviderFromHcl(hcl);
    expect(info?.region).toBe("europe-west1");
    expect(info?.customConfig).toContain('project = "my-proj"');
    expect(info?.customConfig).not.toContain("region");
  });
});

describe("extractManualSegments", () => {
  it("collects comment lines", () => {
    const hcl = '# my note\nprovider "aws" {\n  region = "eu-west-1"\n}';
    const segments = extractManualSegments(hcl, "");
    expect(segments.comments).toContain("# my note");
  });

  it("surfaces custom provider config", () => {
    const hcl = 'provider "google" {\n  region = "europe-west1"\n  project = "p"\n}';
    const segments = extractManualSegments(hcl, "");
    expect(segments.customProviderConfig).toContain('project = "p"');
  });

  it("returns empty segments for a comment-free generated-only HCL", () => {
    const hcl = 'provider "aws" {\n  region = "eu-west-1"\n}';
    const segments = extractManualSegments(hcl, "");
    expect(segments.comments).toHaveLength(0);
  });
});

describe("mergeWithManualCode", () => {
  it("prepends preserved comments above the generated HCL", () => {
    const generated = 'provider "aws" {\n  region = "eu-west-1"\n}';
    const merged = mergeWithManualCode(generated, {
      comments: ["# kept comment"],
      customProviderConfig: "",
      preProviderContent: "",
      postResourcesContent: "",
    });
    expect(merged.startsWith("# kept comment")).toBe(true);
    expect(merged).toContain('provider "aws"');
  });

  it("appends post-resources content at the end", () => {
    const generated = 'resource "aws_vpc" "main" {\n  cidr_block = "10.0.0.0/16"\n}';
    const merged = mergeWithManualCode(generated, {
      comments: [],
      customProviderConfig: "",
      preProviderContent: "",
      postResourcesContent: 'output "vpc_id" {\n  value = aws_vpc.main.id\n}',
    });
    expect(merged).toContain('output "vpc_id"');
    expect(merged.indexOf("output")).toBeGreaterThan(merged.indexOf("resource"));
  });

  it("is a no-op when there are no manual segments", () => {
    const generated = 'provider "aws" {\n  region = "eu-west-1"\n}';
    const merged = mergeWithManualCode(generated, {
      comments: [],
      customProviderConfig: "",
      preProviderContent: "",
      postResourcesContent: "",
    });
    expect(merged).toBe(generated);
  });
});

describe("hasManualContent", () => {
  it("is true when the HCL has comments", () => {
    expect(hasManualContent('# user note\nprovider "aws" {}')).toBe(true);
  });

  it("is false for plain generated HCL with few resources", () => {
    const hcl = 'provider "aws" {\n  region = "eu-west-1"\n}\nresource "aws_vpc" "main" {}';
    expect(hasManualContent(hcl)).toBe(false);
  });

  it("is true when there are many resource blocks", () => {
    const many = Array.from({ length: 11 }, (_, i) => `resource "aws_vpc" "v${i}" {}`).join("\n");
    expect(hasManualContent(many)).toBe(true);
  });
});

describe("extractResourceBlocks", () => {
  it("keeps only resource blocks", () => {
    const hcl = [
      'provider "aws" {',
      '  region = "eu-west-1"',
      "}",
      'resource "aws_vpc" "main" {',
      '  cidr_block = "10.0.0.0/16"',
      "}",
    ].join("\n");
    const blocks = extractResourceBlocks(hcl);
    expect(blocks).toContain('resource "aws_vpc" "main"');
    expect(blocks).not.toContain("provider");
  });

  it("returns empty string when there are no resources", () => {
    expect(extractResourceBlocks('provider "aws" {\n  region = "x"\n}')).toBe("");
  });
});
