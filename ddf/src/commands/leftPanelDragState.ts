import type { TerraformNodeSchema } from "../models/testNodes";

let activeDraggedSchema: TerraformNodeSchema | null = null;

export const setActiveLeftPanelDrag = (schema: TerraformNodeSchema) => {
  activeDraggedSchema = schema;
};

export const getActiveLeftPanelDrag = () => activeDraggedSchema;

export const clearActiveLeftPanelDrag = () => {
  activeDraggedSchema = null;
};
