import type { Node, XYPosition } from "reactflow";
import type { TerraformNodeSchema } from "../models/testNodes";
import type { CanvasTerraformNodeData } from "../canvas/types";
import {
  createCanvasNodeFromUserAction,
  CONTAINER_SCHEMA_IDS,
  DEFAULT_CONTAINER_SIZE,
  DEFAULT_RESOURCE_NODE_SIZE,
} from "./createCanvasNode";
import { warn } from "./warn";

const CONTAINER_PADDING_X = 20;
const CONTAINER_PADDING_BOTTOM = 20;
const CONTAINER_HEADER_SPACE = 58;
const MAX_CONTAINER_DIMENSION = 6000;
const EXPANSION_SIBLING_PADDING = 20;
const CHILD_COLLISION_PADDING = 12;
const MAX_PLACEMENT_ATTEMPTS = 300;

type CanvasNode = Node<CanvasTerraformNodeData>;

type NodeSize = { width: number; height: number };
type NodeRect = { x: number; y: number; width: number; height: number };

const MIN_OVERLAP_RATIO = 0.35;

export const getNodeSize = (node: CanvasNode) => {
  const measuredWidth = typeof node.width === "number" ? node.width : undefined;
  const measuredHeight = typeof node.height === "number" ? node.height : undefined;

  const width =
    typeof node.style?.width === "number"
      ? node.style.width
      : typeof measuredWidth === "number"
        ? measuredWidth
      : node.data.isContainer
        ? DEFAULT_CONTAINER_SIZE.width
        : DEFAULT_RESOURCE_NODE_SIZE.width;

  const height =
    typeof node.style?.height === "number"
      ? node.style.height
      : typeof measuredHeight === "number"
        ? measuredHeight
      : node.data.isContainer
        ? DEFAULT_CONTAINER_SIZE.height
        : DEFAULT_RESOURCE_NODE_SIZE.height;

  return { width, height };
};

export const getAbsolutePosition = (
  node: CanvasNode,
  nodeMap: Map<string, CanvasNode>,
): XYPosition => {
  if (!node.parentNode) return node.position;
  const parent = nodeMap.get(node.parentNode);
  if (!parent) return node.position;

  const parentAbsolutePosition = getAbsolutePosition(parent, nodeMap);
  return {
    x: parentAbsolutePosition.x + node.position.x,
    y: parentAbsolutePosition.y + node.position.y,
  };
};

const isPointInsideContainer = (
  point: XYPosition,
  container: CanvasNode,
  nodeMap: Map<string, CanvasNode>,
) => {
  if (!container.data.isContainer) return false;

  const absolute = getAbsolutePosition(container, nodeMap);
  const size = getNodeSize(container);

  return (
    point.x >= absolute.x &&
    point.x <= absolute.x + size.width &&
    point.y >= absolute.y &&
    point.y <= absolute.y + size.height
  );
};

const getRectIntersectionArea = (left: NodeRect, right: NodeRect) => {
  const overlapX = Math.max(
    0,
    Math.min(left.x + left.width, right.x + right.width) - Math.max(left.x, right.x),
  );
  const overlapY = Math.max(
    0,
    Math.min(left.y + left.height, right.y + right.height) - Math.max(left.y, right.y),
  );
  return overlapX * overlapY;
};

const toNodeRect = (position: XYPosition, size: NodeSize): NodeRect => ({
  x: position.x,
  y: position.y,
  width: size.width,
  height: size.height,
});

const getAbsoluteNodeRect = (
  node: CanvasNode,
  nodeMap: Map<string, CanvasNode>,
): NodeRect => {
  const position = getAbsolutePosition(node, nodeMap);
  const size = getNodeSize(node);
  return toNodeRect(position, size);
};

export const findContainerAtPoint = (
  nodes: CanvasNode[],
  point: XYPosition,
  excludedNodeIds: Set<string> = new Set(),
) => {
  const nodeMap = new Map(nodes.map((node) => [node.id, node]));

  const candidates = nodes
    .filter((node) => !excludedNodeIds.has(node.id))
    .filter((node) => node.data.isContainer)
    .filter((node) => isPointInsideContainer(point, node, nodeMap));

  if (!candidates.length) return undefined;

  return candidates.sort((left, right) => {
    const leftSize = getNodeSize(left);
    const rightSize = getNodeSize(right);
    return leftSize.width * leftSize.height - rightSize.width * rightSize.height;
  })[0];
};

