import { describe, it, expect } from "vitest";
import { NODE_SCHEMAS, getSchemasForProvider } from "./nodeRegistry";

// This suite only runs under Vitest because the registry loads schemas via
// `import.meta.glob` (Vite-specific). It smoke-tests the whole schema-loading
// pipeline and indirectly exercises the private `normalizeType`/`toLabel`.

describe("NODE_SCHEMAS pipeline", () => {
  it("loads a non-empty catalog", () => {
    expect(NODE_SCHEMAS.length).toBeGreaterThan(0);
  });

  it("produces well-formed schema entries", () => {
    for (const schema of NODE_SCHEMAS) {
      expect(schema.terraformType.length).toBeGreaterThan(0);
      expect(schema.label.length).toBeGreaterThan(0);
      expect(["resource", "data"]).toContain(schema.terraformKind);
      expect(["aws", "gcp", "azure"]).toContain(schema.provider);
      expect(Array.isArray(schema.properties)).toBe(true);
    }
  });

  it("has no duplicate (type, kind) entries within a provider", () => {
    // A terraformType can legitimately appear as both a resource and a data
    // source (e.g. google_compute_network), so uniqueness is per type+kind.
    for (const provider of ["aws", "gcp"] as const) {
      const keys = getSchemasForProvider(provider).map((s) => `${s.terraformType}:${s.terraformKind}`);
      expect(new Set(keys).size).toBe(keys.length);
    }
  });
});

describe("label generation (via the loaded catalog)", () => {
  it("strips the provider prefix and title-cases the remainder", () => {
    const vpc = NODE_SCHEMAS.find((s) => s.terraformType === "aws_vpc");
    expect(vpc?.label).toBe("Vpc");

    const instance = NODE_SCHEMAS.find((s) => s.terraformType === "aws_instance");
    expect(instance?.label).toBe("Instance");

    const subnet = NODE_SCHEMAS.find((s) => s.terraformType === "aws_subnet");
    expect(subnet?.label).toBe("Subnet");
  });

  it("title-cases multi-word google types after stripping the prefix", () => {
    const network = NODE_SCHEMAS.find((s) => s.terraformType === "google_compute_network");
    expect(network?.label).toBe("Compute Network");
  });
});

describe("property type normalization (via the loaded catalog)", () => {
  it("represents every property type as a non-empty string", () => {
    const vpc = NODE_SCHEMAS.find((s) => s.terraformType === "aws_vpc");
    expect(vpc).toBeDefined();
    for (const prop of vpc!.properties) {
      expect(typeof prop.type).toBe("string");
      expect(prop.type.length).toBeGreaterThan(0);
    }
  });

  it("includes the schemas added for the gallery templates", () => {
    // Regression guard for the Phase 3 catalog additions.
    const types = new Set(NODE_SCHEMAS.map((s) => s.terraformType));
    expect(types.has("aws_s3_bucket_website_configuration")).toBe(true);
    expect(types.has("google_compute_target_http_proxy")).toBe(true);
  });
});
