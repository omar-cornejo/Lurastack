import { describe, it, expect } from "vitest";
import {
  getInspectorPropertiesForSchema,
  formatTypeLabel,
  getValuePlaceholder,
} from "./schemaInspector";
import type { TerraformNodeSchema } from "../models/nodeRegistry";

const schema = (props: TerraformNodeSchema["properties"]): TerraformNodeSchema => ({
  id: "aws_test",
  label: "Test",
  schemaGroup: "resources",
  terraformType: "aws_test",
  terraformKind: "resource",
  icon: "",
  hclTemplate: "",
  properties: props,
  // No matching schema document on disk → falls back to `properties`.
  sourceSchemaPath: "schemas/aws/resources/__nonexistent__.json",
  sourceTemplatePath: "",
  provider: "aws",
});

describe("getInspectorPropertiesForSchema", () => {
  it("returns [] for an undefined schema", () => {
    expect(getInspectorPropertiesForSchema(undefined)).toEqual([]);
  });

  it("falls back to schema.properties when no schema document is found", () => {
    const props = getInspectorPropertiesForSchema(
      schema([
        { name: "cidr_block", type: "string", required: true } as TerraformNodeSchema["properties"][number],
        { name: "tags", type: "map", computed: false } as TerraformNodeSchema["properties"][number],
      ]),
    );
    expect(props.map((p) => p.name)).toContain("cidr_block");
    const cidr = props.find((p) => p.name === "cidr_block");
    expect(cidr?.required).toBe(true);
    expect(cidr?.optional).toBe(false);
  });
});

describe("formatTypeLabel", () => {
  it("returns a plain string type as-is", () => {
    expect(formatTypeLabel("string")).toBe("string");
  });

  it("returns 'any' for empty or non-string containers", () => {
    expect(formatTypeLabel([])).toBe("any");
    expect(formatTypeLabel(null)).toBe("any");
    expect(formatTypeLabel([123])).toBe("any");
  });

  it("formats a container with an inner string type", () => {
    expect(formatTypeLabel(["list", "string"])).toBe("list(string)");
  });

  it("formats nested containers recursively", () => {
    expect(formatTypeLabel(["list", ["set", "string"]])).toBe("list(set(string))");
  });

  it("summarizes object types and truncates after 3 fields", () => {
    const label = formatTypeLabel(["object", { a: "string", b: "number", c: "bool", d: "string" }]);
    expect(label).toContain("object({");
    expect(label).toContain("+1");
  });
});

describe("getValuePlaceholder", () => {
  it("provides placeholders for primitive types", () => {
    expect(getValuePlaceholder("string")).toBe('"value"');
    expect(getValuePlaceholder("number")).toBe("0");
    expect(getValuePlaceholder("bool")).toBe("true");
  });

  it("provides placeholders for collection containers", () => {
    expect(getValuePlaceholder(["list", "string"])).toBe('["value"]');
    expect(getValuePlaceholder(["set", "string"])).toBe('["value"]');
    expect(getValuePlaceholder(["map", "string"])).toBe('{key = "value"}');
  });

  it("returns an empty placeholder for unknown types", () => {
    expect(getValuePlaceholder("custom")).toBe("");
    expect(getValuePlaceholder([])).toBe("");
  });
});
