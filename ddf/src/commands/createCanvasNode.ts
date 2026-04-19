import type { Node, XYPosition } from "reactflow";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { CanvasTerraformNodeData } from "../canvas/types";

export const HIERARCHICAL_CONTAINER_SCHEMA_IDS = new Set([
  "aws_subnet",
  "aws_vpc",
  "aws_region",
]);

export const ZONE_CONTAINER_SCHEMA_IDS = new Set([
  "aws_availability_zone",
  "aws_security_group",
]);

export const CONTAINER_SCHEMA_IDS = new Set([
  ...HIERARCHICAL_CONTAINER_SCHEMA_IDS,
  ...ZONE_CONTAINER_SCHEMA_IDS,
]);

export const DEFAULT_CONTAINER_SIZE = {
  width: 340,
  height: 230,
};

export const DEFAULT_RESOURCE_NODE_SIZE = {
  width: 176,
  height: 84,
};

const gridPositionFromIndex = (index: number): XYPosition => {
  const columns = 4;
  const horizontalGap = 220;
  const verticalGap = 130;
  const startX = 80;
  const startY = 80;

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
