import type { TerraformNodeSchema } from "../models/testNodes";

export type CanvasTerraformNodeData = {
  schemaId: string;
  label: string;
  icon: string;
  terraformType: string;
  terraformKind: TerraformNodeSchema["terraformKind"];
  isContainer: boolean;
  isDropTarget?: boolean;
};
