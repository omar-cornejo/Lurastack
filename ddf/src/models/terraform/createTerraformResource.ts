import type { TerraformResource } from "../terraform";
import type { TerraformNodeSchema } from "../testNodes";

export const createTerraformResourceFromSchema = (
  schema: TerraformNodeSchema,
  resourceName: string,
): TerraformResource => ({
  id: crypto.randomUUID(),
  kind: schema.terraformKind,
  type: schema.terraformType,
  name: resourceName,
  hclTemplate: schema.hclTemplate,
  schemaId: schema.id,
  config: { attributes: {}, blocks: {} },
  ui: { x: 100, y: 100, icon: schema.icon },
});
