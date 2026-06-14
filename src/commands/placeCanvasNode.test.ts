import { describe, it, expect } from "vitest";
import type { Node } from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";
import {
  getNodeSize,
  getAbsolutePosition,
  findContainerAtPoint,
  findBestContainerForNodeBounds,
  getDescendantNodeIds,
  getSubtreeFootprintSize,
  expandAncestorContainers,
} from "./placeCanvasNode";

type CanvasNode = Node<CanvasTerraformNodeData>;

const node = (
  id: string,
  opts: {
    x: number;
    y: number;
    width?: number;
    height?: number;
    isContainer?: boolean;
    parentNode?: string;
  },
): CanvasNode => ({
  id,
  type: "terraform",
  position: { x: opts.x, y: opts.y },
  parentNode: opts.parentNode,
  style:
    opts.width !== undefined && opts.height !== undefined
      ? { width: opts.width, height: opts.height }
      : undefined,
  data: {
    resourceId: id,
    schemaId: id,
    label: id,
    icon: "",
    terraformType: id,
    terraformKind: "resource",
    isContainer: opts.isContainer ?? false,
    containerKind: opts.isContainer ? "hierarchical" : undefined,
  },
});

describe("getNodeSize", () => {
  it("uses explicit style dimensions when present", () => {
    expect(getNodeSize(node("a", { x: 0, y: 0, width: 300, height: 200 }))).toEqual({
      width: 300,
      height: 200,
    });
  });

  it("falls back to the default resource size", () => {
    expect(getNodeSize(node("a", { x: 0, y: 0 }))).toEqual({ width: 176, height: 84 });
  });

  it("falls back to the default container size for containers", () => {
    expect(getNodeSize(node("c", { x: 0, y: 0, isContainer: true }))).toEqual({
      width: 340,
      height: 230,
    });
  });
});

describe("getAbsolutePosition", () => {
  it("returns the position directly for a top-level node", () => {
    const n = node("a", { x: 100, y: 50 });
    const map = new Map([[n.id, n]]);
    expect(getAbsolutePosition(n, map)).toEqual({ x: 100, y: 50 });
  });

  it("adds parent offsets for a nested node", () => {
    const parent = node("p", { x: 100, y: 100, width: 400, height: 400, isContainer: true });
    const child = node("c", { x: 30, y: 40, parentNode: "p" });
    const map = new Map([
      [parent.id, parent],
      [child.id, child],
    ]);
    expect(getAbsolutePosition(child, map)).toEqual({ x: 130, y: 140 });
  });
});

describe("findContainerAtPoint", () => {
  const outer = node("outer", { x: 0, y: 0, width: 600, height: 600, isContainer: true });
  const inner = node("inner", { x: 50, y: 50, width: 200, height: 200, isContainer: true });

  it("returns the smallest container that contains the point", () => {
    const found = findContainerAtPoint([outer, inner], { x: 100, y: 100 });
    expect(found?.id).toBe("inner");
  });

  it("returns the outer container when the point is outside the inner one", () => {
    const found = findContainerAtPoint([outer, inner], { x: 400, y: 400 });
    expect(found?.id).toBe("outer");
  });

  it("returns undefined when no container contains the point", () => {
    expect(findContainerAtPoint([outer, inner], { x: 5000, y: 5000 })).toBeUndefined();
  });
});

describe("findBestContainerForNodeBounds", () => {
  const container = node("c", { x: 0, y: 0, width: 400, height: 400, isContainer: true });

  it("selects a container when overlap is at or above MIN_OVERLAP_RATIO (0.35)", () => {
    // A 100x100 node centered far outside but overlapping ~36% of its own area.
    // Place it so 60x60 of its 100x100 area overlaps → 0.36 ratio.
    const found = findBestContainerForNodeBounds([container], { x: 340, y: 340 }, { width: 100, height: 100 });
    expect(found?.id).toBe("c");
  });

  it("rejects a container with overlap below the threshold and no pointer/center inside", () => {
    // Only a 20x20 corner overlaps a 100x100 node → 0.04 ratio, center outside.
    const found = findBestContainerForNodeBounds([container], { x: 380, y: 380 }, { width: 100, height: 100 });
    expect(found).toBeUndefined();
  });

  it("selects a container when the node center is inside it", () => {
    const found = findBestContainerForNodeBounds([container], { x: 150, y: 150 }, { width: 100, height: 100 });
    expect(found?.id).toBe("c");
  });
});

describe("getDescendantNodeIds", () => {
  it("collects the full descendant subtree", () => {
    const nodes = [
      node("root", { x: 0, y: 0, isContainer: true }),
      node("child", { x: 0, y: 0, parentNode: "root", isContainer: true }),
      node("grandchild", { x: 0, y: 0, parentNode: "child" }),
      node("unrelated", { x: 0, y: 0 }),
    ];
    const ids = getDescendantNodeIds(nodes, "root");
    expect(ids.has("child")).toBe(true);
    expect(ids.has("grandchild")).toBe(true);
    expect(ids.has("unrelated")).toBe(false);
  });
});

describe("getSubtreeFootprintSize", () => {
  it("grows the footprint to cover children that extend past the root", () => {
    const nodes = [
      node("root", { x: 0, y: 0, width: 200, height: 200, isContainer: true }),
      // A child whose right/bottom edge extends beyond the root bounds.
      node("child", { x: 150, y: 150, width: 200, height: 200, parentNode: "root" }),
    ];
    const size = getSubtreeFootprintSize(nodes, "root");
    // Child absolute right edge = 0 + 150 + 200 = 350 → width must reach 350.
    expect(size?.width).toBeGreaterThanOrEqual(350);
    expect(size?.height).toBeGreaterThanOrEqual(350);
  });
});

describe("expandAncestorContainers", () => {
  it("grows a parent container to fit a child that overflows it", () => {
    const nodes = [
      node("parent", { x: 0, y: 0, width: 340, height: 230, isContainer: true }),
      // Child placed so it extends past the parent's right/bottom edge.
      node("child", { x: 300, y: 200, width: 176, height: 84, parentNode: "parent" }),
    ];
    expandAncestorContainers(nodes, "child");
    const parent = nodes.find((n) => n.id === "parent")!;
    const size = getNodeSize(parent);
    // Required width = 300 + 176 + 20 padding = 496.
    expect(size.width).toBeGreaterThanOrEqual(496);
    expect(size.height).toBeGreaterThanOrEqual(304);
  });
});
