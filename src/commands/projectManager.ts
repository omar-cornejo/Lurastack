import {
  readTextFile,
  readDir,
  writeTextFile,
  remove,
  rename,
  mkdir,
  exists,
  BaseDirectory,
} from "@tauri-apps/plugin-fs";
import { open } from "@tauri-apps/plugin-dialog";
import { invoke } from "@tauri-apps/api/core";
import type { LuraProject, ViewSnapshot, RecentProject } from "../types/project";
import type { Node, Edge } from "reactflow";
import type { CanvasTerraformNodeData, CanvasEdgeData } from "../canvas/types";
import type { SerializedNode, SerializedEdge } from "../types/project";

const isTauri = () =>
  typeof window !== "undefined" &&
  !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

const RECENT_KEY = "lurastack:recent-projects";
const MAX_RECENT = 12;

/**
 * Grant the backend filesystem scope access to a project folder. Must be called
 * before any read/write/mkdir inside that folder, since project folders are not
 * in the static capability scope — access is granted dynamically per folder the
 * user opens or creates. The grant is persisted and reapplied on next launch.
 * No-op in the browser (no Tauri backend).
 */
export async function grantProjectAccess(projectDir: string): Promise<void> {
  if (!isTauri()) return;
  await invoke("grant_project_access", { path: projectDir });
}

