import { useCallback, useEffect, useState } from "react";
import { invoke } from "@tauri-apps/api/core";

export type CloudProvider = "aws" | "gcp" | "azure";

export type CredentialMode = "manual" | "profile" | "env";

export interface AwsStoredCredentials {
  mode: CredentialMode;
  accessKeyId?: string;
  secretAccessKey?: string;
  sessionToken?: string;
  region?: string;
  profile?: string;
  profileRegion?: string;
  credentialsPath?: string;
  configPath?: string;
  envRegion?: string;
  envFilePath?: string;
}

export interface GcpStoredCredentials {
  mode: "manual";
  serviceAccountJson?: string;
  serviceAccountFilePath?: string;
  projectId?: string;
  region?: string;
}

export interface AzureStoredCredentials {
  mode: "manual";
  subscriptionId?: string;
  tenantId?: string;
  clientId?: string;
  clientSecret?: string;
  region?: string;
}

export type StoredCredentialsMap = {
  aws: AwsStoredCredentials;
  gcp: GcpStoredCredentials;
  azure: AzureStoredCredentials;
};

export type StoredCredentials = AwsStoredCredentials;

export type ResolvedAwsCredentials = {
  accessKeyId: string;
  secretAccessKey: string;
  sessionToken: string;
  region: string;
};

export type AwsCredentials = ResolvedAwsCredentials;

const LEGACY_STORAGE_KEYS: Record<CloudProvider, string> = {
  aws: "lurastack_aws_credentials",
  gcp: "lurastack_gcp_credentials",
  azure: "lurastack_azure_credentials",
};

const MIGRATION_FLAG = "lurastack_secrets_migrated_v1";

const AWS_DEFAULTS: AwsStoredCredentials = {
  mode: "manual",
  accessKeyId: "",
  secretAccessKey: "",
  sessionToken: "",
  region: "us-east-1",
};

const GCP_DEFAULTS: GcpStoredCredentials = {
  mode: "manual",
  serviceAccountJson: "",
  serviceAccountFilePath: "",
  projectId: "",
  region: "europe-west1",
};

const AZURE_DEFAULTS: AzureStoredCredentials = {
  mode: "manual",
  subscriptionId: "",
  tenantId: "",
  clientId: "",
  clientSecret: "",
  region: "westeurope",
};

function normalizeAws(parsed: Partial<AwsStoredCredentials>): AwsStoredCredentials {
  if (!parsed.mode && (parsed.accessKeyId || parsed.secretAccessKey)) {
    return {
      mode: "manual",
      accessKeyId: parsed.accessKeyId ?? "",
      secretAccessKey: parsed.secretAccessKey ?? "",
      sessionToken: parsed.sessionToken ?? "",
      region: parsed.region ?? "us-east-1",
    };
  }
  return {
    mode: parsed.mode ?? "manual",
    accessKeyId: parsed.accessKeyId ?? "",
    secretAccessKey: parsed.secretAccessKey ?? "",
    sessionToken: parsed.sessionToken ?? "",
    region: parsed.region ?? "us-east-1",
    profile: parsed.profile ?? "",
    profileRegion: parsed.profileRegion ?? "",
    credentialsPath: parsed.credentialsPath ?? "",
    configPath: parsed.configPath ?? "",
    envRegion: parsed.envRegion ?? "",
    envFilePath: parsed.envFilePath ?? "",
  };
}

function normalizeGcp(parsed: Partial<GcpStoredCredentials>): GcpStoredCredentials {
  return {
    mode: "manual",
    serviceAccountJson: parsed.serviceAccountJson ?? "",
    serviceAccountFilePath: parsed.serviceAccountFilePath ?? "",
    projectId: parsed.projectId ?? "",
    region: parsed.region ?? "europe-west1",
  };
}

function normalizeAzure(parsed: Partial<AzureStoredCredentials>): AzureStoredCredentials {
  return {
    mode: "manual",
    subscriptionId: parsed.subscriptionId ?? "",
    tenantId: parsed.tenantId ?? "",
    clientId: parsed.clientId ?? "",
    clientSecret: parsed.clientSecret ?? "",
    region: parsed.region ?? "westeurope",
  };
}

