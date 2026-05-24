import type { TerraformResource } from "./terraform";

export type CloudProvider = "aws" | "gcp" | "azure";

export const PROVIDER_CONFIG: Record<
  CloudProvider,
  { name: string; source: string; version: string; defaultRegion: string }
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

export type ProviderSettings = Record<CloudProvider, { region: string }>;

export function defaultProviderSettings(): ProviderSettings {
  return {
    aws: { region: PROVIDER_CONFIG.aws.defaultRegion },
    gcp: { region: PROVIDER_CONFIG.gcp.defaultRegion },
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
      base[p] = { region: override.region };
    }
  }
  return base;
}
