import { useState, useCallback } from "react";

export type CredentialMode = "manual" | "profile" | "env";

export interface StoredCredentials {
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

export type ResolvedAwsCredentials = {
  accessKeyId: string;
  secretAccessKey: string;
  sessionToken: string;
  region: string;
};

// Backwards-compat alias used by existing callers (Header etc.)
export type AwsCredentials = ResolvedAwsCredentials;

const STORAGE_KEY = "ddf_aws_credentials";

function loadFromStorage(): StoredCredentials {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) {
      const parsed = JSON.parse(raw) as Partial<StoredCredentials> & {
        accessKeyId?: string;
        secretAccessKey?: string;
        sessionToken?: string;
        region?: string;
      };
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
  } catch {
    // ignore
  }
  return {
    mode: "manual",
    accessKeyId: "",
    secretAccessKey: "",
    sessionToken: "",
    region: "us-east-1",
  };
}

export function useAwsCredentials() {
  const [stored, setStored] = useState<StoredCredentials>(loadFromStorage);

  const save = useCallback((next: StoredCredentials) => {
    setStored(next);
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
    } catch {
      // ignore storage errors
    }
  }, []);

  const isConfigured = (() => {
    if (stored.mode === "manual") {
      return (
        (stored.accessKeyId ?? "").trim() !== "" &&
        (stored.secretAccessKey ?? "").trim() !== "" &&
        (stored.region ?? "").trim() !== ""
      );
    }
    if (stored.mode === "profile") {
      return (stored.profile ?? "").trim() !== "";
    }
    return true;
  })();

  return { stored, save, isConfigured };
}