async function loadFromBackend<T>(
  provider: CloudProvider,
  normalize: (parsed: any) => T,
  fallback: T,
): Promise<T> {
  try {
    const blob = await invoke<string | null>("load_secret", { provider });
    if (!blob) return fallback;
    const parsed = JSON.parse(blob);
    return normalize(parsed);
  } catch {
    return fallback;
  }
}

async function saveToBackend(provider: CloudProvider, value: unknown): Promise<void> {
  await invoke("save_secret", { provider, blob: JSON.stringify(value) });
}

function readLegacy<T>(key: string, normalize: (parsed: any) => T): T | null {
  try {
    const raw = localStorage.getItem(key);
    if (!raw) return null;
    return normalize(JSON.parse(raw));
  } catch {
    return null;
  }
}

let migrationPromise: Promise<boolean> | null = null;

async function migrateLegacyOnce(): Promise<boolean> {
  if (migrationPromise) return migrationPromise;
  migrationPromise = (async () => {
    try {
      if (localStorage.getItem(MIGRATION_FLAG) === "1") return false;
    } catch {
      return false;
    }
    const legacy = {
      aws: readLegacy(LEGACY_STORAGE_KEYS.aws, normalizeAws),
      gcp: readLegacy(LEGACY_STORAGE_KEYS.gcp, normalizeGcp),
      azure: readLegacy(LEGACY_STORAGE_KEYS.azure, normalizeAzure),
    };
    const hasAny = !!(legacy.aws || legacy.gcp || legacy.azure);
    if (!hasAny) {
      try { localStorage.setItem(MIGRATION_FLAG, "1"); } catch { /* ignore */ }
      return false;
    }
    try {
      if (legacy.aws) await saveToBackend("aws", legacy.aws);
      if (legacy.gcp) await saveToBackend("gcp", legacy.gcp);
      if (legacy.azure) await saveToBackend("azure", legacy.azure);
    } catch {
      return false;
    }
    try {
      localStorage.removeItem(LEGACY_STORAGE_KEYS.aws);
      localStorage.removeItem(LEGACY_STORAGE_KEYS.gcp);
      localStorage.removeItem(LEGACY_STORAGE_KEYS.azure);
      localStorage.setItem(MIGRATION_FLAG, "1");
    } catch { /* ignore */ }
    return true;
  })();
  return migrationPromise;
}

function isAwsConfigured(c: AwsStoredCredentials): boolean {
  if (c.mode === "manual") {
    return (c.accessKeyId ?? "").trim() !== "" && (c.secretAccessKey ?? "").trim() !== "" && (c.region ?? "").trim() !== "";
  }
  if (c.mode === "profile") {
    return (c.profile ?? "").trim() !== "";
  }
  return true;
}

function isGcpConfigured(c: GcpStoredCredentials): boolean {
  return (
    ((c.serviceAccountJson ?? "").trim() !== "" || (c.serviceAccountFilePath ?? "").trim() !== "") &&
    (c.projectId ?? "").trim() !== ""
  );
}

function isAzureConfigured(c: AzureStoredCredentials): boolean {
  return (
    (c.subscriptionId ?? "").trim() !== "" &&
    (c.tenantId ?? "").trim() !== "" &&
    (c.clientId ?? "").trim() !== "" &&
    (c.clientSecret ?? "").trim() !== ""
  );
}

