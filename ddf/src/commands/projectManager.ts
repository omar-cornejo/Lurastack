import {
  readTextFile,
  writeTextFile,
  BaseDirectory,
} from "@tauri-apps/plugin-fs";
import { open, save } from "@tauri-apps/plugin-dialog";
import type { DdfProject, DdfViewSnapshot, RecentProject } from "../types/project";
import type { Node, Edge } from "reactflow";
import type { CanvasTerraformNodeData, CanvasEdgeData } from "../canvas/types";
import type { DdfSerializedNode, DdfSerializedEdge } from "../types/project";

// ── Tauri detection ──────────────────────────────────────────────────────────

const isTauri = () =>
  typeof window !== "undefined" &&
  !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

// ── Recent projects (localStorage) ──────────────────────────────────────────

const RECENT_KEY = "ddf:recent-projects";
const MAX_RECENT = 12;

export function getRecentProjects(): RecentProject[] {
  try {
    const raw = localStorage.getItem(RECENT_KEY);
    if (!raw) return [];
    return JSON.parse(raw) as RecentProject[];
  } catch {
    return [];
  }
}

export function addToRecent(entry: RecentProject): void {
  const list = getRecentProjects().filter((p) => p.path !== entry.path);
  list.unshift(entry);
  localStorage.setItem(RECENT_KEY, JSON.stringify(list.slice(0, MAX_RECENT)));
}

export function removeFromRecent(path: string): void {
  const list = getRecentProjects().filter((p) => p.path !== path);
  localStorage.setItem(RECENT_KEY, JSON.stringify(list));
}

// ── File I/O ─────────────────────────────────────────────────────────────────

export async function saveProjectToPath(
  project: DdfProject,
  absolutePath: string,
): Promise<void> {
  const updated: DdfProject = {
    ...project,
    meta: { ...project.meta, updatedAt: new Date().toISOString() },
  };
  const json = JSON.stringify(updated, null, 2);

  if (isTauri()) {
    // absolutePath: write without baseDir
    await writeTextFile(absolutePath, json);
  } else {
    // Browser fallback: download
    const blob = new Blob([json], { type: "application/json" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = absolutePath.split(/[\\/]/).pop() ?? "project.ddf";
    a.click();
    URL.revokeObjectURL(url);
  }

  addToRecent({
    name: updated.meta.name,
    path: absolutePath,
    updatedAt: updated.meta.updatedAt,
  });
}

export async function loadProjectFromPath(absolutePath: string): Promise<DdfProject> {
  const json = await readTextFile(absolutePath);
  const project = JSON.parse(json) as DdfProject;

  addToRecent({
    name: project.meta.name,
    path: absolutePath,
    updatedAt: project.meta.updatedAt,
  });

  return project;
}

// ── Native dialog pickers ────────────────────────────────────────────────────

/**
 * Opens a "Save As" dialog and returns the chosen absolute path, or null if cancelled.
 */
export async function pickSavePath(defaultName: string): Promise<string | null> {
  if (!isTauri()) return null;
  const result = await save({
    title: "Save project",
    filters: [{ name: "DDF Project", extensions: ["ddf"] }],
    defaultPath: defaultName,
  });
  return result ?? null;
}

/**
 * Opens an "Open file" dialog and returns the chosen absolute path, or null if cancelled.
 */
export async function pickOpenPath(): Promise<string | null> {
  if (!isTauri()) return null;
  const result = await open({
    title: "Open project",
    filters: [{ name: "DDF Project", extensions: ["ddf"] }],
    multiple: false,
    directory: false,
  });
  if (!result) return null;
  return typeof result === "string" ? result : result[0] ?? null;
}

// ── AppData fallback (used only for legacy / when no path is set) ────────────

export async function saveProjectToAppData(
  project: DdfProject,
  fileName: string,
): Promise<void> {
  const updated: DdfProject = {
    ...project,
    meta: { ...project.meta, updatedAt: new Date().toISOString() },
  };
  const json = JSON.stringify(updated, null, 2);
  await writeTextFile(`ddf-projects/${fileName}`, json, {
    baseDir: BaseDirectory.AppData,
  });
}

// ── Snapshot helpers ─────────────────────────────────────────────────────────

export function snapshotNodes(
  nodes: Node<CanvasTerraformNodeData>[],
): DdfSerializedNode[] {
  return nodes.map((n) => ({
    id: n.id,
    type: n.type,
    position: { x: n.position.x, y: n.position.y },
    data: { ...n.data },
    parentNode: n.parentNode,
    extent: n.extent === "parent" ? "parent" : undefined,
    width: typeof n.width === "number" ? n.width : undefined,
    height: typeof n.height === "number" ? n.height : undefined,
    style: n.style ? (n.style as Record<string, unknown>) : undefined,
  }));
}

export function snapshotEdges(edges: Edge<CanvasEdgeData>[]): DdfSerializedEdge[] {
  return edges.map((e) => ({
    id: e.id,
    source: e.source,
    target: e.target,
    sourceHandle: e.sourceHandle,
    targetHandle: e.targetHandle,
    type: e.type,
    data: e.data,
  }));
}

export function restoreNodes(
  serialized: DdfSerializedNode[],
): Node<CanvasTerraformNodeData>[] {
  return serialized.map((n) => ({
    id: n.id,
    type: n.type,
    position: n.position,
    data: n.data,
    parentNode: n.parentNode,
    extent: n.extent,
    width: n.width,
    height: n.height,
    style: n.style,
  }));
}

export function restoreEdges(
  serialized: DdfSerializedEdge[],
): Edge<CanvasEdgeData>[] {
  return serialized.map((e) => ({
    id: e.id,
    source: e.source,
    target: e.target,
    sourceHandle: e.sourceHandle ?? null,
    targetHandle: e.targetHandle ?? null,
    type: e.type,
    data: e.data,
  }));
}

// ── Project factory ──────────────────────────────────────────────────────────

export function createEmptyProject(name: string): DdfProject {
  const viewId = crypto.randomUUID();
  const now = new Date().toISOString();
  return {
    version: "1",
    meta: { name, createdAt: now, updatedAt: now },
    settings: { autosave: false },
    activeViewId: viewId,
    views: [{ id: viewId, name: "View 1", resources: [], nodes: [], edges: [] }],
  };
}

export function buildProjectSnapshot(
  project: DdfProject,
  viewSnapshots: Map<string, DdfViewSnapshot>,
): DdfProject {
  const views = project.views.map((v) => viewSnapshots.get(v.id) ?? v);
  return {
    ...project,
    views,
    meta: { ...project.meta, updatedAt: new Date().toISOString() },
  };
}

export function projectNameToFileName(name: string): string {
  const slug = name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
  return (slug || "project") + ".ddf";
}
