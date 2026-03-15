import { useCallback } from "react";
import {
  Background,
  BackgroundVariant,
  Controls,
  MiniMap,
  ReactFlow,
  addEdge,
  useEdgesState,
  useNodesState,
  type Connection,
} from "reactflow";
import "reactflow/dist/style.css";

export default function CenterPanel() {
  const [nodes, , onNodesChange] = useNodesState([]);
  const [edges, setEdges, onEdgesChange] = useEdgesState([]);

  const onConnect = useCallback(
    (connection: Connection) => {
      setEdges((currentEdges) => addEdge(connection, currentEdges));
    },
    [setEdges],
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