export const findBestContainerForNodeBounds = (
  nodes: CanvasNode[],
  nodePosition: XYPosition,
  nodeSize: NodeSize,
  excludedNodeIds: Set<string> = new Set(),
  pointerAbsolute?: XYPosition,
) => {
  const draggedRect = toNodeRect(nodePosition, nodeSize);
  const draggedArea = Math.max(1, draggedRect.width * draggedRect.height);
  const draggedCenter: XYPosition = {
    x: draggedRect.x + draggedRect.width / 2,
    y: draggedRect.y + draggedRect.height / 2,
  };
  const referencePointer = pointerAbsolute ?? draggedCenter;

  const nodeMap = new Map(nodes.map((node) => [node.id, node]));

  const candidates = nodes
    .filter((node) => !excludedNodeIds.has(node.id))
    .filter((node) => node.data.isContainer)
    .map((container) => {
      const containerRect = getAbsoluteNodeRect(container, nodeMap);
      const overlapArea = getRectIntersectionArea(draggedRect, containerRect);
      const overlapRatio = overlapArea / draggedArea;
      const pointerInside = isPointInsideContainer(referencePointer, container, nodeMap);
      const centerInside = isPointInsideContainer(draggedCenter, container, nodeMap);
      const containerArea = containerRect.width * containerRect.height;
      return {
        container,
        pointerInside,
        overlapRatio,
        centerInside,
        containerArea,
      };
    })
    .filter(
      (candidate) =>
        candidate.pointerInside ||
        candidate.centerInside ||
        candidate.overlapRatio >= MIN_OVERLAP_RATIO,
    );

  if (!candidates.length) return undefined;

  candidates.sort((left, right) => {
    if (left.pointerInside !== right.pointerInside) {
      return left.pointerInside ? -1 : 1;
    }

    if (left.pointerInside && right.pointerInside) {
      return left.containerArea - right.containerArea;
    }

    if (left.centerInside !== right.centerInside) {
      return left.centerInside ? -1 : 1;
    }

    if (left.overlapRatio !== right.overlapRatio) {
      return right.overlapRatio - left.overlapRatio;
    }

    return left.containerArea - right.containerArea;
  });

  return candidates[0]?.container;
};

export const expandAncestorContainers = (nodes: CanvasNode[], startNodeId: string) => {
  const nodeMap = new Map(nodes.map((node) => [node.id, node]));
  let child = nodeMap.get(startNodeId);
  const startSubtreeSize = getSubtreeFootprintSize(nodes, startNodeId);

  while (child?.parentNode) {
    const parent = nodeMap.get(child.parentNode);
    if (!parent) break;

    const parentSize = getNodeSize(parent);
    const childSize =
      child.id === startNodeId && startSubtreeSize
        ? startSubtreeSize
        : getNodeSize(child);

    let shiftX = 0;
    let shiftY = 0;

    if (child.position.x < CONTAINER_PADDING_X) {
      shiftX = child.position.x - CONTAINER_PADDING_X;
    }
    if (child.position.y < CONTAINER_HEADER_SPACE) {
      shiftY = child.position.y - CONTAINER_HEADER_SPACE;
    }

    const requiredWidth =
      child.position.x + childSize.width + CONTAINER_PADDING_X;
    const requiredHeight =
      child.position.y + childSize.height + CONTAINER_PADDING_BOTTOM;

    const nextWidth = Math.max(parentSize.width - shiftX, requiredWidth - shiftX);
    const nextHeight = Math.max(parentSize.height - shiftY, requiredHeight - shiftY);

    if (shiftX !== 0 || shiftY !== 0) {
      parent.position = {
        x: parent.position.x + shiftX,
        y: parent.position.y + shiftY,
      };

      nodes.forEach((n) => {
        if (n.parentNode === parent.id) {
          n.position = {
            x: n.position.x - shiftX,
            y: n.position.y - shiftY,
          };
        }
      });
    }

    if (nextWidth !== parentSize.width || nextHeight !== parentSize.height) {
      parent.style = {
        ...parent.style,
        width: nextWidth,
        height: nextHeight,
      };
    }

    child = parent;
  }

  return nodes;
};

