import type { TerraformNodeSchema } from "../models/testNodes";

export type CanvasTerraformNodeData = {
  resourceId: string;
  schemaId: string;
  label: string;
  icon: string;
  terraformType: string;
  terraformKind: TerraformNodeSchema["terraformKind"];
  isContainer: boolean;
  isDropTarget?: boolean;
};
