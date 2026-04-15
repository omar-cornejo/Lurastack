import type { TerraformNodeSchema } from "../models/nodeRegistry";

export type InspectorProperty = {
  name: string;
  type: string;
  required?: boolean;
  optional?: boolean;
  computed?: boolean;
  typeKinds: string[];
  rawType?: unknown;
};

const schemaModules = import.meta.glob("../schemas/aws/**/*.json", { eager: true });

const normalizeSchemaPath = (path: string) =>
  path
    .replace(/^\.\.\//, "")
    .replace(/^src\//, "")
    .replace(/^\//, "");

const schemaTypeToText = (type: unknown): string => {
  if (typeof type === "string") return type;
  if (Array.isArray(type)) {
    return type
      .map((value) => (typeof value === "string" ? value : JSON.stringify(value)))
      .join(", ");
  }
  if (type && typeof type === "object") {
    return JSON.stringify(type);
  }
  return "unknown";
};

const extractTypeKinds = (type: unknown, acc = new Set<string>()): string[] => {
  if (typeof type === "string") {
    acc.add(type.toLowerCase());
    return Array.from(acc);
  }

  if (Array.isArray(type)) {
    if (typeof type[0] === "string") {
      acc.add(type[0].toLowerCase());
    }
    type.slice(1).forEach((item) => {
      extractTypeKinds(item, acc);
    });
    return Array.from(acc);
  }

  if (type && typeof type === "object") {
    acc.add("object");
    Object.values(type).forEach((value) => {
      extractTypeKinds(value, acc);
    });
    return Array.from(acc);
  }

  return Array.from(acc);
};

const getSchemaDocument = (sourceSchemaPath?: string): any | undefined => {
  if (!sourceSchemaPath) return undefined;
  const target = normalizeSchemaPath(sourceSchemaPath);

  for (const [modulePath, moduleValue] of Object.entries(schemaModules)) {
    if (normalizeSchemaPath(modulePath) === target) {
      const candidate = moduleValue as { default?: unknown };
      return (candidate?.default ?? moduleValue) as any;
    }
  }

  return undefined;
};

const collectAttributesFromBlock = (
  block: any,
  prefix = "",
  acc: InspectorProperty[] = [],
) => {
  if (!block) return acc;

  const attrs = block.attributes ?? {};
  Object.entries(attrs).forEach(([name, meta]) => {
    const typedMeta = meta as {
      type?: unknown;
      required?: boolean;
      computed?: boolean;
      optional?: boolean;
    };

    acc.push({
      name: `${prefix}${name}`,
      type: schemaTypeToText(typedMeta.type),
      required: !!typedMeta.required,
      optional: !!typedMeta.optional,
      computed: !!typedMeta.computed,
      typeKinds: extractTypeKinds(typedMeta.type),
      rawType: typedMeta.type,
    });
  });

  const blockTypes = block.block_types ?? {};
  Object.entries(blockTypes).forEach(([blockName, blockMeta]) => {
    const typedBlockMeta = blockMeta as {
      block?: any;
    };

    if (typedBlockMeta.block) {
      collectAttributesFromBlock(
        typedBlockMeta.block,
        `${prefix}${blockName}.`,
        acc,
      );
    }
  });

  return acc;
};

export const getInspectorPropertiesForSchema = (
  schema?: TerraformNodeSchema,
): InspectorProperty[] => {
  if (!schema) return [];

  const schemaDocument = getSchemaDocument(schema.sourceSchemaPath);
  const collected = collectAttributesFromBlock(schemaDocument?.block)
    .sort((left, right) => left.name.localeCompare(right.name));

  if (collected.length > 0) {
    return collected;
  }

  return schema.properties.map((property) => ({
    name: property.name,
    type: property.type,
    required: property.required,
    optional: !property.required,
    computed: property.computed,
    typeKinds: extractTypeKinds(property.type),
  }));
};
