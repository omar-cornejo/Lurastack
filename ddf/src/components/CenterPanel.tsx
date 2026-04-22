import { useCallback, useEffect, useMemo, useRef, useState, type DragEvent } from "react";
import {
  Background,
  BackgroundVariant,
  ControlButton,
  ConnectionMode,
  Controls,
  MiniMap,
  ReactFlow,
  type ReactFlowInstance,
  type Edge,
  type Node,
  type OnConnect,
  type OnEdgesChange,
  type OnNodesChange,
  type NodeDragHandler,
  type XYPosition,
  type Connection,
  type OnSelectionChangeParams,
  type EdgeMouseHandler,
} from "reactflow";
import type {
  CanvasEdgeData,
  CanvasEdgeMapping,
  CanvasTerraformNodeData,
} from "../canvas/types";
import { canvasNodeTypes } from "../canvas/nodeTypes";
import { canvasEdgeTypes } from "../canvas/edgeTypes";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { TerraformResource } from "../models/terraform";
import { NODE_DRAG_MIME, parseDraggedNode } from "../commands/nodeDragPayload";
import { clearActiveLeftPanelDrag, getActiveLeftPanelDrag } from "../commands/leftPanelDragState";
import {
  findContainerAtPoint,
  getDescendantNodeIds,
  getSchemaDefaultSize,
} from "../commands/placeCanvasNode";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";
import "reactflow/dist/style.css";

const MIDDLE_MOUSE_PAN_BUTTONS: number[] = [1];
const DEFAULT_EDGE_OPTIONS = {
  zIndex: 10000,
  interactionWidth: 32,
};
const STABLE_NODE_TYPES = canvasNodeTypes;
const STABLE_EDGE_TYPES = canvasEdgeTypes;

type CenterPanelProps = {
  autoFitKey?: string;
  readOnly?: boolean;
  leftOverlayOffset?: number;
  nodes: Node<CanvasTerraformNodeData>[];
  edges: Edge<CanvasEdgeData>[];
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  onNodesChange: OnNodesChange;
  onEdgesChange: OnEdgesChange;
  onConnect: OnConnect | ((connection: Connection) => void);
  onDropNode: (
    node: TerraformNodeSchema,
    position: XYPosition,
    options?: { targetContainerId?: string },
  ) => void;
  onNodeDragFinalize?: (draggedNodeId: string, targetContainerId?: string) => void;
  onNodeDragStart: NodeDragHandler;
  onNodeDragStop: NodeDragHandler;
  onNodeSelected?: (nodeId?: string) => void;
  onDeleteEdge?: (edgeId: string) => void;
  onApplyEdgeMapping?: (payload: {
    edgeId: string;
    fromNodeId: string;
    toNodeId: string;
    sourceExpression: string;
    targetAttribute: string;
  }) => void;
  onViewportBoundsChange?: (bounds: {
    minX: number;
    maxX: number;
    minY: number;
    maxY: number;
  }) => void;
  rightOverlayOffset?: number;
  isRightOverlayResizing?: boolean;
};

