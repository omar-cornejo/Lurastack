import type { Node, XYPosition } from "reactflow";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { CanvasTerraformNodeData } from "../canvas/types";
import { scaledPx } from "../utils/uiScale";

export const HIERARCHICAL_CONTAINER_SCHEMA_IDS = new Set([
  "aws_subnet",
  "aws_vpc",
  "aws_region",
  "google_compute_network",
  "google_compute_subnetwork",
]);

export const ZONE_CONTAINER_SCHEMA_IDS = new Set([
  "aws_availability_zone",
  "aws_security_group",
]);

export const CONTAINER_SCHEMA_IDS = new Set([
  ...HIERARCHICAL_CONTAINER_SCHEMA_IDS,
  ...ZONE_CONTAINER_SCHEMA_IDS,
]);

// Node sizes live in ReactFlow flow coordinates, so they can't follow the root
// font-size like the rem-based node interior does. We scale them by the same UI
// factor (resolved once at module load from the current display) so a node and
// its rem content grow together and stay proportional on a 4K screen. On 1080p
// the factor is 1, so these are exactly the original 340×230 / 176×84.
export const DEFAULT_CONTAINER_SIZE = {
  width: scaledPx(340),
  height: scaledPx(230),
};

export const DEFAULT_RESOURCE_NODE_SIZE = {
  width: scaledPx(176),
  height: scaledPx(84),
};

const gridPositionFromIndex = (index: number): XYPosition => {
  const columns = 4;
  // Scale the grid spacing with the node size so auto-placed nodes keep their
  // gaps (and don't overlap) on a 4K display.
  const horizontalGap = scaledPx(220);
  const verticalGap = scaledPx(130);
  const startX = scaledPx(80);
  const startY = scaledPx(80);

  const column = index % columns;
  const row = Math.floor(index / columns);

  return {
    x: startX + column * horizontalGap,
    y: startY + row * verticalGap,
  };
};

export const createCanvasNodeFromUserAction = (
  schema: TerraformNodeSchema,
  index: number,
  position?: XYPosition,
  resourceId?: string,
  displayLabel?: string,
): Node<CanvasTerraformNodeData> => {
  const isContainer = CONTAINER_SCHEMA_IDS.has(schema.id);
  const isZoneContainer = ZONE_CONTAINER_SCHEMA_IDS.has(schema.id);

  return {
    id: crypto.randomUUID(),
    type: "terraformResource",
    dragHandle: isContainer ? ".container-drag-handle" : undefined,
    zIndex: isContainer ? 0 : 10,
    position: position ?? gridPositionFromIndex(index),
    style: isContainer
      ? {
          width: DEFAULT_CONTAINER_SIZE.width,
          height: DEFAULT_CONTAINER_SIZE.height,
        }
      : {
          width: DEFAULT_RESOURCE_NODE_SIZE.width,
          height: DEFAULT_RESOURCE_NODE_SIZE.height,
        },
    data: {
      resourceId: resourceId ?? crypto.randomUUID(),
      schemaId: schema.id,
      label: displayLabel ?? schema.label,
      icon: schema.icon,
      terraformType: schema.terraformType,
      terraformKind: schema.terraformKind,
      isContainer,
      containerKind: isContainer ? (isZoneContainer ? "zone" : "hierarchical") : undefined,
      zoneContainerIds: [],
    },
  };
};