const getContainerMinimumSize = (): NodeSize => ({
  width: DEFAULT_CONTAINER_SIZE.width,
  height: DEFAULT_CONTAINER_SIZE.height,
});

const recomputeContainerSizeFromChildren = (
  nodes: CanvasNode[],
  containerId: string,
): NodeSize | undefined => {
  const container = nodes.find((node) => node.id === containerId);
  if (!container || !container.data.isContainer) return undefined;

  const minSize = getContainerMinimumSize();
  const directChildren = nodes.filter((node) => node.parentNode === containerId);

  if (!directChildren.length) {
    return minSize;
  }

  let requiredWidth = minSize.width;
  let requiredHeight = minSize.height;

  directChildren.forEach((child) => {
    const childSize = getNodeSize(child);
    requiredWidth = Math.max(
      requiredWidth,
      child.position.x + childSize.width + CONTAINER_PADDING_X,
    );
    requiredHeight = Math.max(
      requiredHeight,
      child.position.y + childSize.height + CONTAINER_PADDING_BOTTOM,
    );
  });

  return {
    width: Math.min(requiredWidth, MAX_CONTAINER_DIMENSION),
    height: Math.min(requiredHeight, MAX_CONTAINER_DIMENSION),
  };
};

export const shrinkAncestorContainers = (
  nodes: CanvasNode[],
  startContainerId: string,
) => {
  const nodeMap = new Map(nodes.map((node) => [node.id, node]));
  let currentContainer = nodeMap.get(startContainerId);

  while (currentContainer?.data.isContainer) {
    const nextSize = recomputeContainerSizeFromChildren(nodes, currentContainer.id);
    if (nextSize) {
      const currentSize = getNodeSize(currentContainer);
      if (
        currentSize.width !== nextSize.width ||
        currentSize.height !== nextSize.height
      ) {
        currentContainer.style = {
          ...currentContainer.style,
          width: nextSize.width,
          height: nextSize.height,
        };
      }
    }

    if (!currentContainer.parentNode) break;
    currentContainer = nodeMap.get(currentContainer.parentNode);
  }

  return nodes;
};

