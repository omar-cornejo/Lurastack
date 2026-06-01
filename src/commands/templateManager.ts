import { writeTextFile, mkdir } from "@tauri-apps/plugin-fs";
import { open } from "@tauri-apps/plugin-dialog";
import type { TemplateIndex, TemplateManifest } from "../types/templates";
import type { LuraProject, ViewSnapshot } from "../types/project";
import { projectNameToSlug, getViewDir } from "./projectManager";
import { buildMultiProviderHcl } from "../models/hclEmitter";
import { mergeProviderSettings, getProviderFromResourceType, type CloudProvider } from "../models/providerConfig";

const isTauri = () =>
  typeof window !== "undefined" &&
  !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

/** Templates and the generated index live under public/templates/, served from `/templates/...`. */
const TEMPLATES_BASE = "templates";

export async function loadTemplateIndex(): Promise<TemplateManifest[]> {
  try {
    const response = await fetch(`/${TEMPLATES_BASE}/index.json`, { cache: "no-cache" });
    if (!response.ok) return [];
    const index = (await response.json()) as TemplateIndex;
    return index.templates ?? [];
  } catch {
    return [];
  }
}

async function loadTemplateProject(templateId: string): Promise<LuraProject> {
  const response = await fetch(`/${TEMPLATES_BASE}/${templateId}/project.lura`, {
    cache: "no-cache",
  });
  if (!response.ok) {
    throw new Error(`Could not load template ${templateId} (${response.status})`);
  }
  return (await response.json()) as LuraProject;
}

/**
 * Opens a directory picker and returns the absolute `.lura` path inside a fresh `<slug>/` subfolder.
 * Mirrors `pickSavePath` in projectManager but exposed here so the template flow stays self-contained.
 */
export async function pickTemplateDestination(projectName: string): Promise<string | null> {
  if (!isTauri()) return null;
  const result = await open({
    title: "Choose template destination",
    directory: true,
    multiple: false,
  });
  if (!result) return null;
  const parentDir = typeof result === "string" ? result : (result as string[])[0];
  if (!parentDir) return null;
  const slug = projectNameToSlug(projectName);
  const projectDir = `${parentDir}/${slug}`;
  await mkdir(projectDir, { recursive: true });
  return `${projectDir}/${slug}.lura`;
}

/**
 * Materializes a template at the chosen path with the user-supplied name.
 * Returns the absolute `.lura` path written to disk.
 */
export async function createProjectFromTemplate(
  templateId: string,
  projectName: string,
  absolutePath: string,
): Promise<string> {
  const base = await loadTemplateProject(templateId);

  const now = new Date().toISOString();
  const project: LuraProject = {
    ...base,
    meta: {
      ...base.meta,
      name: projectName,
      createdAt: now,
      updatedAt: now,
    },
  };

  if (!isTauri()) {
    throw new Error("Templates can only be instantiated in the desktop app.");
  }

  await writeTextFile(absolutePath, JSON.stringify(project, null, 2));

  // Pre-render main.tf for each view so terraform plan works immediately,
  // without depending on the UI opening and rewriting it (which can lose
  // dotted-key nested-block attributes during the load→save round-trip).
  const projectRoot = absolutePath.substring(0, absolutePath.lastIndexOf("/"));
  for (const view of project.views) {
    await writeViewMainTf(projectRoot, view);
    await writeViewCodeFiles(projectRoot, view);
  }

  return absolutePath;
}

/**
 * Writes a view's auxiliary code files (output.tf, user_data.sh, …) to disk
 * next to main.tf. The CodePanel explorer lists files from the view directory,
 * so these must exist on disk for the template to load with them.
 */
async function writeViewCodeFiles(projectRoot: string, view: ViewSnapshot): Promise<void> {
  if (!view.codeFiles || view.codeFiles.length === 0) return;
  const viewDir = getViewDir(projectRoot, view.name);
  await mkdir(viewDir, { recursive: true });
  for (const file of view.codeFiles) {
    const safeName = file.name.split(/[\\/]/).pop();
    if (!safeName) continue;
    await writeTextFile(`${viewDir}/${safeName}`, file.content);
  }
}

async function writeViewMainTf(projectRoot: string, view: ViewSnapshot): Promise<void> {
  if (!view.resources || view.resources.length === 0) return;
  const providerSettings = mergeProviderSettings(view.providerSettings);
  const activeProvider: CloudProvider =
    view.activeProvider ?? inferProviderFromResources(view.resources) ?? "aws";
  const hcl = buildMultiProviderHcl(
    { provider: activeProvider, resources: view.resources },
    providerSettings,
    activeProvider,
  );
  // The app derives view folders from view.name via viewNameToFolderName,
  // not view.id — must match or the file ends up orphaned.
  const viewDir = getViewDir(projectRoot, view.name);
  await mkdir(viewDir, { recursive: true });
  await writeTextFile(`${viewDir}/main.tf`, hcl);
}

function inferProviderFromResources(resources: ViewSnapshot["resources"]): CloudProvider | null {
  for (const r of resources) {
    const p = getProviderFromResourceType(r.type);
    if (p) return p;
  }
  return null;
}
