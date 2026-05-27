import type { TerraformNodeSchema } from "../models/nodeRegistry";

export const NODE_DRAG_MIME = "application/x-ddfib-node-schema";

export const serializeDraggedNode = (node: TerraformNodeSchema) =>
  JSON.stringify(node);

export const parseDraggedNode = (raw: string): TerraformNodeSchema | null => {
  try {
    const parsed = JSON.parse(raw) as TerraformNodeSchema;
    if (!parsed?.id || !parsed?.terraformType || !parsed?.label) {
      return null;
    }
    return parsed;
  } catch {
    return null;
  }
};
