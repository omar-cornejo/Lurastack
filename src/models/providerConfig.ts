import type { TerraformResource } from "./terraform";

export type CloudProvider = "aws" | "gcp" | "azure";

export const PROVIDER_CONFIG: Record<
  CloudProvider,
  { name: string; source: string; version: string; defaultRegion: string; defaultZone?: string }
> = {
  aws: {
    name: "aws",
    source: "hashicorp/aws",
    version: "~> 5.0",
    defaultRegion: "eu-south-2",
  },
  gcp: {
    name: "google",
    source: "hashicorp/google",
    version: "~> 5.0",
    defaultRegion: "europe-west1",
    defaultZone: "europe-west1-b",
  },
  azure: {
    name: "azurerm",
    source: "hashicorp/azurerm",
    version: "~> 3.0",
    defaultRegion: "westeurope",
  },
};

export const PROVIDER_PREFIXES: Record<CloudProvider, string> = {
  aws: "aws_",
  gcp: "google_",
  azure: "azurerm_",
};

const PROVIDER_ORDER: CloudProvider[] = ["aws", "azure", "gcp"];

export function getProviderFromResourceType(type: string): CloudProvider | null {
  for (const provider of PROVIDER_ORDER) {
    if (type.startsWith(PROVIDER_PREFIXES[provider])) return provider;
  }
  return null;
}

export function detectProvidersInUse(
  resources: TerraformResource[],
  fallback: CloudProvider,
): CloudProvider[] {
  const found = new Set<CloudProvider>();
  for (const r of resources) {
    const p = getProviderFromResourceType(r.type);
    if (p) found.add(p);
  }
  if (found.size === 0) return [fallback];
  return PROVIDER_ORDER.filter((p) => found.has(p));
}

// `project` and `zone` are GCP-specific and optional: GCP requires a project
// (and Compute resources a zone) to deploy, whereas AWS/Azure use only region.
// They stay optional so call sites that build settings with just `region`
// keep compiling.
export type ProviderSettings = Record<
  CloudProvider,
  { region: string; project?: string; zone?: string }
>;

export function defaultProviderSettings(): ProviderSettings {
  return {
    aws: { region: PROVIDER_CONFIG.aws.defaultRegion },
    gcp: { region: PROVIDER_CONFIG.gcp.defaultRegion, zone: PROVIDER_CONFIG.gcp.defaultZone },
    azure: { region: PROVIDER_CONFIG.azure.defaultRegion },
  };
}

export function mergeProviderSettings(
  partial: Partial<ProviderSettings> | undefined,
): ProviderSettings {
  const base = defaultProviderSettings();
  if (!partial) return base;
  for (const p of PROVIDER_ORDER) {
    const override = partial[p];
    if (override && typeof override.region === "string") {
      base[p] = {
        region: override.region,
        ...(typeof override.project === "string" ? { project: override.project } : {}),
        ...(typeof override.zone === "string" ? { zone: override.zone } : base[p].zone ? { zone: base[p].zone } : {}),
      };
    }
  }
  return base;
}
