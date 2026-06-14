import type { TerraformResource } from "../models/terraform";
import type { CanvasTerraformNodeData, CanvasEdgeData } from "../canvas/types";
import type { CloudProvider, ProviderSettings } from "../models/providerConfig";

export type SerializedNode = {
  id: string;
  type?: string;
  position: { x: number; y: number };
  data: CanvasTerraformNodeData;
  parentNode?: string;
  extent?: "parent";
  width?: number;
  height?: number;
  style?: Record<string, unknown>;
};

export type SerializedEdge = {
  id: string;
  source: string;
  target: string;
  sourceHandle?: string | null;
  targetHandle?: string | null;
  type?: string;
  data?: CanvasEdgeData;
};

export type CodeFile = {
  id: string;
  name: string;
  content: string;
};

export type ViewSnapshot = {
  id: string;
  name: string;
  resources: TerraformResource[];
  nodes: SerializedNode[];
  edges: SerializedEdge[];
  codeFiles?: CodeFile[];
  activeProvider?: CloudProvider;
  providerSettings?: Partial<ProviderSettings>;
};

export type LuraProject = {
  version: "1";
  meta: {
    name: string;
    createdAt: string;
    updatedAt: string;
  };
  settings: {
    autosave: boolean;
  };
  activeViewId: string;
  views: ViewSnapshot[];
};

export type RecentProject = {
  name: string;
  path: string;
  updatedAt: string;
};
