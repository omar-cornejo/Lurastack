import { describe, it, expect } from "vitest";
import { createTerraformResourceFromSchema } from "./createTerraformResource";
import type { TerraformNodeSchema } from "../nodeRegistry";

const schema = (): TerraformNodeSchema => ({
  id: "aws_vpc",
  label: "Vpc",
  schemaGroup: "resources",
  terraformType: "aws_vpc",
  terraformKind: "resource",
  icon: "vpc.svg",
  hclTemplate: "resource \"aws_vpc\" \"x\" {}",
  properties: [],
  sourceSchemaPath: "",
  sourceTemplatePath: "",
  provider: "aws",
});

describe("createTerraformResourceFromSchema", () => {
  it("maps schema fields onto a fresh resource", () => {
    const r = createTerraformResourceFromSchema(schema(), "main");
    expect(r.type).toBe("aws_vpc");
    expect(r.kind).toBe("resource");
    expect(r.name).toBe("main");
    expect(r.schemaId).toBe("aws_vpc");
    expect(r.hclTemplate).toBe('resource "aws_vpc" "x" {}');
    expect(r.ui.icon).toBe("vpc.svg");
    expect(r.id).toBeTruthy();
  });

  it("initializes empty config blocks", () => {
    const r = createTerraformResourceFromSchema(schema(), "main");
    expect(r.config).toEqual({ attributes: {}, blocks: {} });
  });

  it("defaults origin to canvas and honors an override", () => {
    expect(createTerraformResourceFromSchema(schema(), "a").origin).toBe("canvas");
    expect(createTerraformResourceFromSchema(schema(), "a", "imported-hcl").origin).toBe(
      "imported-hcl",
    );
  });

  it("gives each resource a distinct id", () => {
    const a = createTerraformResourceFromSchema(schema(), "a");
    const b = createTerraformResourceFromSchema(schema(), "b");
    expect(a.id).not.toBe(b.id);
  });
});
