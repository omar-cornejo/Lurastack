import { describe, it, expect } from "vitest";
import {
  getProviderFromResourceType,
  detectProvidersInUse,
  defaultProviderSettings,
  mergeProviderSettings,
} from "./providerConfig";
import type { TerraformResource } from "./terraform";

const res = (type: string): TerraformResource => ({
  id: type,
  type,
  name: "x",
  config: { attributes: {}, blocks: {} },
  ui: { x: 0, y: 0, icon: "" },
});

describe("getProviderFromResourceType", () => {
  it("maps known prefixes to providers", () => {
    expect(getProviderFromResourceType("aws_instance")).toBe("aws");
    expect(getProviderFromResourceType("google_compute_instance")).toBe("gcp");
    expect(getProviderFromResourceType("azurerm_virtual_machine")).toBe("azure");
  });

  it("returns null for an unknown resource type", () => {
    expect(getProviderFromResourceType("custom_thing")).toBeNull();
    expect(getProviderFromResourceType("kubernetes_pod")).toBeNull();
  });
});

describe("detectProvidersInUse", () => {
  it("returns the fallback when no resources match a provider", () => {
    expect(detectProvidersInUse([], "aws")).toEqual(["aws"]);
    expect(detectProvidersInUse([res("custom_thing")], "gcp")).toEqual(["gcp"]);
  });

  it("collects the distinct providers in use", () => {
    const providers = detectProvidersInUse(
      [res("aws_vpc"), res("aws_subnet"), res("google_compute_network")],
      "aws",
    );
    expect(providers).toContain("aws");
    expect(providers).toContain("gcp");
    expect(providers).toHaveLength(2);
  });

  it("returns providers in the canonical order aws, azure, gcp", () => {
    const providers = detectProvidersInUse(
      [res("google_compute_network"), res("aws_vpc"), res("azurerm_resource_group")],
      "aws",
    );
    expect(providers).toEqual(["aws", "azure", "gcp"]);
  });
});

describe("defaultProviderSettings", () => {
  it("provides a region for every provider and a zone for gcp", () => {
    const s = defaultProviderSettings();
    expect(s.aws.region).toBe("eu-south-2");
    expect(s.gcp.region).toBe("europe-west1");
    expect(s.gcp.zone).toBe("europe-west1-b");
    expect(s.azure.region).toBe("westeurope");
  });
});

describe("mergeProviderSettings", () => {
  it("returns defaults when given undefined", () => {
    expect(mergeProviderSettings(undefined)).toEqual(defaultProviderSettings());
  });

  it("overrides only the provided region, keeping other defaults", () => {
    const merged = mergeProviderSettings({ aws: { region: "us-east-1" } });
    expect(merged.aws.region).toBe("us-east-1");
    expect(merged.gcp.region).toBe("europe-west1");
  });

  it("preserves the gcp default zone when overriding only its region", () => {
    const merged = mergeProviderSettings({ gcp: { region: "us-central1" } });
    expect(merged.gcp.region).toBe("us-central1");
    expect(merged.gcp.zone).toBe("europe-west1-b");
  });

  it("applies a provided project and zone for gcp", () => {
    const merged = mergeProviderSettings({
      gcp: { region: "us-central1", project: "my-proj", zone: "us-central1-a" },
    });
    expect(merged.gcp.project).toBe("my-proj");
    expect(merged.gcp.zone).toBe("us-central1-a");
  });
});
