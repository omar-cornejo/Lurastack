import { describe, it, expect } from "vitest";
import { readFileSync, readdirSync, existsSync, statSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { NODE_SCHEMAS } from "../models/nodeRegistry";
import type { LuraProject, ViewSnapshot } from "../types/project";
import type { TerraformResource } from "../models/terraform";

// Repo-level fixture suite: validates the shipped gallery templates against the
// schema catalog and the LuraProject shape. The shipped templates are the
// real-world corpus, so this is the regression net that catches a bad template
// contribution (a "good first issue" failure mode) without any fixture authoring.

const repoRoot = fileURLToPath(new URL("../../", import.meta.url));
const templatesDir = join(repoRoot, "public", "templates");
const indexPath = join(templatesDir, "index.json");

type IndexEntry = {
  id: string;
  name: string;
  provider: string;
  resourceCount: number;
};

const index = JSON.parse(readFileSync(indexPath, "utf8")) as {
  version: string;
  templates: IndexEntry[];
};

const readProject = (id: string): LuraProject => {
  const [provider, slug] = id.split("/");
  const file = join(templatesDir, provider, slug, "project.lura");
  return JSON.parse(readFileSync(file, "utf8")) as LuraProject;
};

const allResources = (project: LuraProject): TerraformResource[] =>
  project.views.flatMap((v: ViewSnapshot) => v.resources ?? []);

// Resource types that come from HashiCorp utility providers (archive, random,
// local). They are embedded in templates with their own hclTemplate and are not
// part of the cloud-provider schema catalog, so they are exempt from the
// "every type has a catalog schema" rule.
const UTILITY_TYPES = new Set(["archive_file", "random_id", "local_file"]);

const catalogTypes = new Set(NODE_SCHEMAS.map((s) => s.terraformType));

// Discover template directories straight from disk (independent of index.json)
// so the index↔disk checks can compare both directions.
const diskTemplateIds: string[] = [];
for (const provider of readdirSync(templatesDir)) {
  const providerDir = join(templatesDir, provider);
  if (!statSync(providerDir).isDirectory()) continue;
  for (const slug of readdirSync(providerDir)) {
    if (!statSync(join(providerDir, slug)).isDirectory()) continue;
    diskTemplateIds.push(`${provider}/${slug}`);
  }
}

describe("templates index.json", () => {
  it("is version 1 with a non-empty template list", () => {
    expect(index.version).toBe("1");
    expect(index.templates.length).toBeGreaterThan(0);
  });

  it("references only templates that exist on disk", () => {
    for (const entry of index.templates) {
      const [provider, slug] = entry.id.split("/");
      const dir = join(templatesDir, provider, slug);
      expect(existsSync(join(dir, "manifest.json")), `${entry.id} manifest`).toBe(true);
      expect(existsSync(join(dir, "project.lura")), `${entry.id} project.lura`).toBe(true);
    }
  });

  it("has no orphan template directories missing from the index", () => {
    const indexed = new Set(index.templates.map((t) => t.id));
    for (const id of diskTemplateIds) {
      expect(indexed.has(id), `disk template ${id} is missing from index.json`).toBe(true);
    }
  });
});

describe("each shipped project.lura", () => {
  for (const entry of index.templates) {
    describe(entry.id, () => {
      const project = readProject(entry.id);

      it("parses as a v1 LuraProject with a valid activeViewId", () => {
        expect(project.version).toBe("1");
        expect(project.views.length).toBeGreaterThan(0);
        const viewIds = new Set(project.views.map((v) => v.id));
        expect(viewIds.has(project.activeViewId)).toBe(true);
      });

      it("has well-formed resources (type + name present)", () => {
        for (const r of allResources(project)) {
          expect(typeof r.type).toBe("string");
          expect(r.type.length).toBeGreaterThan(0);
          expect(typeof r.name).toBe("string");
          expect(r.name.length).toBeGreaterThan(0);
          expect(r.config).toBeDefined();
        }
      });

      it("matches the manifest resourceCount", () => {
        const manifestPath = join(templatesDir, entry.id, "manifest.json");
        const manifest = JSON.parse(readFileSync(manifestPath, "utf8")) as { resourceCount: number };
        expect(allResources(project).length).toBe(manifest.resourceCount);
        // And the index mirrors the manifest.
        expect(entry.resourceCount).toBe(manifest.resourceCount);
      });

      it("uses only resource types present in the schema catalog (or known utility types)", () => {
        for (const r of allResources(project)) {
          if (UTILITY_TYPES.has(r.type)) continue;
          expect(
            catalogTypes.has(r.type),
            `template ${entry.id} references "${r.type}" which has no schema in src/schemas/`,
          ).toBe(true);
        }
      });
    });
  }
});
