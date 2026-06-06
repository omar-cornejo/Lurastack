import {
  readTextFile,
  writeTextFile,
  mkdir,
  exists,
  rename,
} from "@tauri-apps/plugin-fs";
import { grantProjectAccess } from "./projectManager";
import type { HistoryEntry, HistoryIndex } from "../types/history";
import type { ResourcePlanChange } from "../canvas/types";

const HISTORY_DIR = ".lurastack-history";
const INDEX_FILE = "index.json";
const MAX_ENTRIES = 200;

function historyDir(projectDir: string): string {
  return `${projectDir}/${HISTORY_DIR}`;
}

function indexPath(projectDir: string): string {
  return `${historyDir(projectDir)}/${INDEX_FILE}`;
}

function entryPath(projectDir: string, id: string): string {
  return `${historyDir(projectDir)}/${id}.json`;
}

// The history dir starts with a dot. Tauri's `requireLiteralLeadingDot` (true on
// Unix) means a recursive grant on the project folder (`<proj>/**`) never matches
// a hidden component like `.lurastack-history`. Granting the history dir's exact
// path adds a literal pattern that matches it regardless of that option, so we do
// it explicitly before any fs op (exists/mkdir/read/write) touches the dir.
async function grantHistoryAccess(projectDir: string): Promise<void> {
  await grantProjectAccess(historyDir(projectDir));
}

export async function ensureHistoryDir(projectDir: string): Promise<void> {
  await grantHistoryAccess(projectDir);
  const dir = historyDir(projectDir);
  const dirExists = await exists(dir);
  if (!dirExists) {
    await mkdir(dir, { recursive: true });
  }
}

export async function loadHistoryIndex(projectDir: string): Promise<HistoryIndex> {
  await grantHistoryAccess(projectDir);
  const path = indexPath(projectDir);
  try {
    const pathExists = await exists(path);
    if (!pathExists) return { version: "1", entries: [] };
    const raw = await readTextFile(path);
    return JSON.parse(raw) as HistoryIndex;
  } catch {
    return { version: "1", entries: [] };
  }
}

export async function loadHistoryEntry(
  projectDir: string,
  id: string,
): Promise<HistoryEntry | null> {
  await grantHistoryAccess(projectDir);
  const path = entryPath(projectDir, id);
  try {
    const pathExists = await exists(path);
    if (!pathExists) return null;
    const raw = await readTextFile(path);
    return JSON.parse(raw) as HistoryEntry;
  } catch {
    return null;
  }
}

export async function appendHistoryEntry(
  projectDir: string,
  entry: HistoryEntry,
): Promise<void> {
  await ensureHistoryDir(projectDir);

  await writeTextFile(entryPath(projectDir, entry.id), JSON.stringify(entry, null, 2));

  const index = await loadHistoryIndex(projectDir);

  const { snapshotBefore: _a, snapshotAfter: _b, changes: _c, ...slim } = entry;
  const updatedEntries = [slim, ...index.entries].slice(0, MAX_ENTRIES);

  const updated: HistoryIndex = { version: "1", entries: updatedEntries };
  const finalPath = indexPath(projectDir);
  const tmpPath = `${finalPath}.tmp`;
  const serialized = JSON.stringify(updated, null, 2);

  // Write to a temp file then atomically swap so a crash mid-write can't
  // corrupt the index. If rename is unavailable (permissions, cross-device),
  // fall back to a direct write rather than losing the whole history.
  try {
    await writeTextFile(tmpPath, serialized);
    await rename(tmpPath, finalPath);
  } catch {
    await writeTextFile(finalPath, serialized);
  }
}

export function summarizePlanChanges(planChanges: Map<string, ResourcePlanChange>): {
  summary: { created: number; changed: number; destroyed: number };
  changes: Array<{ address: string; action: "create" | "change" | "destroy" }>;
} {
  let created = 0;
  let changed = 0;
  let destroyed = 0;
  const changes: Array<{ address: string; action: "create" | "change" | "destroy" }> = [];

  for (const [address, change] of planChanges) {
    if (change.action === "create") {
      created++;
      changes.push({ address, action: "create" });
    } else if (change.action === "change") {
      changed++;
      changes.push({ address, action: "change" });
    } else if (change.action === "destroy") {
      destroyed++;
      changes.push({ address, action: "destroy" });
    }
  }

  return { summary: { created, changed, destroyed }, changes };
}
