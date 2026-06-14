import { describe, it, expect } from "vitest";
import {
  createCanvasNodeFromUserAction,
  DEFAULT_CONTAINER_SIZE,
  DEFAULT_RESOURCE_NODE_SIZE,
} from "./createCanvasNode";
import type { TerraformNodeSchema } from "../models/nodeRegistry";

const schema = (id: string, terraformType = id): TerraformNodeSchema => ({
  id,
  label: id,
  schemaGroup: "resources",
  terraformType,
  terraformKind: "resource",
  icon: "icon.svg",
  hclTemplate: "",
  properties: [],
  sourceSchemaPath: "",
  sourceTemplatePath: "",
  provider: "aws",
});

describe("createCanvasNodeFromUserAction", () => {
  it("creates a resource node with resource size and zIndex 10", () => {
    const node = createCanvasNodeFromUserAction(schema("aws_instance"), 0);
    expect(node.data.isContainer).toBe(false);
    expect(node.zIndex).toBe(10);
    expect(node.dragHandle).toBeUndefined();
    expect(node.style).toMatchObject({
      width: DEFAULT_RESOURCE_NODE_SIZE.width,
      height: DEFAULT_RESOURCE_NODE_SIZE.height,
    });
  });

  it("creates a hierarchical container node for a container schema", () => {
    const node = createCanvasNodeFromUserAction(schema("aws_vpc"), 0);
    expect(node.data.isContainer).toBe(true);
    expect(node.data.containerKind).toBe("hierarchical");
    expect(node.zIndex).toBe(0);
    expect(node.dragHandle).toBe(".container-drag-handle");
    expect(node.style).toMatchObject({
      width: DEFAULT_CONTAINER_SIZE.width,
      height: DEFAULT_CONTAINER_SIZE.height,
    });
  });

  it("classifies a zone container", () => {
    const node = createCanvasNodeFromUserAction(schema("aws_security_group"), 0);
    expect(node.data.isContainer).toBe(true);
    expect(node.data.containerKind).toBe("zone");
  });

  it("honors an explicit position, resourceId and displayLabel", () => {
    const node = createCanvasNodeFromUserAction(
      schema("aws_instance"),
      0,
      { x: 42, y: 99 },
      "res-1",
      "My Server",
    );
    expect(node.position).toEqual({ x: 42, y: 99 });
    expect(node.data.resourceId).toBe("res-1");
    expect(node.data.label).toBe("My Server");
  });

  it("copies schema metadata into node data", () => {
    const node = createCanvasNodeFromUserAction(schema("aws_instance"), 0);
    expect(node.data.terraformType).toBe("aws_instance");
    expect(node.data.icon).toBe("icon.svg");
    expect(node.id).toBeTruthy();
  });
});
