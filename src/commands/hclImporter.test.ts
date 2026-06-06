import { describe, it, expect } from "vitest";
import { importHclBlocksToResources } from "./hclImporter";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { TerraformResource, ResourceOrigin } from "../models/terraform";

const schema = (terraformType: string, props: string[] = []): TerraformNodeSchema => ({
  id: terraformType,
  label: terraformType,
  schemaGroup: "resources",
  terraformType,
  terraformKind: "resource",
  icon: "",
  hclTemplate: "",
  properties: props.map((name) => ({ name }) as TerraformNodeSchema["properties"][number]),
  sourceSchemaPath: "",
  sourceTemplatePath: "",
  provider: "aws",
});

const existing = (
  type: string,
  name: string,
  origin: ResourceOrigin,
): TerraformResource => ({
  id: `${type}.${name}`,
  type,
  name,
  origin,
  config: { attributes: {}, blocks: {} },
  ui: { x: 0, y: 0, icon: "" },
});

const block = (type: string, name: string, attributes: Record<string, unknown> = {}) => ({
  kind: "resource" as const,
  type,
  name,
  attributes,
});

describe("importHclBlocksToResources", () => {
  it("creates a new resource and node for an unseen block", () => {
    const result = importHclBlocksToResources({
      parsedBlocks: [block("aws_vpc", "main", { cidr_block: "10.0.0.0/16" })],
      existingResources: [],
      existingNodes: [],
      schemas: [schema("aws_vpc", ["cidr_block"])],
    });
    expect(result.newResources).toHaveLength(1);
    expect(result.newResources[0].type).toBe("aws_vpc");
    expect(result.newResources[0].origin).toBe("imported-hcl");
    expect(result.newNodes).toHaveLength(1);
  });

  it("preserves a canvas-created resource (conflict, not overwritten)", () => {
    const result = importHclBlocksToResources({
      parsedBlocks: [block("aws_vpc", "main", { cidr_block: "10.0.0.0/8" })],
      existingResources: [existing("aws_vpc", "main", "canvas")],
      existingNodes: [],
      schemas: [schema("aws_vpc", ["cidr_block"])],
    });
    expect(result.conflicts).toHaveLength(1);
    expect(result.conflicts[0].existingOrigin).toBe("canvas");
    // Nothing was created or updated for the conflicting resource.
    expect(result.newResources).toHaveLength(0);
    expect(result.updatedResourceIds.size).toBe(0);
  });

  it("updates an existing imported-hcl resource in place", () => {
    const target = existing("aws_vpc", "main", "imported-hcl");
    const result = importHclBlocksToResources({
      parsedBlocks: [block("aws_vpc", "main", { cidr_block: "10.1.0.0/16" })],
      existingResources: [target],
      existingNodes: [],
      schemas: [schema("aws_vpc", ["cidr_block"])],
    });
    expect(result.updatedResourceIds.has(target.id)).toBe(true);
    expect(target.config.attributes.cidr_block).toBe("10.1.0.0/16");
    expect(result.newResources).toHaveLength(0);
  });

  it("deduplicates blocks with the same type.name and warns", () => {
    const result = importHclBlocksToResources({
      parsedBlocks: [
        block("aws_vpc", "main", { cidr_block: "10.0.0.0/16" }),
        block("aws_vpc", "main", { cidr_block: "10.2.0.0/16" }),
      ],
      existingResources: [],
      existingNodes: [],
      schemas: [schema("aws_vpc", ["cidr_block"])],
    });
    // Only the first block is imported.
    expect(result.newResources).toHaveLength(1);
    expect(result.newResources[0].config.attributes.cidr_block).toBe("10.0.0.0/16");
    expect(result.warnings.some((w) => w.reason.includes("Múltiples bloques"))).toBe(true);
  });

  it("warns and skips a block whose type is not in the catalog", () => {
    const result = importHclBlocksToResources({
      parsedBlocks: [block("aws_unknown", "x")],
      existingResources: [],
      existingNodes: [],
      schemas: [schema("aws_vpc")],
    });
    expect(result.newResources).toHaveLength(0);
    expect(result.warnings.some((w) => w.reason.includes("no encontrado"))).toBe(true);
  });

  it("flags an imported resource that was removed from the HCL as deleted", () => {
    const orphan = existing("aws_vpc", "gone", "imported-hcl");
    const result = importHclBlocksToResources({
      parsedBlocks: [],
      existingResources: [orphan],
      existingNodes: [],
      schemas: [schema("aws_vpc")],
    });
    expect(result.deletedResourceIds).toContain(orphan.id);
  });

  it("does not flag a canvas resource as deleted when absent from HCL", () => {
    const canvasRes = existing("aws_vpc", "kept", "canvas");
    const result = importHclBlocksToResources({
      parsedBlocks: [],
      existingResources: [canvasRes],
      existingNodes: [],
      schemas: [schema("aws_vpc")],
    });
    expect(result.deletedResourceIds).not.toContain(canvasRes.id);
  });
});