export const applyManualContainerResizeEffects = (
  previousNodes: CanvasNode[],
  currentNodes: CanvasNode[],
  resizedNodeIds: string[],
) => {
  if (!resizedNodeIds.length) return currentNodes;

  const previousNodeMap = new Map(previousNodes.map((node) => [node.id, node]));

  const applyOffsets = (
    map: Map<string, CanvasNode>,
    nodeId: string,
    dx: number,
    dy: number
  ) => {
    map.forEach((node) => {
      if (node.parentNode === nodeId) {
        node.position = {
          x: node.position.x - dx,
          y: node.position.y - dy,
        };
      }
    });
  };

  const resizedIdSet = new Set(resizedNodeIds);
  const workingNodes: CanvasNode[] = currentNodes.map((node) => ({
    ...node,
    position: { ...node.position },
    style: node.style ? { ...node.style } : undefined,
    data: { ...node.data },
  }));

  const resizedContainers = workingNodes.filter(
    (node) => resizedIdSet.has(node.id) && node.data.isContainer,
  );

  if (!resizedContainers.length) return workingNodes;

  const intersectsWithPadding = (left: NodeRect, right: NodeRect, padding: number) => {
    const leftExpanded = {
      x: left.x - padding,
      y: left.y - padding,
      width: left.width + padding * 2,
      height: left.height + padding * 2,
    };

    return (
      leftExpanded.x < right.x + right.width &&
      leftExpanded.x + leftExpanded.width > right.x &&
      leftExpanded.y < right.y + right.height &&
      leftExpanded.y + leftExpanded.height > right.y
    );
  };

  const hasSameLayerCollision = (nodes: CanvasNode[], nodeId: string) => {
    const nodeMap = new Map(nodes.map((node) => [node.id, node]));
    const resizedNode = nodeMap.get(nodeId);
    if (!resizedNode) return false;

    const resizedRect = getAbsoluteNodeRect(resizedNode, nodeMap);
    const siblings = nodes.filter(
      (candidate) =>
        candidate.id !== resizedNode.id &&
        candidate.parentNode === resizedNode.parentNode,
    );

    return siblings.some((sibling) => {
      const siblingRect = getAbsoluteNodeRect(sibling, nodeMap);
      return intersectsWithPadding(
        resizedRect,
        siblingRect,
        EXPANSION_SIBLING_PADDING,
      );
    });
  };

  const restorePreviousTransform = (
    target: CanvasNode,
    previousNode?: CanvasNode,
  ) => {
    if (!previousNode) return;

    const previousSize = getNodeSize(previousNode);
    const dx = target.position.x - previousNode.position.x;
    const dy = target.position.y - previousNode.position.y;
    
    target.position = { ...previousNode.position };
    target.style = {
      ...target.style,
      width: previousSize.width,
      height: previousSize.height,
    };

    if (dx !== 0 || dy !== 0) {
      applyOffsets(new Map(workingNodes.map(n => [n.id, n])), target.id, -dx, -dy);
    }
  };

  for (const container of resizedContainers) {
    const minSize = recomputeContainerSizeFromChildren(workingNodes, container.id);
    if (!minSize) continue;

    const previousNode = previousNodeMap.get(container.id);
    const previousSize = previousNode ? getNodeSize(previousNode) : getNodeSize(container);

    const currentSize = getNodeSize(container);
    let nextWidth = Math.max(currentSize.width, minSize.width);
    let nextHeight = Math.max(currentSize.height, minSize.height);

    let dx = 0;
    let dy = 0;

    if (previousNode) {
      const rawDx = container.position.x - previousNode.position.x;
      const rawDy = container.position.y - previousNode.position.y;

      const actualDWidth = nextWidth - previousSize.width;
      const actualDHeight = nextHeight - previousSize.height;

      if (rawDx !== 0) dx = -actualDWidth;
      if (rawDy !== 0) dy = -actualDHeight;

      container.position = {
        x: previousNode.position.x + dx,
        y: previousNode.position.y + dy,
      };
    }

    if (dx !== 0 || dy !== 0) {
      applyOffsets(new Map(workingNodes.map(n => [n.id, n])), container.id, dx, dy);
    }

    if (nextWidth !== currentSize.width || nextHeight !== currentSize.height) {
      container.style = {
        ...container.style,
        width: nextWidth,
        height: nextHeight,
      };
    }

    const isExpansion =
      nextWidth > previousSize.width ||
      nextHeight > previousSize.height ||
      dx !== 0 || dy !== 0;

    if (!isExpansion) {
      continue;
    }


    if (hasSameLayerCollision(workingNodes, container.id)) {
      restorePreviousTransform(container, previousNode);
      warn(
        `Cannot resize '${container.data.label}': expansion collides with a sibling in the same layer.`,
        "RESIZE_SIBLING_COLLISION",
      );
      continue;
    }

    if (container.parentNode) {
      const expansionCheck = canExpandHierarchyForPlacement(
        workingNodes,
        container.parentNode,
        container.position,
        { width: nextWidth, height: nextHeight },
      );

      if (!expansionCheck.ok) {
        restorePreviousTransform(container, previousNode);
        warn(
          `Cannot resize '${container.data.label}': ${expansionCheck.reason}`,
          "RESIZE_ANCESTOR_BLOCKED",
        );
        continue;
      }
    }

  }

  for (const container of resizedContainers) {
    expandAncestorContainers(workingNodes, container.id);
  }

  return workingNodes;
};

export const getDescendantNodeIds = (nodes: CanvasNode[], nodeId: string) => {
  const descendants = new Set<string>();
  const stack = [nodeId];

  while (stack.length > 0) {
    const currentId = stack.pop();
    if (!currentId) continue;

    nodes.forEach((candidate) => {
      if (candidate.parentNode === currentId && !descendants.has(candidate.id)) {
        descendants.add(candidate.id);
        stack.push(candidate.id);
      }
    });
  }

  return descendants;
};

