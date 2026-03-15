import { useCallback, useState } from "react";
import {
  Background,
  BackgroundVariant,
  Controls,
  MiniMap,
  ReactFlow,
  type ReactFlowInstance,
  type Edge,
  type Node,
  type OnConnect,
  type OnEdgesChange,
  type OnNodesChange,
  type XYPosition,
  type Connection,
} from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";
import { canvasNodeTypes } from "../canvas/nodeTypes";
import type { TerraformNodeSchema } from "../models/testNodes";
import { NODE_DRAG_MIME, parseDraggedNode } from "../commands/nodeDragPayload";
import "reactflow/dist/style.css";

type CenterPanelProps = {
  nodes: Node<CanvasTerraformNodeData>[];
  edges: Edge[];
  onNodesChange: OnNodesChange;
  onEdgesChange: OnEdgesChange;
  onConnect: OnConnect | ((connection: Connection) => void);
  onDropNode: (node: TerraformNodeSchema, position: XYPosition) => void;
};

export default function CenterPanel({
  nodes,
  edges,
  onNodesChange,
  onEdgesChange,
  onConnect,
  onDropNode,
}: CenterPanelProps) {
  const [reactFlowInstance, setReactFlowInstance] =
    useState<ReactFlowInstance<CanvasTerraformNodeData> | null>(null);

  const handleDragOver = useCallback((event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.dataTransfer.dropEffect = "copy";
  }, []);

  const handleDrop = useCallback(
    (event: React.DragEvent<HTMLDivElement>) => {
      event.preventDefault();
      if (!reactFlowInstance) return;

      const payload = event.dataTransfer.getData(NODE_DRAG_MIME);
      const draggedNode = parseDraggedNode(payload);
      if (!draggedNode) return;

      const flowPosition = reactFlowInstance.screenToFlowPosition({
        x: event.clientX,
        y: event.clientY,
      });

      onDropNode(draggedNode, flowPosition);
    },
    [onDropNode, reactFlowInstance],
  );

  return (
    <section className="flex h-full min-h-0 w-full flex-1 overflow-hidden bg-slate-100">
      <div className="h-full w-full min-h-0">
        <ReactFlow
          nodes={nodes}
          edges={edges}
          onNodesChange={onNodesChange}
          onEdgesChange={onEdgesChange}
          onConnect={onConnect}
          onDragOver={handleDragOver}
          onDrop={handleDrop}
          onInit={setReactFlowInstance}
          nodeTypes={canvasNodeTypes}
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
