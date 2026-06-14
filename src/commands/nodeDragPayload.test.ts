import { describe, it, expect } from "vitest";
import { serializeDraggedNode, parseDraggedNode } from "./nodeDragPayload";
import type { TerraformNodeSchema } from "../models/nodeRegistry";

const schema = (): TerraformNodeSchema => ({
  id: "aws_vpc",
  label: "Vpc",
  schemaGroup: "resources",
  terraformType: "aws_vpc",
  terraformKind: "resource",
  icon: "",
  hclTemplate: "",
  properties: [],
  sourceSchemaPath: "",
  sourceTemplatePath: "",
  provider: "aws",
});

describe("nodeDragPayload", () => {
  it("round-trips a schema through serialize/parse", () => {
    const parsed = parseDraggedNode(serializeDraggedNode(schema()));
    expect(parsed?.id).toBe("aws_vpc");
    expect(parsed?.terraformType).toBe("aws_vpc");
    expect(parsed?.label).toBe("Vpc");
  });

  it("returns null for invalid JSON", () => {
    expect(parseDraggedNode("{not json")).toBeNull();
    expect(parseDraggedNode("")).toBeNull();
  });

  it("returns null when required fields are missing", () => {
    expect(parseDraggedNode(JSON.stringify({ terraformType: "x", label: "y" }))).toBeNull();
    expect(parseDraggedNode(JSON.stringify({ id: "x", label: "y" }))).toBeNull();
    expect(parseDraggedNode(JSON.stringify({ id: "x", terraformType: "y" }))).toBeNull();
  });
});