export const getSubtreeFootprintSize = (
  nodes: CanvasNode[],
  rootNodeId: string,
): NodeSize | undefined => {
  const nodeMap = new Map(nodes.map((node) => [node.id, node]));
  const root = nodeMap.get(rootNodeId);
  if (!root) return undefined;

  const rootAbsolute = getAbsolutePosition(root, nodeMap);
  const rootSize = getNodeSize(root);

  let maxX = rootAbsolute.x + rootSize.width;
  let maxY = rootAbsolute.y + rootSize.height;

  const subtreeIds = getDescendantNodeIds(nodes, rootNodeId);
  subtreeIds.add(rootNodeId);

  subtreeIds.forEach((id) => {
    const node = nodeMap.get(id);
    if (!node) return;

    const absolute = getAbsolutePosition(node, nodeMap);
    const size = getNodeSize(node);

    maxX = Math.max(maxX, absolute.x + size.width);
    maxY = Math.max(maxY, absolute.y + size.height);
  });

  return {
    width: Math.max(rootSize.width, maxX - rootAbsolute.x),
    height: Math.max(rootSize.height, maxY - rootAbsolute.y),
  };
};

const canExpandHierarchyForPlacement = (
  nodes: CanvasNode[],
  parentNodeId: string,
  childPositionInParent: XYPosition,
  childSize: NodeSize,
  excludedSiblingIds: Set<string> = new Set(),
) => {
  const beforeNodes: CanvasNode[] = nodes.map((node) => ({
    ...node,
    position: { ...node.position },
    style: node.style ? { ...node.style } : undefined,
    data: { ...node.data },
  }));

  const afterNodes: CanvasNode[] = beforeNodes.map((node) => ({
    ...node,
    position: { ...node.position },
    style: node.style ? { ...node.style } : undefined,
    data: { ...node.data },
  }));

  const nodeMap = new Map(afterNodes.map((node) => [node.id, node]));
  const beforeMap = new Map(beforeNodes.map((node) => [node.id, node]));
  let parent = nodeMap.get(parentNodeId);
  if (!parent) {
    return {
      ok: false,
      reason: `Target parent ${parentNodeId} not found`,
    };
  }

  const changedAncestorIds = new Set<string>();
  let projectedChildPosition = childPositionInParent;
  let projectedChildSize = childSize;

  while (parent) {
    const parentSize = getNodeSize(parent);

    let shiftX = 0;
    let shiftY = 0;

    if (projectedChildPosition.x < CONTAINER_PADDING_X) {
      shiftX = projectedChildPosition.x - CONTAINER_PADDING_X;
    }
    if (projectedChildPosition.y < CONTAINER_HEADER_SPACE) {
      shiftY = projectedChildPosition.y - CONTAINER_HEADER_SPACE;
    }

    const requiredWidth =
      projectedChildPosition.x + projectedChildSize.width + CONTAINER_PADDING_X;
    const requiredHeight =
      projectedChildPosition.y + projectedChildSize.height + CONTAINER_PADDING_BOTTOM;

    const nextWidth = Math.max(parentSize.width - shiftX, requiredWidth - shiftX);
    const nextHeight = Math.max(parentSize.height - shiftY, requiredHeight - shiftY);

    if (nextWidth > MAX_CONTAINER_DIMENSION || nextHeight > MAX_CONTAINER_DIMENSION) {
      return {
        ok: false,
        reason: `Container expansion exceeds ${MAX_CONTAINER_DIMENSION}px limit`,
      };
    }

    if (shiftX !== 0 || shiftY !== 0 || nextWidth !== parentSize.width || nextHeight !== parentSize.height) {
      parent.style = {
        ...parent.style,
        width: nextWidth,
        height: nextHeight,
      };

      if (shiftX !== 0 || shiftY !== 0) {
        parent.position = {
          x: parent.position.x + shiftX,
          y: parent.position.y + shiftY,
        };

        afterNodes.forEach((n) => {
          if (n.parentNode === parent!.id) {
            n.position = {
              x: n.position.x - shiftX,
              y: n.position.y - shiftY,
            };
          }
        });
      }

      changedAncestorIds.add(parent.id);
    }

    projectedChildPosition = parent.position;
    projectedChildSize = {
      width: nextWidth,
      height: nextHeight,
    };

    if (!parent.parentNode) break;
    parent = nodeMap.get(parent.parentNode);
  }

  const intersects = (left: NodeRect, right: NodeRect, padding: number) => {
    const leftExpanded = {
      x: left.x - padding,
      y: left.y - padding,
      width: left.width + padding * 2,
      height: left.height + padding * 2,
    };

    return (
      leftExpanded.x < right.x + right.width &&
      leftExpanded.x + leftExpanded.width > right.x &&
      leftExpanded.y < right.y + right.height &&
      leftExpanded.y + leftExpanded.height > right.y
    );
  };

  const getRectById = (nodeId: string, map: Map<string, CanvasNode>): NodeRect | undefined => {
    const node = map.get(nodeId);
    if (!node) return undefined;
    return getAbsoluteNodeRect(node, map);
  };

  const afterMap = new Map(afterNodes.map((node) => [node.id, node]));

  for (const ancestorId of changedAncestorIds) {
    const ancestorBefore = beforeMap.get(ancestorId);
    const ancestorAfter = afterMap.get(ancestorId);
    if (!ancestorBefore || !ancestorAfter) continue;

    const beforeRect = getRectById(ancestorId, beforeMap);
    const afterRect = getRectById(ancestorId, afterMap);
    if (!beforeRect || !afterRect) continue;

    const siblingsAfter = afterNodes.filter(
      (candidate) =>
        candidate.parentNode === ancestorAfter.parentNode &&
        candidate.id !== ancestorAfter.id &&
        !excludedSiblingIds.has(candidate.id),
    );

    for (const siblingAfter of siblingsAfter) {
      const siblingBefore = beforeMap.get(siblingAfter.id);
      if (!siblingBefore) continue;

      const siblingBeforeRect = getRectById(siblingBefore.id, beforeMap);
      const siblingAfterRect = getRectById(siblingAfter.id, afterMap);
      if (!siblingBeforeRect || !siblingAfterRect) continue;

      const intersectsBefore = intersects(
        beforeRect,
        siblingBeforeRect,
        EXPANSION_SIBLING_PADDING,
      );
      const intersectsAfter = intersects(
        afterRect,
        siblingAfterRect,
        EXPANSION_SIBLING_PADDING,
      );

      if (intersectsAfter && !intersectsBefore) {
        return {
          ok: false,
          reason: `Expansion of '${ancestorAfter.data.label}' would overlap sibling '${siblingAfter.data.label}'`,
        };
      }
    }
  }

  return { ok: true as const };
};

