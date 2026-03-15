import type { Node, XYPosition } from "reactflow";
import type { TerraformNodeSchema } from "../models/testNodes";
import type { CanvasTerraformNodeData } from "../canvas/types";

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
): Node<CanvasTerraformNodeData> => ({
  id: crypto.randomUUID(),
  type: "terraformResource",
  position: position ?? gridPositionFromIndex(index),
  data: {
    label: schema.label,
    icon: schema.icon,
    terraformType: schema.terraformType,
    terraformKind: schema.terraformKind,
  },
});