export function getRecentProjects(): RecentProject[] {
  try {
    const raw = localStorage.getItem(RECENT_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw) as Array<Partial<RecentProject>>;
    return parsed
      .filter((entry): entry is RecentProject =>
        typeof entry?.name === "string" &&
        typeof entry?.path === "string" &&
        typeof entry?.updatedAt === "string",
      )
      .sort((left, right) => right.updatedAt.localeCompare(left.updatedAt));
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

export async function saveProjectToPath(
  project: LuraProject,
  absolutePath: string,
): Promise<void> {
  const updated: LuraProject = {
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
    a.download = absolutePath.split(/[\\/]/).pop() ?? "project.lura";
    a.click();
    URL.revokeObjectURL(url);
  }

  addToRecent({
    name: updated.meta.name,
    path: absolutePath,
    updatedAt: updated.meta.updatedAt,
  });
}

export async function loadProjectFromPath(absolutePath: string): Promise<LuraProject> {
  // Grant access to the project folder before reading anything inside it
  // (main.tf, history, view files). The .lura path passed here may come from
  // the native dialog (temporarily granted) or from the recents list (not
  // granted yet) — granting the parent dir covers both and all sibling files.
  await grantProjectAccess(getProjectDir(absolutePath));
  const json = await readTextFile(absolutePath);
  const project = JSON.parse(json) as LuraProject;

  addToRecent({
    name: project.meta.name,
    path: absolutePath,
    updatedAt: project.meta.updatedAt,
  });

  return project;
}

/**
 * Opens a directory picker, creates a <slug>/ subfolder, and returns the .lura path inside it.
 * Returns null if cancelled.
 */
export async function pickSavePath(projectName: string): Promise<string | null> {
  if (!isTauri()) return null;
  const result = await open({
    title: "Choose project location",
    directory: true,
    multiple: false,
  });
  if (!result) return null;
  const parentDir = typeof result === "string" ? result : (result as string[])[0];
  if (!parentDir) return null;
  const slug = projectNameToSlug(projectName);
  const projectDir = `${parentDir}/${slug}`;
  await grantProjectAccess(projectDir);
  await mkdir(projectDir, { recursive: true });
  return `${projectDir}/${slug}.lura`;
}

export function getProjectDir(projectPath: string): string {
  const normalized = projectPath.replace(/\\/g, "/");
  const parts = normalized.split("/");
  parts.pop();
  return parts.join("/");
}

export async function writeMainTf(projectDir: string, hclContent: string): Promise<void> {
  await writeTextFile(`${projectDir}/main.tf`, hclContent);
}

export async function syncAuxiliaryTfFiles(
  projectDir: string,
  files: Array<{ name: string; content: string }>,
): Promise<void> {
  const desiredFiles = files
    .map((file) => {
      const trimmed = file.name.trim();
      const normalized = trimmed.toLowerCase().endsWith(".tf") ? trimmed : `${trimmed}.tf`;
      return { name: normalized, content: file.content };
    })
    .filter((file) => file.name.toLowerCase() !== "main.tf");

  const desiredNames = new Set(desiredFiles.map((file) => file.name));

  const entries = await readDir(projectDir);
  const existingTfNames = entries
    .filter((entry) => entry.isFile && typeof entry.name === "string")
    .map((entry) => entry.name as string)
    .filter((name) => name.toLowerCase().endsWith(".tf") && name.toLowerCase() !== "main.tf");

  await Promise.all(
    existingTfNames
      .filter((name) => !desiredNames.has(name))
      .map((name) => remove(`${projectDir}/${name}`)),
  );

  await Promise.all(
    desiredFiles.map((file) => writeTextFile(`${projectDir}/${file.name}`, file.content)),
  );
}

/**
 * Opens an "Open file" dialog and returns the chosen absolute path, or null if cancelled.
 */
export async function pickOpenPath(): Promise<string | null> {
  if (!isTauri()) return null;
  const result = await open({
    title: "Open project",
    filters: [{ name: "LuraStack Project", extensions: ["lura"] }],
    multiple: false,
    directory: false,
  });
  if (!result) return null;
  return typeof result === "string" ? result : result[0] ?? null;
}

// AppData fallback: used only for legacy projects or when no path is set.
export async function saveProjectToAppData(
  project: LuraProject,
  fileName: string,
): Promise<void> {
  const updated: LuraProject = {
    ...project,
    meta: { ...project.meta, updatedAt: new Date().toISOString() },
  };
  const json = JSON.stringify(updated, null, 2);
  await writeTextFile(`lurastack-projects/${fileName}`, json, {
    baseDir: BaseDirectory.AppData,
  });
}

export function snapshotNodes(
  nodes: Node<CanvasTerraformNodeData>[],
): SerializedNode[] {
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

export function snapshotEdges(edges: Edge<CanvasEdgeData>[]): SerializedEdge[] {
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
  serialized: SerializedNode[],
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
  serialized: SerializedEdge[],
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

export function createEmptyProject(name: string): LuraProject {
  const viewId = crypto.randomUUID();
  const now = new Date().toISOString();
  return {
    version: "1",
    meta: { name, createdAt: now, updatedAt: now },
    settings: { autosave: false },
    activeViewId: viewId,
    views: [{ id: viewId, name: "View 1", resources: [], nodes: [], edges: [], codeFiles: [] }],
  };
}

export function buildProjectSnapshot(
  project: LuraProject,
  viewSnapshots: Map<string, ViewSnapshot>,
): LuraProject {
  const views = project.views.map((v) => viewSnapshots.get(v.id) ?? v);
  return {
    ...project,
    views,
    meta: { ...project.meta, updatedAt: new Date().toISOString() },
  };
}

export function projectNameToSlug(name: string): string {
  return name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "") || "project";
}

export function projectNameToFileName(name: string): string {
  return projectNameToSlug(name) + ".lura";
}

export function viewNameToFolderName(name: string): string {
  const cleaned = name
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
  return cleaned || "view";
}

export function getViewsDir(projectDir: string): string {
  return `${projectDir}/views`;
}

export function getViewDir(projectDir: string, viewName: string): string {
  return `${getViewsDir(projectDir)}/${viewNameToFolderName(viewName)}`;
}

export async function ensureViewDir(projectDir: string, viewName: string): Promise<string> {
  const viewDir = getViewDir(projectDir, viewName);
  await mkdir(viewDir, { recursive: true });
  return viewDir;
}

export async function ensureProjectLayout(
  projectDir: string,
  viewNames: string[],
): Promise<void> {
  await mkdir(projectDir, { recursive: true });
  await mkdir(getViewsDir(projectDir), { recursive: true });

  for (const viewName of viewNames) {
    const viewDir = await ensureViewDir(projectDir, viewName);
    const viewMainTf = `${viewDir}/main.tf`;
    const hasMainTf = await exists(viewMainTf);
    if (!hasMainTf) {
      await writeTextFile(viewMainTf, "");
    }
  }
}

export async function removeViewDir(projectDir: string, viewName: string): Promise<void> {
  const viewDir = getViewDir(projectDir, viewName);
  const viewExists = await exists(viewDir);
  if (!viewExists) return;
  await remove(viewDir, { recursive: true });
}

export async function renameViewDir(
  projectDir: string,
  previousViewName: string,
  nextViewName: string,
): Promise<void> {
  const previousDir = getViewDir(projectDir, previousViewName);
  const nextDir = getViewDir(projectDir, nextViewName);

  if (previousDir === nextDir) return;

  const previousExists = await exists(previousDir);
  if (!previousExists) {
    await ensureViewDir(projectDir, nextViewName);
    return;
  }

  const nextExists = await exists(nextDir);
  if (nextExists) {
    throw new Error("Ya existe una carpeta para ese nombre de view.");
  }

  await rename(previousDir, nextDir);
}