const projectIntoContainer = (
  absolutePosition: XYPosition,
  container: CanvasNode,
  nodes: CanvasNode[],
) => {
  const nodeMap = new Map(nodes.map((node) => [node.id, node]));
  const containerAbsolute = getAbsolutePosition(container, nodeMap);
  return {
    x: Math.max(CONTAINER_PADDING_X, absolutePosition.x - containerAbsolute.x),
    y: Math.max(CONTAINER_HEADER_SPACE, absolutePosition.y - containerAbsolute.y),
  };
};

const getChildRectInParent = (child: CanvasNode): NodeRect => {
  const size = getNodeSize(child);
  return {
    x: child.position.x,
    y: child.position.y,
    width: size.width,
    height: size.height,
  };
};

const intersectsInParent = (left: NodeRect, right: NodeRect, padding: number) => {
  return (
    left.x < right.x + right.width + padding &&
    left.x + left.width + padding > right.x &&
    left.y < right.y + right.height + padding &&
    left.y + left.height + padding > right.y
  );
};

const resolveNonOverlappingPositionInContainer = (
  nodes: CanvasNode[],
  containerId: string,
  desiredLocalPosition: XYPosition,
  childSize: NodeSize,
  excludedNodeIds: Set<string> = new Set(),
) => {
  const siblings = nodes.filter(
    (candidate) =>
      candidate.parentNode === containerId &&
      !excludedNodeIds.has(candidate.id),
  );

  let candidate: XYPosition = {
    x: Math.max(CONTAINER_PADDING_X, desiredLocalPosition.x),
    y: Math.max(CONTAINER_HEADER_SPACE, desiredLocalPosition.y),
  };

  let attempts = 0;
  while (attempts < MAX_PLACEMENT_ATTEMPTS) {
    const candidateRect: NodeRect = {
      x: candidate.x,
      y: candidate.y,
      width: childSize.width,
      height: childSize.height,
    };

    const overlappingSibling = siblings.find((sibling) =>
      intersectsInParent(
        candidateRect,
        getChildRectInParent(sibling),
        CHILD_COLLISION_PADDING,
      ),
    );

    if (!overlappingSibling) {
      return candidate;
    }

    const overlapRect = getChildRectInParent(overlappingSibling);
    candidate = {
      x: Math.max(CONTAINER_PADDING_X, candidate.x),
      y: overlapRect.y + overlapRect.height + CONTAINER_PADDING_BOTTOM,
    };

    attempts += 1;
  }

  return candidate;
};

