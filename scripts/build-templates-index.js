#!/usr/bin/env node
import { readdir, readFile, writeFile, stat } from "node:fs/promises";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const TEMPLATES_DIR = join(__dirname, "..", "public", "templates");
const INDEX_PATH = join(TEMPLATES_DIR, "index.json");

async function isDir(path) {
  try {
    const s = await stat(path);
    return s.isDirectory();
  } catch {
    return false;
  }
}

async function readManifest(manifestPath) {
  const raw = await readFile(manifestPath, "utf8");
  return JSON.parse(raw);
}

async function main() {
  const providers = await readdir(TEMPLATES_DIR);
  const templates = [];

  for (const provider of providers) {
    const providerDir = join(TEMPLATES_DIR, provider);
    if (!(await isDir(providerDir))) continue;

    const slugs = await readdir(providerDir);
    for (const slug of slugs) {
      const slugDir = join(providerDir, slug);
      if (!(await isDir(slugDir))) continue;

      const manifestPath = join(slugDir, "manifest.json");
      const projectPath = join(slugDir, "project.lura");

      try {
        await stat(manifestPath);
        await stat(projectPath);
      } catch {
        console.warn(`[templates] Skipping ${provider}/${slug}: missing manifest.json or project.lura`);
        continue;
      }

      const manifest = await readManifest(manifestPath);
      templates.push({
        id: `${provider}/${slug}`,
        name: manifest.name,
        description: manifest.description,
        provider: manifest.provider ?? provider,
        resourceCount: manifest.resourceCount ?? 0,
        tags: manifest.tags ?? [],
        icon: manifest.icon,
        preview: manifest.preview,
      });
    }
  }

  templates.sort((a, b) => a.name.localeCompare(b.name));

  const index = { version: "1", templates };
  await writeFile(INDEX_PATH, JSON.stringify(index, null, 2) + "\n", "utf8");
  console.log(`[templates] Wrote ${templates.length} entries to ${INDEX_PATH}`);
}

main().catch((err) => {
  console.error("[templates] Failed:", err);
  process.exit(1);
});