export default function CenterPanel({
  autoFitKey = "default",
  readOnly = false,
  leftOverlayOffset = 0,
  nodes,
  edges,
  resources,
  schemas,
  onNodesChange,
  onEdgesChange,
  onConnect,
  onDropNode,
  onNodeDragFinalize,
  onNodeDragStart,
  onNodeDragStop,
  onNodeSelected,
  onDeleteEdge,
  onApplyEdgeMapping,
  onViewportBoundsChange,
  rightOverlayOffset = 0,
  isRightOverlayResizing = false,
}: CenterPanelProps) {
  const rootRef = useRef<HTMLDivElement | null>(null);
  const hasAutoFittedRef = useRef(false);
  const [reactFlowInstance, setReactFlowInstance] =
    useState<ReactFlowInstance<CanvasTerraformNodeData> | null>(null);
  const [isCanvasReady, setIsCanvasReady] = useState(false);
  const [activeDropContainerId, setActiveDropContainerId] = useState<string | null>(null);
  const [edgeMapper, setEdgeMapper] = useState<{
    edgeId: string;
    x: number;
    y: number;
    endpointA: string;
    endpointB: string;
    fromNodeId: string;
    toNodeId: string;
    sourceExpression: string;
    targetAttribute: string;
  } | null>(null);
  const [edgeMapperDrag, setEdgeMapperDrag] = useState<{
    offsetX: number;
    offsetY: number;
  } | null>(null);
  const [edgeContextMenu, setEdgeContextMenu] = useState<{
    edgeId: string;
    x: number;
    y: number;
  } | null>(null);
  const [activeLayer, setActiveLayer] = useState(0);

  const getEdgeMappings = useCallback(
    (edge: Edge<CanvasEdgeData>): CanvasEdgeMapping[] =>
      Array.isArray(edge.data?.mappings) ? edge.data.mappings : [],
    [],
  );

  const nodeDepthMap = useMemo(() => {
    const byId = new Map(nodes.map((node) => [node.id, node]));
    const cache = new Map<string, number>();

    const computeDepth = (nodeId: string) => {
      if (cache.has(nodeId)) return cache.get(nodeId)!;

      let depth = 0;
      let current = byId.get(nodeId);
      const visited = new Set<string>();

      while (current?.parentNode) {
        if (visited.has(current.parentNode)) break;
        visited.add(current.parentNode);
        depth += 1;
        current = byId.get(current.parentNode);
      }

      cache.set(nodeId, depth);
      return depth;
    };

    nodes.forEach((node) => {
      computeDepth(node.id);
    });

    return cache;
  }, [nodes]);

  const maxLayer = useMemo(() => {
    let maxDepth = 0;

    for (const depth of nodeDepthMap.values()) {
      if (depth > maxDepth) {
        maxDepth = depth;
      }
    }

    return maxDepth;
  }, [nodeDepthMap]);

  const nodesWithDropTarget = useMemo(
    () =>
      nodes.map((node) => {
        const shouldHighlight =
          !!activeDropContainerId &&
          node.id === activeDropContainerId &&
          node.data.isContainer;

        const isZoneContainer =
          node.data.containerKind === "zone" ||
          node.data.schemaId === "aws_availability_zone" ||
          node.data.schemaId === "aws_security_group";

        const dragHandle = node.data.isContainer
          ? ".container-drag-handle"
          : node.dragHandle;

        const depth = nodeDepthMap.get(node.id) ?? 0;
        const zIndexBase = depth * 100;
        const zIndex = isZoneContainer
          ? zIndexBase + 2000
          : zIndexBase + (node.data.isContainer ? 10 : 20);

        if (
          node.data.isDropTarget === shouldHighlight &&
          node.dragHandle === dragHandle &&
          node.zIndex === zIndex &&
          node.style?.pointerEvents === (isZoneContainer ? "none" : "auto")
        ) {
          return node;
        }

        return {
          ...node,
          dragHandle,
          zIndex,
          style: {
            ...(node.style ?? {}),
            pointerEvents: (isZoneContainer ? "none" : "auto") as "none" | "auto",
          },
          data: {
            ...node.data,
            isDropTarget: shouldHighlight,
          },
        };
      }),
    [activeDropContainerId, nodeDepthMap, nodes],
  );

  const nodeById = useMemo(
    () => new Map(nodesWithDropTarget.map((node) => [node.id, node])),
    [nodesWithDropTarget],
  );
  const resourceById = useMemo(
    () => new Map(resources.map((resource) => [resource.id, resource])),
    [resources],
  );
  const schemaById = useMemo(
    () => new Map(schemas.map((schema) => [schema.id, schema])),
    [schemas],
  );

  const visibleLayerNodeIds = useMemo(() => {
    if (activeLayer === 0) {
      return new Set(nodesWithDropTarget.map((node) => node.id));
    }

    return new Set(
      nodesWithDropTarget
        .filter((node) => (nodeDepthMap.get(node.id) ?? 0) === activeLayer)
        .map((node) => node.id),
    );
  }, [activeLayer, nodeDepthMap, nodesWithDropTarget]);

  const ghostContainerNodeIds = useMemo(() => {
    if (activeLayer === 0) {
      return new Set<string>();
    }

    const ghostIds = new Set<string>();

    for (const visibleId of visibleLayerNodeIds) {
      let current = nodeById.get(visibleId);

      while (current?.parentNode) {
        const parentNode = nodeById.get(current.parentNode);
        if (!parentNode) break;

        if (parentNode.data.isContainer) {
          ghostIds.add(parentNode.id);
        }

        current = parentNode;
      }
    }

    return ghostIds;
  }, [activeLayer, nodeById, visibleLayerNodeIds]);

  const layerScopedNodes = useMemo(
    () =>
      nodesWithDropTarget.map((node) => {
        const isVisibleInLayer = visibleLayerNodeIds.has(node.id);
        const isGhostContainer = ghostContainerNodeIds.has(node.id);

        if (isVisibleInLayer) {
          if (
            !node.hidden &&
            node.selectable !== false &&
            node.draggable !== false &&
            !node.data.isLayerGhost
          ) {
            return node;
          }

          return {
            ...node,
            hidden: false,
            selectable: true,
            draggable: !readOnly,
            data: {
              ...node.data,
              isLayerGhost: false,
            },
          };
        }

        if (isGhostContainer) {
          if (
            !node.hidden &&
            node.selectable === false &&
            node.draggable === false &&
            !!node.data.isLayerGhost
          ) {
            return node;
          }

          return {
            ...node,
            hidden: false,
            selectable: false,
            draggable: false,
            data: {
              ...node.data,
              isLayerGhost: true,
            },
          };
        }

        if (
          node.hidden &&
          node.selectable === false &&
          node.draggable === false &&
          !node.data.isLayerGhost
        ) {
          return node;
        }

        return {
          ...node,
          hidden: true,
          selectable: false,
          draggable: false,
          data: {
            ...node.data,
            isLayerGhost: false,
          },
        };
      }),
    [ghostContainerNodeIds, nodesWithDropTarget, readOnly, visibleLayerNodeIds],
  );

  const layerScopedEdges = useMemo(() => {
    if (activeLayer === 0) {
      return edges;
    }

    return edges.filter(
      (edge) =>
        !!edge.source &&
        !!edge.target &&
        visibleLayerNodeIds.has(edge.source) &&
        visibleLayerNodeIds.has(edge.target),
    );
  }, [activeLayer, edges, visibleLayerNodeIds]);

  useEffect(() => {
    setActiveLayer((current) => (current > maxLayer ? 0 : current));
  }, [maxLayer]);

  const reportViewportBounds = useCallback(() => {
    if (!reactFlowInstance || !rootRef.current || !onViewportBoundsChange) return;

    const rect = rootRef.current.getBoundingClientRect();
    const leftInset = Math.max(0, leftOverlayOffset);
    const rightInset = Math.max(0, rightOverlayOffset);
    const viewportWidth = Math.max(1, rect.width - leftInset - rightInset);

    const topLeft = reactFlowInstance.screenToFlowPosition({
      x: rect.left + leftInset,
      y: rect.top,
    });
    const bottomRight = reactFlowInstance.screenToFlowPosition({
      x: rect.left + leftInset + viewportWidth,
      y: rect.bottom,
    });

    onViewportBoundsChange({
      minX: Math.min(topLeft.x, bottomRight.x),
      maxX: Math.max(topLeft.x, bottomRight.x),
      minY: Math.min(topLeft.y, bottomRight.y),
      maxY: Math.max(topLeft.y, bottomRight.y),
    });
  }, [leftOverlayOffset, onViewportBoundsChange, reactFlowInstance, rightOverlayOffset]);

  useEffect(() => {
    hasAutoFittedRef.current = false;
    setIsCanvasReady(false);
  }, [autoFitKey]);

  useEffect(() => {
    if (!reactFlowInstance || hasAutoFittedRef.current) return;

    const frame = window.requestAnimationFrame(() => {
      reactFlowInstance.fitView({
        includeHiddenNodes: false,
        padding: 0.2,
        duration: 0,
      });
      hasAutoFittedRef.current = true;
      setIsCanvasReady(true);
      reportViewportBounds();
    });

    return () => window.cancelAnimationFrame(frame);
  }, [reactFlowInstance, autoFitKey, layerScopedNodes, layerScopedEdges, reportViewportBounds]);

  useEffect(() => {
    if (!reactFlowInstance) return;

    reportViewportBounds();

    const handleResize = () => reportViewportBounds();
    window.addEventListener("resize", handleResize);

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, [leftOverlayOffset, reactFlowInstance, reportViewportBounds, rightOverlayOffset]);

  const applyPlacementIndicator = useCallback((targetContainerId?: string) => {
    setActiveDropContainerId((current) => {
      const next = targetContainerId ?? null;
      return current === next ? current : next;
    });
  }, []);

  const handleDragOver = useCallback((event: DragEvent<HTMLDivElement>) => {
    if (readOnly) return;
    event.preventDefault();
    event.dataTransfer.dropEffect = "copy";

    if (!reactFlowInstance) return;

    const draggedNode = getActiveLeftPanelDrag();
    if (!draggedNode) {
      setActiveDropContainerId(null);
      return;
    }

    const flowPosition = reactFlowInstance.screenToFlowPosition({
      x: event.clientX,
      y: event.clientY,
    });

    const pointerTarget = findContainerAtPoint(nodes, flowPosition);
    applyPlacementIndicator(pointerTarget?.id);
  }, [nodes, reactFlowInstance, readOnly]);

  const handleNodeDrag: NodeDragHandler = useCallback(
    (event, draggingNode) => {
      if (readOnly) return;
      if (!reactFlowInstance) return;

      if (!nodeById.has(draggingNode.id)) return;

      const nextNodes = nodes.map((node) =>
        node.id === draggingNode.id
          ? {
              ...node,
              position: { ...draggingNode.position },
              parentNode: draggingNode.parentNode,
            }
          : node,
      );

      const excluded = getDescendantNodeIds(nextNodes, draggingNode.id);
      excluded.add(draggingNode.id);

      const pointerFlowPosition =
        "clientX" in event && "clientY" in event
          ? reactFlowInstance.screenToFlowPosition({
              x: event.clientX,
              y: event.clientY,
            })
          : undefined;

      if (!pointerFlowPosition) {
        applyPlacementIndicator(undefined);
        return;
      }

      const pointerTarget = findContainerAtPoint(
        nextNodes,
        pointerFlowPosition,
        excluded,
      );

      applyPlacementIndicator(pointerTarget?.id);
    },
    [applyPlacementIndicator, nodeById, nodes, reactFlowInstance, readOnly],
  );

  const handleNodeDragStop: NodeDragHandler = useCallback(
    (event, node, nodeList) => {
      if (readOnly) return;
      let finalTargetId = activeDropContainerId ?? undefined;

      if (
        reactFlowInstance &&
        "clientX" in event &&
        "clientY" in event
      ) {
        const flowPosition = reactFlowInstance.screenToFlowPosition({
          x: event.clientX,
          y: event.clientY,
        });

        const previewNodes = nodes.map((candidate) =>
          candidate.id === node.id
            ? {
                ...candidate,
                position: { ...node.position },
                parentNode: node.parentNode,
              }
            : candidate,
        );

        const excluded = getDescendantNodeIds(previewNodes, node.id);
        excluded.add(node.id);

        const pointerTarget = findContainerAtPoint(
          previewNodes,
          flowPosition,
          excluded,
        );

        finalTargetId = pointerTarget?.id;
      }

      setActiveDropContainerId(null);
      onNodeDragFinalize?.(node.id, finalTargetId);
      onNodeDragStop(event, node, nodeList);
    },
    [activeDropContainerId, nodes, onNodeDragFinalize, onNodeDragStop, reactFlowInstance, readOnly],
  );

  const handleDragLeave = useCallback((event: DragEvent<HTMLDivElement>) => {
    if (!event.currentTarget.contains(event.relatedTarget as globalThis.Node | null)) {
      setActiveDropContainerId(null);
    }
  }, []);

  const handleDrop = useCallback(
    (event: DragEvent<HTMLDivElement>) => {
      if (readOnly) return;
      event.preventDefault();
      const dropTargetContainerId = activeDropContainerId ?? undefined;
      setActiveDropContainerId(null);
      if (!reactFlowInstance) return;

      const draggedNode =
        getActiveLeftPanelDrag() ??
        parseDraggedNode(event.dataTransfer.getData(NODE_DRAG_MIME));
      if (!draggedNode) return;

      const flowPosition = reactFlowInstance.screenToFlowPosition({
        x: event.clientX,
        y: event.clientY,
      });

      const draggedNodeSize = getSchemaDefaultSize(draggedNode.id);
      const newNodeTopLeft = {
        x: flowPosition.x - draggedNodeSize.width / 2,
        y: flowPosition.y - draggedNodeSize.height / 2,
      };

      onDropNode(draggedNode, newNodeTopLeft, {
        targetContainerId: dropTargetContainerId,
      });
      clearActiveLeftPanelDrag();
    },
    [activeDropContainerId, onDropNode, reactFlowInstance, readOnly],
  );

  const handleSelectionChange = useCallback(
    ({ nodes: selectedNodes }: OnSelectionChangeParams) => {
      if (selectedNodes.length === 1) {
        onNodeSelected?.(selectedNodes[0]?.id);
        return;
      }

      if (selectedNodes.length === 0) {
        onNodeSelected?.(undefined);
      }
    },
    [onNodeSelected],
  );

  const getNodeResourceContext = useCallback((nodeId: string) => {
    const node = nodeById.get(nodeId);
    if (!node) return undefined;

    const resource = resourceById.get(node.data.resourceId);
    if (!resource) return undefined;

    const schema = schemaById.get(node.data.schemaId);
    if (!schema) return undefined;

    const attributes = getInspectorPropertiesForSchema(schema);

    return {
      node,
      resource,
      schema,
      attributes,
    };
  }, [nodeById, resourceById, schemaById]);

  const buildTerraformRef = useCallback((nodeId: string, attributeName: string) => {
    const context = getNodeResourceContext(nodeId);
    if (!context) return "";

    const prefix = context.resource.kind === "data" ? "data." : "";
    return `${prefix}${context.schema.terraformType}.${context.resource.name}.${attributeName}`;
  }, [getNodeResourceContext]);

  const openEdgeMapper = useCallback((edge: Edge<CanvasEdgeData>, x: number, y: number) => {
    if (!edge.source || !edge.target) return;
    const sourceContext = getNodeResourceContext(edge.source);
    const targetContext = getNodeResourceContext(edge.target);
    if (!sourceContext || !targetContext) return;

      const preferredTarget =
        targetContext.attributes.find((attr) => attr.name.endsWith("_id"))?.name ??
        targetContext.attributes.find((attr) => !attr.computed || attr.optional)?.name ??
        targetContext.attributes[0]?.name ??
        "";

      const sourceAttr =
        sourceContext.attributes.find((attr) => attr.name === "id")?.name ??
        sourceContext.attributes[0]?.name ??
        "id";

      const existingMappings = getEdgeMappings(edge);

      const existingMapping = existingMappings[0];
      const defaultFrom = existingMapping?.fromNodeId ?? edge.source;
      const defaultTo = existingMapping?.toNodeId ?? edge.target;

      const rootRect = rootRef.current?.getBoundingClientRect();
      const popupWidth = 420;
      const popupHeight = 260;
      const offset = 8;

      const relativeX = x;
      const relativeY = y;

      const maxX = rootRect ? Math.max(8, rootRect.width - popupWidth - 8) : relativeX;
      const maxY = rootRect ? Math.max(8, rootRect.height - popupHeight - 8) : relativeY;

      const clampedX = Math.min(Math.max(8, relativeX + offset), maxX);
      const clampedY = Math.min(Math.max(8, relativeY + offset), maxY);

    setEdgeMapper({
      edgeId: edge.id,
      x: clampedX,
      y: clampedY,
      endpointA: edge.source,
      endpointB: edge.target,
      fromNodeId: defaultFrom,
      toNodeId: defaultTo,
      sourceExpression:
        existingMapping?.sourceExpression ??
        buildTerraformRef(defaultFrom, sourceAttr),
      targetAttribute: existingMapping?.targetAttribute ?? preferredTarget,
    });
  }, [buildTerraformRef, getEdgeMappings, getNodeResourceContext]);

  const handleEdgeContextMenu: EdgeMouseHandler = useCallback(
    (event, edge) => {
      if (readOnly) return;
      event.preventDefault();
      event.stopPropagation();

      const rootRect = rootRef.current?.getBoundingClientRect();
      const menuWidth = 190;
      const menuHeight = 90;
      const relativeX = rootRect ? event.clientX - rootRect.left : event.clientX;
      const relativeY = rootRect ? event.clientY - rootRect.top : event.clientY;
      const maxX = rootRect ? Math.max(8, rootRect.width - menuWidth - 8) : relativeX;
      const maxY = rootRect ? Math.max(8, rootRect.height - menuHeight - 8) : relativeY;

      setEdgeContextMenu({
        edgeId: edge.id,
        x: Math.min(Math.max(8, relativeX + 6), maxX),
        y: Math.min(Math.max(8, relativeY + 6), maxY),
      });
      setEdgeMapper(null);
    },
    [readOnly],
  );

  useEffect(() => {
    if (!edgeMapperDrag || !edgeMapper) return;

    const handleMouseMove = (event: MouseEvent) => {
      const rootRect = rootRef.current?.getBoundingClientRect();
      if (!rootRect) return;

      const popupWidth = 420;
      const popupHeight = 320;
      const nextX = event.clientX - rootRect.left - edgeMapperDrag.offsetX;
      const nextY = event.clientY - rootRect.top - edgeMapperDrag.offsetY;

      const clampedX = Math.min(
        Math.max(8, nextX),
        Math.max(8, rootRect.width - popupWidth - 8),
      );
      const clampedY = Math.min(
        Math.max(8, nextY),
        Math.max(8, rootRect.height - popupHeight - 8),
      );

      setEdgeMapper((current) =>
        current
          ? {
              ...current,
              x: clampedX,
              y: clampedY,
            }
          : current,
      );
    };

    const handleMouseUp = () => {
      document.body.style.userSelect = "";
      document.body.style.cursor = "";
      setEdgeMapperDrag(null);
    };

    document.body.style.userSelect = "none";
    document.body.style.cursor = "move";
    window.addEventListener("mousemove", handleMouseMove);
    window.addEventListener("mouseup", handleMouseUp);

    return () => {
      document.body.style.userSelect = "";
      document.body.style.cursor = "";
      window.removeEventListener("mousemove", handleMouseMove);
      window.removeEventListener("mouseup", handleMouseUp);
    };
  }, [edgeMapper, edgeMapperDrag]);

  return (
    <section className="flex h-full min-h-0 w-full flex-1 overflow-hidden bg-slate-100">
      <div
        ref={rootRef}
        className="relative h-full w-full min-h-0"
        style={{ visibility: isCanvasReady ? "visible" : "hidden" }}
        onDragLeave={handleDragLeave}
      >
        <ReactFlow
          nodes={layerScopedNodes}
          edges={layerScopedEdges}
          onNodesChange={readOnly ? undefined : onNodesChange}
          onEdgesChange={readOnly ? undefined : onEdgesChange}
          onConnect={readOnly ? undefined : onConnect}
          onNodeDragStart={readOnly ? undefined : onNodeDragStart}
          onNodeDrag={readOnly ? undefined : handleNodeDrag}
          onNodeDragStop={readOnly ? undefined : handleNodeDragStop}
          onNodeClick={(_event, node) => onNodeSelected?.(node.id)}
          onPaneClick={() => {
            setEdgeMapper(null);
            setEdgeContextMenu(null);
          }}
          onSelectionChange={handleSelectionChange}
          onEdgeContextMenu={readOnly ? undefined : handleEdgeContextMenu}
          onDragOver={readOnly ? undefined : handleDragOver}
          onDrop={readOnly ? undefined : handleDrop}
          onInit={setReactFlowInstance}
          onMoveEnd={reportViewportBounds}
          nodeTypes={STABLE_NODE_TYPES}
          edgeTypes={STABLE_EDGE_TYPES}
          defaultEdgeOptions={DEFAULT_EDGE_OPTIONS}
          connectionMode={ConnectionMode.Loose}
          elevateNodesOnSelect={false}
          panOnDrag={MIDDLE_MOUSE_PAN_BUTTONS}
          selectionOnDrag={activeLayer === 0}
          nodesConnectable={!readOnly}
          nodesDraggable={!readOnly}
          elementsSelectable
          selectionKeyCode="Shift"
          multiSelectionKeyCode="Shift"
          onlyRenderVisibleElements
          proOptions={{ hideAttribution: true }}
          fitView
          minZoom={0.2}
          maxZoom={2}
          defaultViewport={{ x: 0, y: 0, zoom: 1 }}
          attributionPosition="bottom-left"
          className="bg-slate-100"
        >
          <MiniMap
            pannable
            zoomable
            position="bottom-right"
            style={{
              right: `${Math.max(8, rightOverlayOffset + 8)}px`,
              bottom: 8,
              transition: isRightOverlayResizing ? "none" : "right 200ms ease",
            }}
            className="!bg-white !border !border-slate-300 !shadow-md"
          />

          <Controls
            position="top-right"
            showInteractive={false}
            style={{
              right: `${Math.max(8, rightOverlayOffset + 8)}px`,
              top: 8,
              transition: isRightOverlayResizing ? "none" : "right 200ms ease",
            }}
          >
            <ControlButton
              onClick={() =>
                setActiveLayer((current) => (current >= maxLayer ? 0 : current + 1))
              }
              title={`Layer ${activeLayer}`}
              aria-label="Cambiar capa visible"
            >
              {activeLayer}
            </ControlButton>
          </Controls>

          <Background
            id="primary-grid"
            gap={20}
            size={1}
            color="#94a3b8"
            variant={BackgroundVariant.Dots}
          />
        </ReactFlow>

        {edgeContextMenu ? (
          <div
            className="absolute z-40 w-[190px] rounded-xl border border-slate-300 bg-white/95 p-1 shadow-xl backdrop-blur"
            style={{ left: edgeContextMenu.x, top: edgeContextMenu.y }}
            onClick={(event) => event.stopPropagation()}
          >
            <button
              type="button"
              className="w-full rounded-lg px-3 py-2 text-left text-xs font-medium text-slate-700 hover:bg-slate-100"
              onClick={() => {
                const edge = edges.find((candidate) => candidate.id === edgeContextMenu.edgeId);
                if (edge) {
                  openEdgeMapper(edge, edgeContextMenu.x, edgeContextMenu.y);
                }
                setEdgeContextMenu(null);
              }}
            >
              Open edge mapping
            </button>
            <button
              type="button"
              className="w-full rounded-lg px-3 py-2 text-left text-xs font-medium text-red-600 hover:bg-red-50"
              onClick={() => {
                onDeleteEdge?.(edgeContextMenu.edgeId);
                setEdgeContextMenu(null);
              }}
            >
              Delete edge
            </button>
          </div>
        ) : null}

        {edgeMapper ? (
          <div
            className="absolute z-30 w-[420px] max-w-[95vw] rounded-2xl border border-slate-300 bg-white p-3 shadow-2xl"
            style={{
              left: edgeMapper.x,
              top: edgeMapper.y,
            }}
            onClick={(event) => event.stopPropagation()}
          >
            <div
              className="mb-3 flex items-center justify-between border-b border-slate-200 pb-2 cursor-move"
              onMouseDown={(event) => {
                const popupRect = (event.currentTarget.parentElement as HTMLDivElement | null)
                  ?.getBoundingClientRect();
                if (!popupRect) return;

                setEdgeMapperDrag({
                  offsetX: event.clientX - popupRect.left,
                  offsetY: event.clientY - popupRect.top,
                });
              }}
            >
              <h4 className="text-sm font-semibold text-slate-800">Edge Mapping</h4>
              <button
                type="button"
                className="rounded-md px-2 py-1 text-xs text-slate-500 hover:bg-slate-100 hover:text-slate-700"
                onClick={() => setEdgeMapper(null)}
              >
                Close
              </button>
            </div>

            <div className="grid grid-cols-2 gap-3 text-xs">
              <label className="space-y-1">
                <span className="text-slate-600 font-medium">From node</span>
                <select
                  value={edgeMapper.fromNodeId}
                  onChange={(event) => {
                    const nextFrom = event.target.value;
                    const nextTo =
                      nextFrom === edgeMapper.toNodeId
                        ? edgeMapper.fromNodeId
                        : edgeMapper.toNodeId;
                    const sourceContext = getNodeResourceContext(nextFrom);
                    const sourceAttr =
                      sourceContext?.attributes.find((attr) => attr.name === "id")?.name ??
                      sourceContext?.attributes[0]?.name ??
                      "id";

                    setEdgeMapper((current) =>
                      current
                        ? {
                            ...current,
                            fromNodeId: nextFrom,
                            toNodeId: nextTo,
                            sourceExpression: buildTerraformRef(nextFrom, sourceAttr),
                          }
                        : current,
                    );
                  }}
                  className="w-full rounded-lg border border-slate-300 bg-slate-50 px-2 py-1.5 text-slate-700 outline-none focus:border-blue-400 focus:bg-white"
                >
                  {[edgeMapper.endpointA, edgeMapper.endpointB].map((endpointId) => {
                    const endpointNode = nodeById.get(endpointId);
                    return (
                      <option key={endpointId} value={endpointId}>
                        {endpointNode?.data.label ?? endpointId}
                      </option>
                    );
                  })}
                </select>
              </label>

              <label className="space-y-1">
                <span className="text-slate-600 font-medium">To node</span>
                <select
                  value={edgeMapper.toNodeId}
                  onChange={(event) => {
                    const nextTo = event.target.value;
                    const nextFrom =
                      nextTo === edgeMapper.fromNodeId
                        ? edgeMapper.toNodeId
                        : edgeMapper.fromNodeId;
                    setEdgeMapper((current) =>
                      current
                        ? {
                            ...current,
                            fromNodeId: nextFrom,
                            toNodeId: nextTo,
                          }
                        : current,
                    );
                  }}
                  className="w-full rounded-lg border border-slate-300 bg-slate-50 px-2 py-1.5 text-slate-700 outline-none focus:border-blue-400 focus:bg-white"
                >
                  {[edgeMapper.endpointA, edgeMapper.endpointB].map((endpointId) => {
                    const endpointNode = nodeById.get(endpointId);
                    return (
                      <option key={endpointId} value={endpointId}>
                        {endpointNode?.data.label ?? endpointId}
                      </option>
                    );
                  })}
                </select>
              </label>
            </div>

            <div className="mt-3 grid grid-cols-2 gap-3 text-xs">
              <label className="space-y-1">
                <span className="text-slate-600 font-medium">Source attribute</span>
                <select
                  value={(() => {
                    const sourceContext = getNodeResourceContext(edgeMapper.fromNodeId);
                    const matched = sourceContext?.attributes.find((attr) =>
                      edgeMapper.sourceExpression.endsWith(`.${attr.name}`),
                    );
                    return matched?.name ?? "";
                  })()}
                  onChange={(event) => {
                    const attr = event.target.value;
                    setEdgeMapper((current) =>
                      current
                        ? {
                            ...current,
                            sourceExpression: buildTerraformRef(current.fromNodeId, attr),
                          }
                        : current,
                    );
                  }}
                  className="w-full rounded-lg border border-slate-300 bg-slate-50 px-2 py-1.5 text-slate-700 outline-none focus:border-blue-400 focus:bg-white"
                >
                  {(getNodeResourceContext(edgeMapper.fromNodeId)?.attributes ?? []).map((attr) => (
                    <option key={attr.name} value={attr.name}>
                      {attr.name}
                    </option>
                  ))}
                </select>
              </label>

              <label className="space-y-1">
                <span className="text-slate-600 font-medium">Target attribute</span>
                <select
                  value={edgeMapper.targetAttribute}
                  onChange={(event) =>
                    setEdgeMapper((current) =>
                      current
                        ? {
                            ...current,
                            targetAttribute: event.target.value,
                          }
                        : current,
                    )
                  }
                  className="w-full rounded-lg border border-slate-300 bg-slate-50 px-2 py-1.5 text-slate-700 outline-none focus:border-blue-400 focus:bg-white"
                >
                  {(getNodeResourceContext(edgeMapper.toNodeId)?.attributes ?? [])
                    .filter((attr) => !attr.computed || attr.optional)
                    .map((attr) => (
                      <option key={attr.name} value={attr.name}>
                        {attr.name}
                      </option>
                    ))}
                </select>
              </label>
            </div>

            <div className="mt-4 flex justify-end gap-2">
              <button
                type="button"
                className="rounded-lg border border-slate-300 px-3 py-1.5 text-xs text-slate-700 hover:bg-slate-100"
                onClick={() => setEdgeMapper(null)}
              >
                Cancel
              </button>
              <button
                type="button"
                className="rounded-lg bg-blue-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-blue-700"
                onClick={() => {
                  onApplyEdgeMapping?.({
                    edgeId: edgeMapper.edgeId,
                    fromNodeId: edgeMapper.fromNodeId,
                    toNodeId: edgeMapper.toNodeId,
                    sourceExpression: edgeMapper.sourceExpression,
                    targetAttribute: edgeMapper.targetAttribute,
                  });
                  setEdgeMapper(null);
                }}
              >
                Apply mapping
              </button>
            </div>
          </div>
        ) : null}
      </div>
    </section>
  );
}