const findContainerById = (nodes: CanvasNode[], containerId: string) =>
  nodes.find((node) => node.id === containerId && node.data.isContainer);

export const getSchemaDefaultSize = (schemaId: string): NodeSize => {
  if (CONTAINER_SCHEMA_IDS.has(schemaId)) {
    return {
      width: DEFAULT_CONTAINER_SIZE.width,
      height: DEFAULT_CONTAINER_SIZE.height,
    };
  }

  return {
    width: DEFAULT_RESOURCE_NODE_SIZE.width,
    height: DEFAULT_RESOURCE_NODE_SIZE.height,
  };
};

export const calculateNodePlacement = (
  currentNodes: CanvasNode[],
  absolutePosition: XYPosition,
  nodeSize: NodeSize,
  excludedNodeIds: Set<string> = new Set(),
  pointerAbsolute?: XYPosition,
) => {
  const targetContainer = findBestContainerForNodeBounds(
    currentNodes,
    absolutePosition,
    nodeSize,
    excludedNodeIds,
    pointerAbsolute,
  );

  if (!targetContainer) {
    return {
      parentNode: undefined,
      position: absolutePosition,
      targetContainerId: undefined,
    };
  }

  const projectedPosition = projectIntoContainer(
    absolutePosition,
    targetContainer,
    currentNodes,
  );

  return {
    parentNode: targetContainer.id,
    position: projectedPosition,
    targetContainerId: targetContainer.id,
  };
};

export const placeCanvasNodeFromUserAction = (
  currentNodes: CanvasNode[],
  schema: TerraformNodeSchema,
  index: number,
  dropPosition?: XYPosition,
  forcedTargetContainerId?: string,
  resourceId?: string,
  resourceDisplayName?: string,
): CanvasNode[] => {
  const workingNodes: CanvasNode[] = currentNodes.map((node) => ({
    ...node,
    position: { ...node.position },
    style: node.style ? { ...node.style } : undefined,
    data: { ...node.data },
  }));

  const createdNode = createCanvasNodeFromUserAction(
    schema,
    index,
    dropPosition,
    resourceId,
    resourceDisplayName,
  );

  if (!dropPosition) {
    return [...workingNodes, createdNode];
  }

  const createdNodeSize = getNodeSize(createdNode);
  const explicitContainer = forcedTargetContainerId
    ? findContainerById(workingNodes, forcedTargetContainerId)
    : undefined;

  const placement = explicitContainer
    ? {
        parentNode: explicitContainer.id,
        position: resolveNonOverlappingPositionInContainer(
          workingNodes,
          explicitContainer.id,
          projectIntoContainer(
            dropPosition,
            explicitContainer,
            workingNodes,
          ),
          createdNodeSize,
        ),
        targetContainerId: explicitContainer.id,
      }
    : (() => {
        const dropPointer: XYPosition = {
          x: dropPosition.x + createdNodeSize.width / 2,
          y: dropPosition.y + createdNodeSize.height / 2,
        };
        return calculateNodePlacement(
          workingNodes,
          dropPosition,
          createdNodeSize,
          new Set(),
          dropPointer,
        );
      })();

  const finalPlacement = placement.parentNode
    ? {
        ...placement,
        position: resolveNonOverlappingPositionInContainer(
          workingNodes,
          placement.parentNode,
          placement.position,
          createdNodeSize,
        ),
      }
    : placement;

  if (finalPlacement.parentNode) {
    const expansionCheck = canExpandHierarchyForPlacement(
      workingNodes,
      finalPlacement.parentNode,
      finalPlacement.position,
      createdNodeSize,
    );

    if (!expansionCheck.ok) {
      warn(
        `Cannot place '${schema.label}' inside target container: ${expansionCheck.reason}`,
        "PLACEMENT_INFEASIBLE",
      );
      return [...workingNodes, createdNode];
    }
  }

  createdNode.parentNode = finalPlacement.parentNode;
  createdNode.extent = undefined;
  createdNode.position = finalPlacement.position;

  const nextNodes = [...workingNodes, createdNode];
  if (!finalPlacement.parentNode) return nextNodes;

  return expandAncestorContainers(nextNodes, createdNode.id);
};

