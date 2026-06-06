import { describe, it, expect } from "vitest";
import type { Node, Edge } from "reactflow";
import type { CanvasTerraformNodeData, CanvasEdgeData } from "../canvas/types";
import type { ViewSnapshot } from "../types/project";
import {
  projectNameToSlug,
  projectNameToFileName,
  viewNameToFolderName,
  getProjectDir,
  getViewsDir,
  getViewDir,
  snapshotNodes,
  snapshotEdges,
  restoreNodes,
  restoreEdges,
  createEmptyProject,
  buildProjectSnapshot,
} from "./projectManager";

// projectManager transitively imports Tauri fs/dialog/core; those are stubbed
// globally in vitest.setup.ts, so the module loads. We assert only the pure
// (non-I/O) utilities here.

describe("name normalization", () => {
  it("slugifies a project name to a filesystem-safe form", () => {
    expect(projectNameToSlug("My Cool Project!")).toBe("my-cool-project");
    expect(projectNameToSlug("  spaced  out  ")).toBe("spaced-out");
  });

  it("falls back to 'project' for an empty/symbol-only name", () => {
    expect(projectNameToSlug("")).toBe("project");
    expect(projectNameToSlug("@#$")).toBe("project");
  });

  it("appends the .lura extension", () => {
    expect(projectNameToFileName("My Project")).toBe("my-project.lura");
  });

  it("slugifies view folder names, falling back to 'view'", () => {
    expect(viewNameToFolderName("Production VPC")).toBe("production-vpc");
    expect(viewNameToFolderName("***")).toBe("view");
  });
});

describe("path helpers", () => {
  it("derives the project dir from a .lura file path", () => {
    expect(getProjectDir("/home/user/projects/demo/demo.lura")).toBe(
      "/home/user/projects/demo",
    );
  });

  it("normalizes windows separators", () => {
    expect(getProjectDir("C:\\projects\\demo\\demo.lura")).toBe("C:/projects/demo");
  });

  it("builds the views directory paths", () => {
    expect(getViewsDir("/p/demo")).toBe("/p/demo/views");
    expect(getViewDir("/p/demo", "Prod VPC")).toBe("/p/demo/views/prod-vpc");
  });
});

describe("snapshot/restore round-trip", () => {
  it("round-trips nodes", () => {
    const nodes: Node<CanvasTerraformNodeData>[] = [
      {
        id: "n1",
        type: "terraform",
        position: { x: 10, y: 20 },
        parentNode: "c1",
        extent: "parent",
        width: 176,
        height: 84,
        data: {
          resourceId: "r1",
          schemaId: "aws_vpc",
          label: "VPC",
          icon: "",
          terraformType: "aws_vpc",
          terraformKind: "resource",
          isContainer: false,
        },
      },
    ];
    const restored = restoreNodes(snapshotNodes(nodes));
    expect(restored[0].id).toBe("n1");
    expect(restored[0].position).toEqual({ x: 10, y: 20 });
    expect(restored[0].parentNode).toBe("c1");
    expect(restored[0].extent).toBe("parent");
    expect(restored[0].data.terraformType).toBe("aws_vpc");
  });

  it("coerces missing edge handles to null on restore", () => {
    const edges: Edge<CanvasEdgeData>[] = [
      { id: "e1", source: "a", target: "b", type: "mapping" } as Edge<CanvasEdgeData>,
    ];
    const restored = restoreEdges(snapshotEdges(edges));
    expect(restored[0].sourceHandle).toBeNull();
    expect(restored[0].targetHandle).toBeNull();
  });
});

describe("createEmptyProject", () => {
  it("creates a v1 project with one view set as active", () => {
    const project = createEmptyProject("Demo");
    expect(project.version).toBe("1");
    expect(project.meta.name).toBe("Demo");
    expect(project.views).toHaveLength(1);
    expect(project.activeViewId).toBe(project.views[0].id);
    expect(project.views[0].resources).toEqual([]);
  });

  it("gives each project a distinct view id", () => {
    expect(createEmptyProject("A").activeViewId).not.toBe(createEmptyProject("B").activeViewId);
  });
});

describe("buildProjectSnapshot", () => {
  it("replaces views with their snapshots and bumps updatedAt", () => {
    const project = createEmptyProject("Demo");
    const viewId = project.views[0].id;
    const snap: ViewSnapshot = {
      ...project.views[0],
      name: "Renamed View",
    };
    const result = buildProjectSnapshot(project, new Map([[viewId, snap]]));
    expect(result.views[0].name).toBe("Renamed View");
    expect(result.meta.updatedAt >= project.meta.updatedAt).toBe(true);
  });

  it("keeps the original view when no snapshot is provided", () => {
    const project = createEmptyProject("Demo");
    const result = buildProjectSnapshot(project, new Map());
    expect(result.views[0].id).toBe(project.views[0].id);
  });
});
