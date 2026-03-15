import type { TerraformNodeSchema } from "../models/testNodes";

export type CanvasTerraformNodeData = {
  label: string;
  icon: string;
  terraformType: string;
  terraformKind: TerraformNodeSchema["terraformKind"];
};