export function useProviderCredentials(provider: CloudProvider) {
  const [aws, setAws] = useState<AwsStoredCredentials>(AWS_DEFAULTS);
  const [gcp, setGcp] = useState<GcpStoredCredentials>(GCP_DEFAULTS);
  const [azure, setAzure] = useState<AzureStoredCredentials>(AZURE_DEFAULTS);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      const migrated = await migrateLegacyOnce();
      const [a, g, z] = await Promise.all([
        loadFromBackend("aws", normalizeAws, AWS_DEFAULTS),
        loadFromBackend("gcp", normalizeGcp, GCP_DEFAULTS),
        loadFromBackend("azure", normalizeAzure, AZURE_DEFAULTS),
      ]);
      if (cancelled) return;
      setAws(a);
      setGcp(g);
      setAzure(z);
      setLoading(false);
      if (migrated) {
        try {
          window.dispatchEvent(
            new CustomEvent("lurastack:secrets-migrated", { detail: { providers: ["aws", "gcp", "azure"] } }),
          );
        } catch { /* ignore */ }
      }
    })();
    return () => {
      cancelled = true;
    };
  }, []);

  const saveAws = useCallback(async (next: AwsStoredCredentials) => {
    setAws(next);
    try { await saveToBackend("aws", next); } catch { /* ignore */ }
  }, []);
  const saveGcp = useCallback(async (next: GcpStoredCredentials) => {
    setGcp(next);
    try { await saveToBackend("gcp", next); } catch { /* ignore */ }
  }, []);
  const saveAzure = useCallback(async (next: AzureStoredCredentials) => {
    setAzure(next);
    try { await saveToBackend("azure", next); } catch { /* ignore */ }
  }, []);

  const save = useCallback(
    (next: AwsStoredCredentials | GcpStoredCredentials | AzureStoredCredentials) => {
      if (provider === "aws") void saveAws(next as AwsStoredCredentials);
      else if (provider === "gcp") void saveGcp(next as GcpStoredCredentials);
      else void saveAzure(next as AzureStoredCredentials);
    },
    [provider, saveAws, saveGcp, saveAzure],
  );

  const stored: AwsStoredCredentials | GcpStoredCredentials | AzureStoredCredentials =
    provider === "aws" ? aws : provider === "gcp" ? gcp : azure;

  const isConfigured =
    provider === "aws" ? isAwsConfigured(aws) :
    provider === "gcp" ? isGcpConfigured(gcp) :
    isAzureConfigured(azure);

  return { stored, save, isConfigured, aws, gcp, azure, loading };
}

export function buildEnvForProvider(
  provider: CloudProvider,
  creds: {
    awsCredentials: AwsStoredCredentials;
    gcpCredentials: GcpStoredCredentials;
    azureCredentials: AzureStoredCredentials;
  },
): Record<string, string> {
  const env: Record<string, string> = {};
  if (provider === "aws") {
    const { awsCredentials } = creds;
    if (awsCredentials.accessKeyId) env.AWS_ACCESS_KEY_ID = awsCredentials.accessKeyId;
    if (awsCredentials.secretAccessKey) env.AWS_SECRET_ACCESS_KEY = awsCredentials.secretAccessKey;
    if (awsCredentials.sessionToken) env.AWS_SESSION_TOKEN = awsCredentials.sessionToken;
    if (awsCredentials.region) {
      env.AWS_DEFAULT_REGION = awsCredentials.region;
      env.AWS_REGION = awsCredentials.region;
    }
  } else if (provider === "gcp") {
    const { gcpCredentials } = creds;
    if (gcpCredentials.projectId) {
      env.GOOGLE_PROJECT = gcpCredentials.projectId;
      env.GOOGLE_CLOUD_PROJECT = gcpCredentials.projectId;
    }
    if (gcpCredentials.region) env.GOOGLE_REGION = gcpCredentials.region;
    if (gcpCredentials.serviceAccountFilePath) {
      env.GOOGLE_APPLICATION_CREDENTIALS = gcpCredentials.serviceAccountFilePath;
    } else if (gcpCredentials.serviceAccountJson) {
      env.GOOGLE_CREDENTIALS = gcpCredentials.serviceAccountJson;
    }
  } else if (provider === "azure") {
    const { azureCredentials } = creds;
    if (azureCredentials.subscriptionId) env.ARM_SUBSCRIPTION_ID = azureCredentials.subscriptionId;
    if (azureCredentials.tenantId) env.ARM_TENANT_ID = azureCredentials.tenantId;
    if (azureCredentials.clientId) env.ARM_CLIENT_ID = azureCredentials.clientId;
    if (azureCredentials.clientSecret) env.ARM_CLIENT_SECRET = azureCredentials.clientSecret;
    if (azureCredentials.region) env.ARM_LOCATION = azureCredentials.region;
  }
  return env;
}

export function useAwsCredentials() {
  const [stored, setStored] = useState<AwsStoredCredentials>(AWS_DEFAULTS);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      await migrateLegacyOnce();
      const v = await loadFromBackend("aws", normalizeAws, AWS_DEFAULTS);
      if (cancelled) return;
      setStored(v);
      setLoading(false);
    })();
    return () => {
      cancelled = true;
    };
  }, []);

  const save = useCallback(async (next: AwsStoredCredentials) => {
    setStored(next);
    try { await saveToBackend("aws", next); } catch { /* ignore */ }
  }, []);

  return { stored, save, isConfigured: isAwsConfigured(stored), loading };
}
