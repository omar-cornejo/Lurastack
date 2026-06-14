import { describe, it, expect } from "vitest";
import { readFileSync, readdirSync, statSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { terraformResourceToHCL } from "../models/hclEmitter";
import type { LuraProject, ViewSnapshot } from "../types/project";
import type { TerraformResource } from "../models/terraform";

// Emitter ↔ template invariant (the core regression net).
//
// CONTRIBUTING.md: "Dotted-key attributes become nested HCL blocks. Tests and
// templates rely on this convention." This suite feeds EVERY resource from
// EVERY shipped template through the REAL emitter and asserts the structural
// contract. It catches both (a) an emitter regression and (b) a template that
// the emitter can't faithfully represent — which is exactly where a visual→IaC
// tool bleeds. The shipped templates are the corpus, so no fixtures are authored.

const repoRoot = fileURLToPath(new URL("../../", import.meta.url));
const templatesDir = join(repoRoot, "public", "templates");

const collectResources = (): Array<{ template: string; resource: TerraformResource }> => {
  const out: Array<{ template: string; resource: TerraformResource }> = [];
  for (const provider of readdirSync(templatesDir)) {
    const providerDir = join(templatesDir, provider);
    if (!statSync(providerDir).isDirectory()) continue;
    for (const slug of readdirSync(providerDir)) {
      const file = join(providerDir, slug, "project.lura");
      try {
        const project = JSON.parse(readFileSync(file, "utf8")) as LuraProject;
        for (const view of project.views as ViewSnapshot[]) {
          for (const resource of view.resources ?? []) {
            out.push({ template: `${provider}/${slug}`, resource });
          }
        }
      } catch {
        // index↔disk validity is asserted in templates.fixture.test.ts
      }
    }
  }
  return out;
};

const balancedBraces = (hcl: string) =>
  (hcl.match(/\{/g) ?? []).length === (hcl.match(/\}/g) ?? []).length;

const allResources = collectResources();

describe("emitter ↔ shipped templates invariant", () => {
  it("there are real resources to validate", () => {
    expect(allResources.length).toBeGreaterThan(0);
  });

  for (const { template, resource } of allResources) {
    const label = `${template} :: ${resource.type}.${resource.name}`;

    it(`emits a well-formed block for ${label}`, () => {
      const hcl = terraformResourceToHCL(resource);
      const kind = resource.kind ?? "resource";

      // Correct, non-empty header.
      expect(hcl.startsWith(`${kind} "${resource.type}" "${resource.name}" {`)).toBe(true);
      expect(hcl.trimEnd().endsWith("}")).toBe(true);
      // Balanced braces — proves every nested block opened was closed.
      expect(balancedBraces(hcl), `unbalanced braces in ${label}`).toBe(true);
    });

    it(`never emits a dotted key as a flat assignment for ${label}`, () => {
      const hcl = terraformResourceToHCL(resource);
      // For every attribute key containing a dot, the literal `a.b =` form must
      // not appear — it must have become a nested block instead.
      const attrs = resource.config?.attributes ?? {};
      for (const key of Object.keys(attrs)) {
        if (!key.includes(".")) continue;
        const flat = new RegExp(`(^|\\n)\\s*${key.replace(/[.]/g, "\\.")}\\s*=`);
        expect(flat.test(hcl), `${label}: dotted key "${key}" leaked as a flat assignment`).toBe(false);
      }
    });
  }
});
