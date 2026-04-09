import { useState, useCallback } from "react";

export type AwsCredentials = {
  accessKeyId: string;
  secretAccessKey: string;
  sessionToken: string;
  region: string;
};

const STORAGE_KEY = "ddf_aws_credentials";

function loadFromStorage(): AwsCredentials {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) {
      const parsed = JSON.parse(raw) as Partial<AwsCredentials>;
      return {
        accessKeyId: parsed.accessKeyId ?? "",
        secretAccessKey: parsed.secretAccessKey ?? "",
        sessionToken: parsed.sessionToken ?? "",
        region: parsed.region ?? "us-east-1",
      };
    }
  } catch {
    // ignore
  }
  return { accessKeyId: "", secretAccessKey: "", sessionToken: "", region: "us-east-1" };
}

export function useAwsCredentials() {
  const [credentials, setCredentials] = useState<AwsCredentials>(loadFromStorage);

  const save = useCallback((next: AwsCredentials) => {
    setCredentials(next);
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
    } catch {
      // ignore storage errors
    }
  }, []);

  const isConfigured =
    credentials.accessKeyId.trim() !== "" &&
    credentials.secretAccessKey.trim() !== "" &&
    credentials.region.trim() !== "";

  return { credentials, save, isConfigured };
}
