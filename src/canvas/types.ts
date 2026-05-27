import type { TerraformNodeSchema } from "../models/nodeRegistry";

export type CanvasEdgeMapping = {
  fromNodeId: string;
  toNodeId: string;
  fromNodeLabel?: string;
  toNodeLabel?: string;
  sourceExpression: string;
  targetAttribute: string;
};

export type CanvasEdgeData = {
  mappings?: CanvasEdgeMapping[];
  labelOffset?: {
    x: number;
    y: number;
  };
};

export type PlanAction = "create" | "change" | "destroy";

export type ResourcePlanChange = {
  action: PlanAction;
  attrActions: Map<string, PlanAction>;
};

export type CanvasTerraformNodeData = {
  resourceId: string;
  schemaId: string;
  label: string;
  icon: string;
  terraformType: string;
  terraformKind: TerraformNodeSchema["terraformKind"];
  isContainer: boolean;
  containerKind?: "hierarchical" | "zone";
  zoneContainerIds?: string[];
  isDropTarget?: boolean;
  isLayerGhost?: boolean;
  planAction?: PlanAction;
  cloudPresence?: "present" | "missing";
};
