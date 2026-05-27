import { useCallback, useEffect, useState } from "react";

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

const STORAGE_KEYS: Record<CloudProvider, string> = {
  aws: "ddf_aws_credentials",
  gcp: "ddf_gcp_credentials",
  azure: "ddf_azure_credentials",
};

function loadAwsFromStorage(): AwsStoredCredentials {
  try {
    const raw = localStorage.getItem(STORAGE_KEYS.aws);
    if (raw) {
      const parsed = JSON.parse(raw) as Partial<AwsStoredCredentials>;
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
  } catch { /* ignore */ }
  return { mode: "manual", accessKeyId: "", secretAccessKey: "", sessionToken: "", region: "us-east-1" };
}

function loadGcpFromStorage(): GcpStoredCredentials {
  try {
    const raw = localStorage.getItem(STORAGE_KEYS.gcp);
    if (raw) {
      const parsed = JSON.parse(raw) as Partial<GcpStoredCredentials>;
      return {
        mode: "manual",
        serviceAccountJson: parsed.serviceAccountJson ?? "",
        serviceAccountFilePath: parsed.serviceAccountFilePath ?? "",
        projectId: parsed.projectId ?? "",
        region: parsed.region ?? "europe-west1",
      };
    }
  } catch { /* ignore */ }
  return { mode: "manual", serviceAccountJson: "", serviceAccountFilePath: "", projectId: "", region: "europe-west1" };
}

function loadAzureFromStorage(): AzureStoredCredentials {
  try {
    const raw = localStorage.getItem(STORAGE_KEYS.azure);
    if (raw) {
      const parsed = JSON.parse(raw) as Partial<AzureStoredCredentials>;
      return {
        mode: "manual",
        subscriptionId: parsed.subscriptionId ?? "",
        tenantId: parsed.tenantId ?? "",
        clientId: parsed.clientId ?? "",
        clientSecret: parsed.clientSecret ?? "",
        region: parsed.region ?? "westeurope",
      };
    }
  } catch { /* ignore */ }
  return { mode: "manual", subscriptionId: "", tenantId: "", clientId: "", clientSecret: "", region: "westeurope" };
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
  const [aws, setAws] = useState<AwsStoredCredentials>(loadAwsFromStorage);
  const [gcp, setGcp] = useState<GcpStoredCredentials>(loadGcpFromStorage);
  const [azure, setAzure] = useState<AzureStoredCredentials>(loadAzureFromStorage);

  useEffect(() => {
    const onStorage = (e: StorageEvent) => {
      if (e.key === STORAGE_KEYS.aws) setAws(loadAwsFromStorage());
      else if (e.key === STORAGE_KEYS.gcp) setGcp(loadGcpFromStorage());
      else if (e.key === STORAGE_KEYS.azure) setAzure(loadAzureFromStorage());
    };
    window.addEventListener("storage", onStorage);
    return () => window.removeEventListener("storage", onStorage);
  }, []);

  const saveAws = useCallback((next: AwsStoredCredentials) => {
    setAws(next);
    try { localStorage.setItem(STORAGE_KEYS.aws, JSON.stringify(next)); } catch { /* ignore */ }
  }, []);
  const saveGcp = useCallback((next: GcpStoredCredentials) => {
    setGcp(next);
    try { localStorage.setItem(STORAGE_KEYS.gcp, JSON.stringify(next)); } catch { /* ignore */ }
  }, []);
  const saveAzure = useCallback((next: AzureStoredCredentials) => {
    setAzure(next);
    try { localStorage.setItem(STORAGE_KEYS.azure, JSON.stringify(next)); } catch { /* ignore */ }
  }, []);

  const save = useCallback(
    (next: AwsStoredCredentials | GcpStoredCredentials | AzureStoredCredentials) => {
      if (provider === "aws") saveAws(next as AwsStoredCredentials);
      else if (provider === "gcp") saveGcp(next as GcpStoredCredentials);
      else saveAzure(next as AzureStoredCredentials);
    },
    [provider, saveAws, saveGcp, saveAzure],
  );

  const stored: AwsStoredCredentials | GcpStoredCredentials | AzureStoredCredentials =
    provider === "aws" ? aws : provider === "gcp" ? gcp : azure;

  const isConfigured =
    provider === "aws" ? isAwsConfigured(aws) :
    provider === "gcp" ? isGcpConfigured(gcp) :
    isAzureConfigured(azure);

  return { stored, save, isConfigured, aws, gcp, azure };
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

// Backwards-compatible hook (returns AWS only) for callers that still rely on it
export function useAwsCredentials() {
  const [stored, setStored] = useState<AwsStoredCredentials>(loadAwsFromStorage);

  const save = useCallback((next: AwsStoredCredentials) => {
    setStored(next);
    try { localStorage.setItem(STORAGE_KEYS.aws, JSON.stringify(next)); } catch { /* ignore */ }
  }, []);

  return { stored, save, isConfigured: isAwsConfigured(stored) };
}
