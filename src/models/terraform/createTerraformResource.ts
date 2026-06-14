import type { TerraformResource, ResourceOrigin } from "../terraform";
import type { TerraformNodeSchema } from "../nodeRegistry";

export const createTerraformResourceFromSchema = (
  schema: TerraformNodeSchema,
  resourceName: string,
  origin: ResourceOrigin = "canvas",
): TerraformResource => ({
  id: crypto.randomUUID(),
  kind: schema.terraformKind,
  type: schema.terraformType,
  name: resourceName,
  hclTemplate: schema.hclTemplate,
  schemaId: schema.id,
  origin,
  config: { attributes: {}, blocks: {} },
  ui: { x: 100, y: 100, icon: schema.icon },
});
