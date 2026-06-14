import { describe, it, expect } from "vitest";
import { buildEnvForProvider } from "./useAwsCredentials";
import type {
  AwsStoredCredentials,
  GcpStoredCredentials,
  AzureStoredCredentials,
} from "./useAwsCredentials";

// buildEnvForProvider encodes the exact Terraform env-var names per provider.
// A typo here silently breaks `terraform apply`, so these tests pin the names.

const empty = {
  awsCredentials: {} as AwsStoredCredentials,
  gcpCredentials: {} as GcpStoredCredentials,
  azureCredentials: {} as AzureStoredCredentials,
};

describe("buildEnvForProvider — AWS", () => {
  it("maps the full credential set and sets BOTH region vars", () => {
    const env = buildEnvForProvider("aws", {
      ...empty,
      awsCredentials: {
        accessKeyId: "AKIA",
        secretAccessKey: "secret",
        sessionToken: "token",
        region: "eu-west-1",
      } as AwsStoredCredentials,
    });
    expect(env.AWS_ACCESS_KEY_ID).toBe("AKIA");
    expect(env.AWS_SECRET_ACCESS_KEY).toBe("secret");
    expect(env.AWS_SESSION_TOKEN).toBe("token");
    expect(env.AWS_DEFAULT_REGION).toBe("eu-west-1");
    expect(env.AWS_REGION).toBe("eu-west-1");
  });

  it("omits optional fields that are absent", () => {
    const env = buildEnvForProvider("aws", {
      ...empty,
      awsCredentials: { accessKeyId: "AKIA", secretAccessKey: "s" } as AwsStoredCredentials,
    });
    expect("AWS_SESSION_TOKEN" in env).toBe(false);
    expect("AWS_REGION" in env).toBe(false);
  });
});

describe("buildEnvForProvider — GCP", () => {
  it("sets the three project vars from projectId", () => {
    const env = buildEnvForProvider("gcp", {
      ...empty,
      gcpCredentials: { projectId: "my-proj", region: "europe-west1" } as GcpStoredCredentials,
    });
    expect(env.GOOGLE_PROJECT).toBe("my-proj");
    expect(env.GOOGLE_CLOUD_PROJECT).toBe("my-proj");
    expect(env.TF_VAR_project).toBe("my-proj");
    expect(env.GOOGLE_REGION).toBe("europe-west1");
  });

  it("prefers the service-account file path over inline JSON", () => {
    const env = buildEnvForProvider("gcp", {
      ...empty,
      gcpCredentials: {
        projectId: "p",
        serviceAccountFilePath: "/key.json",
        serviceAccountJson: "{...}",
      } as GcpStoredCredentials,
    });
    expect(env.GOOGLE_APPLICATION_CREDENTIALS).toBe("/key.json");
    expect("GOOGLE_CREDENTIALS" in env).toBe(false);
  });

  it("falls back to inline JSON when no file path is present", () => {
    const env = buildEnvForProvider("gcp", {
      ...empty,
      gcpCredentials: { projectId: "p", serviceAccountJson: "{json}" } as GcpStoredCredentials,
    });
    expect(env.GOOGLE_CREDENTIALS).toBe("{json}");
    expect("GOOGLE_APPLICATION_CREDENTIALS" in env).toBe(false);
  });
});

describe("buildEnvForProvider — Azure", () => {
  it("maps the ARM_* variables", () => {
    const env = buildEnvForProvider("azure", {
      ...empty,
      azureCredentials: {
        subscriptionId: "sub",
        tenantId: "ten",
        clientId: "cli",
        clientSecret: "sec",
        region: "westeurope",
      } as AzureStoredCredentials,
    });
    expect(env.ARM_SUBSCRIPTION_ID).toBe("sub");
    expect(env.ARM_TENANT_ID).toBe("ten");
    expect(env.ARM_CLIENT_ID).toBe("cli");
    expect(env.ARM_CLIENT_SECRET).toBe("sec");
    expect(env.ARM_LOCATION).toBe("westeurope");
  });
});

describe("buildEnvForProvider — empty", () => {
  it("returns an empty object when no credentials are set", () => {
    expect(buildEnvForProvider("aws", empty)).toEqual({});
    expect(buildEnvForProvider("gcp", empty)).toEqual({});
    expect(buildEnvForProvider("azure", empty)).toEqual({});
  });
});
