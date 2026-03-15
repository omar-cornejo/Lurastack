import type { NodeTypes } from "reactflow";
import { TerraformResourceNode } from "./TerraformResourceNode";

export const canvasNodeTypes: NodeTypes = {
  terraformResource: TerraformResourceNode,
};
