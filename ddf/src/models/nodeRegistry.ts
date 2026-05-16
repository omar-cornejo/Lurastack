export type TerraformNodeProperty = {
  name: string;
  type: string;
  required?: boolean;
  computed?: boolean;
};

export type TerraformNodeSchema = {
  id: string;
  label: string;
  schemaGroup: "resources" | "data_sources" | "ephemeral_resources" | "functions" | "provider";
  terraformType: string;
  terraformKind: "resource" | "data";
  icon: string;
  hclTemplate: string;
  properties: TerraformNodeProperty[];
  searchTerms?: string[];
  sourceSchemaPath: string;
  sourceTemplatePath: string;
  provider: "aws" | "gcp" | "azure";
};

import { resolveTerraformIcon } from "./iconRegistry";

type CloudProvider = "aws" | "gcp" | "azure";

const resourceSchemaModules: Record<CloudProvider, Record<string, { default: unknown }>> = {
  aws: import.meta.glob<{ default: unknown }>("../schemas/aws/resources/*.json", { eager: true }),
  gcp: import.meta.glob<{ default: unknown }>("../schemas/gcp/resources/*.json", { eager: true }),
  azure: import.meta.glob<{ default: unknown }>("../schemas/azure/resources/*.json", { eager: true }),
};

const dataSchemaModules: Record<CloudProvider, Record<string, { default: unknown }>> = {
  aws: import.meta.glob<{ default: unknown }>("../schemas/aws/data_sources/*.json", { eager: true }),
  gcp: import.meta.glob<{ default: unknown }>("../schemas/gcp/data_sources/*.json", { eager: true }),
  azure: import.meta.glob<{ default: unknown }>("../schemas/azure/data_sources/*.json", { eager: true }),
};

const resourceTemplates: Record<CloudProvider, Record<string, string>> = {
  aws: import.meta.glob<string>("../schemas/aws/templates/resources/*.tf.tpl", { eager: true, query: "?raw", import: "default" }),
  gcp: import.meta.glob<string>("../schemas/gcp/templates/resources/*.tf.tpl", { eager: true, query: "?raw", import: "default" }),
  azure: import.meta.glob<string>("../schemas/azure/templates/resources/*.tf.tpl", { eager: true, query: "?raw", import: "default" }),
};

const dataTemplates: Record<CloudProvider, Record<string, string>> = {
  aws: import.meta.glob<string>("../schemas/aws/templates/data_sources/*.tf.tpl", { eager: true, query: "?raw", import: "default" }),
  gcp: import.meta.glob<string>("../schemas/gcp/templates/data_sources/*.tf.tpl", { eager: true, query: "?raw", import: "default" }),
  azure: import.meta.glob<string>("../schemas/azure/templates/data_sources/*.tf.tpl", { eager: true, query: "?raw", import: "default" }),
};

const PROVIDER_PREFIXES: Record<CloudProvider, string> = {
  aws: "aws_",
  gcp: "google_",
  azure: "azurerm_",
};

function normalizeType(raw: unknown): string {
  if (typeof raw === "string") return raw;
  if (Array.isArray(raw) && raw.length >= 2) {
    const [container, inner] = raw as [unknown, unknown];
    if (typeof inner === "string") return `${container}(${inner})`;
    return String(container);
  }
  return "any";
}

function toLabel(terraformType: string, provider: CloudProvider): string {
  const prefix = PROVIDER_PREFIXES[provider];
  return terraformType
    .replace(new RegExp(`^${prefix}`), "")
    .split("_")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(" ");
}

function buildSchemas(
  provider: CloudProvider,
  schemaModules: Record<string, { default: unknown }>,
  templateModules: Record<string, string>,
  group: "resources" | "data_sources",
  kind: "resource" | "data",
): TerraformNodeSchema[] {
  return Object.entries(schemaModules).map(([schemaPath, module]) => {
    const parts = schemaPath.split("/");
    const filename = parts[parts.length - 1]!;
    const terraformType = filename.replace(".json", "");
    const label = toLabel(terraformType, provider);

    const templateKey = Object.keys(templateModules).find((k) =>
      k.endsWith(`${terraformType}.tf.tpl`),
    );
    const hclTemplate = templateKey ? templateModules[templateKey] : "";

    const raw = module.default ?? module;
    const jsonBlock = (raw as { block?: { attributes?: Record<string, unknown> } })?.block ?? {};
    const attributes: Record<string, Record<string, unknown>> =
      (jsonBlock.attributes as Record<string, Record<string, unknown>>) ?? {};

    const properties: TerraformNodeProperty[] = Object.entries(attributes).map(
      ([name, attr]) => ({
        name,
        type: normalizeType(attr.type),
        required: !attr.optional && !attr.computed,
        computed: attr.computed === true,
      }),
    );

    return {
      id: terraformType,
      label,
      schemaGroup: group,
      terraformType,
      terraformKind: kind,
      icon: resolveTerraformIcon(terraformType),
      hclTemplate,
      properties,
      sourceSchemaPath: `src/schemas/${provider}/${group}/${filename}`,
      sourceTemplatePath: `src/schemas/${provider}/templates/${group}/${terraformType}.tf.tpl`,
      provider,
    };
  });
}

export function getSchemasForProvider(provider: CloudProvider): TerraformNodeSchema[] {
  return [
    ...buildSchemas(provider, resourceSchemaModules[provider], resourceTemplates[provider], "resources", "resource"),
    ...buildSchemas(provider, dataSchemaModules[provider], dataTemplates[provider], "data_sources", "data"),
  ];
}

export const NODE_SCHEMAS: TerraformNodeSchema[] = [
  ...getSchemasForProvider("aws"),
  ...getSchemasForProvider("gcp"),
  ...getSchemasForProvider("azure"),
];
