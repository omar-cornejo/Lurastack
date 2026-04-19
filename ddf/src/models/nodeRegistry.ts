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
};

import { resolveTerraformIcon } from "./iconRegistry";

// Vite glob: auto-discover all JSON schemas and HCL templates at build time.
// To add a new resource/data source, just drop the .json schema and .tf.tpl
// template in the matching folder — no code changes needed.
const resourceSchemaModules = import.meta.glob<{ default: unknown }>(
  "../schemas/aws/resources/*.json",
  { eager: true },
);
const dataSchemaModules = import.meta.glob<{ default: unknown }>(
  "../schemas/aws/data_sources/*.json",
  { eager: true },
);
const resourceTemplates = import.meta.glob<string>(
  "../schemas/aws/templates/resources/*.tf.tpl",
  { eager: true, query: "?raw", import: "default" },
);
const dataTemplates = import.meta.glob<string>(
  "../schemas/aws/templates/data_sources/*.tf.tpl",
  { eager: true, query: "?raw", import: "default" },
);

function normalizeType(raw: unknown): string {
  if (typeof raw === "string") return raw;
  if (Array.isArray(raw) && raw.length >= 2) {
    const [container, inner] = raw as [unknown, unknown];
    if (typeof inner === "string") return `${container}(${inner})`;
    return String(container);
  }
  return "any";
}

function toLabel(terraformType: string): string {
  return terraformType
    .replace(/^aws_/, "")
    .split("_")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(" ");
}

function buildSchemas(
  schemaModules: Record<string, { default: unknown }>,
  templateModules: Record<string, string>,
  group: "resources" | "data_sources",
  kind: "resource" | "data",
): TerraformNodeSchema[] {
  return Object.entries(schemaModules).map(([schemaPath, module]) => {
    const parts = schemaPath.split("/");
    const filename = parts[parts.length - 1]!;
    const terraformType = filename.replace(".json", "");
    const label = toLabel(terraformType);

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
      sourceSchemaPath: `src/schemas/aws/${group}/${filename}`,
      sourceTemplatePath: `src/schemas/aws/templates/${group}/${terraformType}.tf.tpl`,
    };
  });
}

export const NODE_SCHEMAS: TerraformNodeSchema[] = [
  ...buildSchemas(resourceSchemaModules, resourceTemplates, "resources", "resource"),
  ...buildSchemas(dataSchemaModules, dataTemplates, "data_sources", "data"),
];
