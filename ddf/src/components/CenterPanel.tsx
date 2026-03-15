import { useCallback, useMemo, useRef, useState, type DragEvent } from "react";
import {
  Background,
  BackgroundVariant,
  Controls,
  MiniMap,
  ReactFlow,
  SelectionMode,
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
} from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";
import { canvasNodeTypes } from "../canvas/nodeTypes";
import type { TerraformNodeSchema } from "../models/testNodes";
import { NODE_DRAG_MIME, parseDraggedNode } from "../commands/nodeDragPayload";
import { clearActiveLeftPanelDrag, getActiveLeftPanelDrag } from "../commands/leftPanelDragState";
import {
  findContainerAtPoint,
  getDescendantNodeIds,
  getSchemaDefaultSize,
} from "../commands/placeCanvasNode";
import "reactflow/dist/style.css";

type CenterPanelProps = {
  nodes: Node<CanvasTerraformNodeData>[];
  edges: Edge[];
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
};

export default function CenterPanel({
  nodes,
  edges,
  onNodesChange,
  onEdgesChange,
  onConnect,
  onDropNode,
  onNodeDragFinalize,
  onNodeDragStart,
  onNodeDragStop,
  onNodeSelected,
}: CenterPanelProps) {
  const rootRef = useRef<HTMLDivElement | null>(null);
  const [reactFlowInstance, setReactFlowInstance] =
    useState<ReactFlowInstance<CanvasTerraformNodeData> | null>(null);
  const [activeDropContainerId, setActiveDropContainerId] = useState<string | null>(null);

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

  const nodesWithDropTarget = useMemo(
    () =>
      nodes.map((node) => {
        const shouldHighlight =
          !!activeDropContainerId &&
          node.id === activeDropContainerId &&
          node.data.isContainer;

        const dragHandle = node.data.isContainer
          ? ".container-drag-handle"
          : node.dragHandle;

        const depth = nodeDepthMap.get(node.id) ?? 0;
        const zIndexBase = depth * 100;
        const zIndex = zIndexBase + (node.data.isContainer ? 10 : 20);

        if (
          node.data.isDropTarget === shouldHighlight &&
          node.dragHandle === dragHandle &&
          node.zIndex === zIndex
        ) {
          return node;
        }

        return {
          ...node,
          dragHandle,
          zIndex,
          data: {
            ...node.data,
            isDropTarget: shouldHighlight,
          },
        };
      }),
    [activeDropContainerId, nodeDepthMap, nodes],
  );

  const applyPlacementIndicator = useCallback((targetContainerId?: string) => {
    setActiveDropContainerId((current) => {
      const next = targetContainerId ?? null;
      return current === next ? current : next;
    });
  }, []);

  const handleDragOver = useCallback((event: DragEvent<HTMLDivElement>) => {
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
  }, [nodes, reactFlowInstance]);

  const handleNodeDrag: NodeDragHandler = useCallback(
    (event, draggingNode, nodesToDrag) => {
      if (!reactFlowInstance) return;

      if (nodesToDrag.length > 1) {
        applyPlacementIndicator(undefined);
        return;
      }

      const currentNode = nodes.find((node) => node.id === draggingNode.id);
      if (!currentNode) return;

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
    [applyPlacementIndicator, nodes, reactFlowInstance],
  );

  const handleNodeDragStop: NodeDragHandler = useCallback(
    (event, node, nodeList) => {
      if (nodeList.length > 1) {
        setActiveDropContainerId(null);
        // Do not reparent if multiple nodes are dragged
        onNodeDragStop(event, node, nodeList);
        return;
      }

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
    [activeDropContainerId, nodes, onNodeDragFinalize, onNodeDragStop, reactFlowInstance],
  );

  const handleDragLeave = useCallback((event: DragEvent<HTMLDivElement>) => {
    if (!event.currentTarget.contains(event.relatedTarget as globalThis.Node | null)) {
      setActiveDropContainerId(null);
    }
  }, []);

  const handleDrop = useCallback(
    (event: DragEvent<HTMLDivElement>) => {
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
    [activeDropContainerId, onDropNode, reactFlowInstance],
  );

  const handleSelectionChange = useCallback(
    ({ nodes: selectedNodes }: OnSelectionChangeParams) => {
      onNodeSelected?.(selectedNodes.length === 1 ? selectedNodes[0]?.id : undefined);
    },
    [onNodeSelected],
  );

  return (
    <section className="flex h-full min-h-0 w-full flex-1 overflow-hidden bg-slate-100">
      <div
        ref={rootRef}
        className="relative h-full w-full min-h-0"
        onDragLeave={handleDragLeave}
      >
        <ReactFlow
          nodes={nodesWithDropTarget}
          edges={edges}
          onNodesChange={onNodesChange}
          onEdgesChange={onEdgesChange}
          onConnect={onConnect}
          onNodeDragStart={onNodeDragStart}
          onNodeDrag={handleNodeDrag}
          onNodeDragStop={handleNodeDragStop}
          onNodeClick={(_event, node) => onNodeSelected?.(node.id)}
          onSelectionChange={handleSelectionChange}
          onDragOver={handleDragOver}
          onDrop={handleDrop}
          onInit={setReactFlowInstance}
          nodeTypes={canvasNodeTypes}
          elevateNodesOnSelect={false}
          selectionOnDrag={true}
          panOnDrag={[1, 2]}
          selectionMode={SelectionMode.Partial}
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
            className="!bg-white !border !border-slate-300 !shadow-md"
          />

          <Controls position="top-right" showInteractive={false} />

          <Background
            id="primary-grid"
            gap={20}
            size={1}
            color="#94a3b8"
            variant={BackgroundVariant.Dots}
          />
        </ReactFlow>
      </div>
    </section>
  );
}