export const reparentCanvasNodeAfterDrag = (
  currentNodes: CanvasNode[],
  draggedNodeId: string,
  forcedTargetContainerId?: string,
) => {
  const workingNodes: CanvasNode[] = currentNodes.map((node) => ({
    ...node,
    position: { ...node.position },
    style: node.style ? { ...node.style } : undefined,
    data: { ...node.data },
  }));

  const draggedNode = workingNodes.find((node) => node.id === draggedNodeId);
  if (!draggedNode) return workingNodes;
  const previousParentId = draggedNode.parentNode;

  const nodeMap = new Map(workingNodes.map((node) => [node.id, node]));
  const draggedAbsolute = getAbsolutePosition(draggedNode, nodeMap);
  const draggedSize =
    getSubtreeFootprintSize(workingNodes, draggedNode.id) ?? getNodeSize(draggedNode);

  const excludedNodeIds = getDescendantNodeIds(workingNodes, draggedNode.id);
  excludedNodeIds.add(draggedNode.id);

  const explicitContainer = forcedTargetContainerId
    ? findContainerById(workingNodes, forcedTargetContainerId)
    : undefined;

  const placement =
    explicitContainer && !excludedNodeIds.has(explicitContainer.id)
      ? {
          parentNode: explicitContainer.id,
          position: projectIntoContainer(
            draggedAbsolute,
            explicitContainer,
            workingNodes,
          ),
          targetContainerId: explicitContainer.id,
        }
      : calculateNodePlacement(
          workingNodes,
          draggedAbsolute,
          draggedSize,
          excludedNodeIds,
          {
            x: draggedAbsolute.x + draggedSize.width / 2,
            y: draggedAbsolute.y + draggedSize.height / 2,
          },
        );

  const finalPlacement = placement.parentNode
    ? {
        ...placement,
        position: resolveNonOverlappingPositionInContainer(
          workingNodes,
          placement.parentNode,
          placement.position,
          draggedSize,
          excludedNodeIds,
        ),
      }
    : placement;

  if (finalPlacement.parentNode) {
    const expansionCheck = canExpandHierarchyForPlacement(
      workingNodes,
      finalPlacement.parentNode,
      finalPlacement.position,
      draggedSize,
      excludedNodeIds,
    );

    if (!expansionCheck.ok) {
      warn(
        `Cannot nest '${draggedNode.data.label}' in target container: ${expansionCheck.reason}`,
        "REPARENT_INFEASIBLE",
      );
      draggedNode.parentNode = undefined;
      draggedNode.extent = undefined;
      draggedNode.position = draggedAbsolute;
      if (!previousParentId) return workingNodes;
      return shrinkAncestorContainers(workingNodes, previousParentId);
    }
  }

  if (!finalPlacement.parentNode) {
    draggedNode.parentNode = undefined;
    draggedNode.extent = undefined;
    draggedNode.position = finalPlacement.position;
    if (!previousParentId) return workingNodes;
    return shrinkAncestorContainers(workingNodes, previousParentId);
  }

  draggedNode.parentNode = finalPlacement.parentNode;
  draggedNode.extent = undefined;
  draggedNode.position = finalPlacement.position;
  const expandedNodes = expandAncestorContainers(workingNodes, draggedNode.id);

  if (!previousParentId || previousParentId === finalPlacement.parentNode) {
    return expandedNodes;
  }

  return shrinkAncestorContainers(expandedNodes, previousParentId);
};
