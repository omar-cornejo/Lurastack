import { describe, it, expect } from "vitest";
import { parseMainTfBlocks, buildHclFromResource } from "./hclBlocks";
import { terraformResourceToHCL } from "../models/hclEmitter";
import type { TerraformResource } from "../models/terraform";

const resource = (
  type: string,
  name: string,
  attributes: Record<string, unknown>,
  kind: "resource" | "data" = "resource",
): TerraformResource => ({
  id: `${type}.${name}`,
  kind,
  type,
  name,
  config: { attributes, blocks: {} },
  ui: { x: 0, y: 0, icon: "" },
});

describe("parseMainTfBlocks", () => {
  it("parses a single resource block into kind/type/name/attributes", () => {
    const hcl = 'resource "aws_instance" "web" {\n  ami = "ami-123"\n}';
    const blocks = parseMainTfBlocks(hcl);
    expect(blocks).toHaveLength(1);
    expect(blocks[0]).toMatchObject({ kind: "resource", type: "aws_instance", name: "web" });
    expect(blocks[0].attributes.ami).toBe('"ami-123"');
  });

  it("recognizes data blocks", () => {
    const blocks = parseMainTfBlocks('data "aws_ami" "ubuntu" {\n  most_recent = true\n}');
    expect(blocks[0].kind).toBe("data");
  });

  it("collects repeated named blocks into an array", () => {
    const hcl = [
      'resource "aws_security_group" "web" {',
      "  ingress {",
      "    from_port = 80",
      "  }",
      "  ingress {",
      "    from_port = 443",
      "  }",
      "}",
    ].join("\n");
    const ingress = parseMainTfBlocks(hcl)[0].attributes.ingress as unknown[];
    expect(ingress).toHaveLength(2);
  });

  it("turns a single nested block into a one-element array (round-trip safe)", () => {
    const hcl = 'resource "x" "y" {\n  tags {\n    Name = "n"\n  }\n}';
    const tags = parseMainTfBlocks(hcl)[0].attributes.tags as unknown[];
    expect(Array.isArray(tags)).toBe(true);
    expect(tags).toHaveLength(1);
  });

  it("ignores provider and non-block lines", () => {
    const hcl = 'provider "aws" {\n  region = "x"\n}\nresource "aws_vpc" "v" {\n  cidr = "10.0.0.0/16"\n}';
    const blocks = parseMainTfBlocks(hcl);
    expect(blocks).toHaveLength(1);
    expect(blocks[0].type).toBe("aws_vpc");
  });
});

describe("buildHclFromResource", () => {
  it("renders top-level scalar attributes", () => {
    const hcl = buildHclFromResource(resource("aws_vpc", "main", { cidr_block: "10.0.0.0/16" }));
    expect(hcl.startsWith('resource "aws_vpc" "main" {')).toBe(true);
    expect(hcl).toContain('cidr_block = "10.0.0.0/16"');
  });

  it("turns a dotted key into a nested block", () => {
    const hcl = buildHclFromResource(
      resource("aws_lb_listener", "f", { "default_action.type": "forward" }),
    );
    expect(hcl).toMatch(/default_action \{/);
    expect(hcl).toContain('type = "forward"');
    expect(hcl).not.toContain("default_action.type =");
  });

  it("prunes meaningless values", () => {
    const hcl = buildHclFromResource(resource("aws_vpc", "m", { cidr_block: "10.0.0.0/16", empty: "" }));
    expect(hcl).not.toContain("empty");
  });
});

describe("emitter ↔ parser round-trip", () => {
  it("parseMainTfBlocks recovers the attributes emitted by terraformResourceToHCL", () => {
    const r = resource("aws_vpc", "main", { cidr_block: "10.0.0.0/16", enable_dns_support: true });
    const hcl = terraformResourceToHCL(r);
    const parsed = parseMainTfBlocks(hcl);
    expect(parsed).toHaveLength(1);
    expect(parsed[0].type).toBe("aws_vpc");
    expect(parsed[0].name).toBe("main");
    expect(parsed[0].attributes.cidr_block).toBe('"10.0.0.0/16"');
    expect(parsed[0].attributes.enable_dns_support).toBe("true");
  });
});
