import { useEffect, useState } from "react";
import {
  BaseEdge,
  EdgeLabelRenderer,
  useReactFlow,
  useStore,
  type EdgeProps,
} from "reactflow";
import type { CanvasEdgeData } from "./types";

const parseAttributeFromExpression = (sourceExpression: string) => {
  const expression = sourceExpression.trim();
  if (!expression) return "";

  const parts = expression.split(".");
  return parts[parts.length - 1] ?? expression;
};

const unique = (values: string[]) => Array.from(new Set(values));

const buildEndpointLabel = (
  endpointNodeId: string,
  mappings: NonNullable<CanvasEdgeData["mappings"]>,
) => {
  const outgoing = unique(
    mappings
      .filter((mapping) => mapping.fromNodeId === endpointNodeId)
      .map((mapping) => parseAttributeFromExpression(mapping.sourceExpression))
      .filter(Boolean),
  );

  const incoming = unique(
    mappings
      .filter((mapping) => mapping.toNodeId === endpointNodeId)
      .map((mapping) => mapping.targetAttribute.trim())
      .filter(Boolean),
  );

  const chunks: string[] = [];
  if (outgoing.length) chunks.push(`out: ${outgoing.join(", ")}`);
  if (incoming.length) chunks.push(`in: ${incoming.join(", ")}`);

  return chunks.join(" · ");
};

const routeKey = (route: {
  fromNodeId: string;
  toNodeId: string;
  sourceExpression: string;
  targetAttribute: string;
}) =>
  [
    route.fromNodeId,
    route.toNodeId,
    route.sourceExpression.trim(),
    route.targetAttribute.trim(),
  ].join("|");

const parseOutAttribute = (sourceExpression: string) =>
  parseAttributeFromExpression(sourceExpression) || sourceExpression.trim();

export function MappingEdge({
  id,
  source,
  target,
  sourceX,
  sourceY,
  targetX,
  targetY,
  markerEnd,
  style,
  data,
}: EdgeProps<CanvasEdgeData>) {
  const edges = useStore((state) => state.edges);
  const zoom = useStore((state) => state.transform[2] || 1);
  const { setEdges } = useReactFlow();
  const [dragState, setDragState] = useState<{
    startClientX: number;
    startClientY: number;
    startOffsetX: number;
    startOffsetY: number;
    moved: boolean;
  } | null>(null);
  const [dragPreviewOffset, setDragPreviewOffset] = useState<{ x: number; y: number } | null>(null);
  const [collapsed, setCollapsed] = useState(true);
  const [skipNextToggle, setSkipNextToggle] = useState(false);

  const mappings = Array.isArray(data?.mappings) ? data.mappings : [];
  const uniqueMappings = Array.from(
    new Map(mappings.map((mapping) => [routeKey(mapping), mapping])).values(),
  );

  const fallbackSummary = buildEndpointLabel(source, mappings) || buildEndpointLabel(target, mappings);

  const siblingEdges = edges
    .filter(
      (edge) =>
        (edge.source === source && edge.target === target) ||
        (edge.source === target && edge.target === source),
    )
    .map((edge) => edge.id)
    .sort();

  const siblingIndex = Math.max(0, siblingEdges.indexOf(id));
  const siblingSpread = (siblingIndex - (siblingEdges.length - 1) / 2) * 22;

  const dx = targetX - sourceX;
  const dy = targetY - sourceY;
  const length = Math.hypot(dx, dy) || 1;
  const ux = dx / length;
  const uy = dy / length;
  const nx = -uy;
  const ny = ux;

  const baseMidX = (sourceX + targetX) / 2;
  const baseMidY = (sourceY + targetY) / 2;
  const tableX = baseMidX + nx * siblingSpread;
  const tableY = baseMidY + ny * siblingSpread;
  const persistedOffsetX = data?.labelOffset?.x ?? 0;
  const persistedOffsetY = data?.labelOffset?.y ?? 0;
  const effectiveOffsetX = dragPreviewOffset?.x ?? persistedOffsetX;
  const effectiveOffsetY = dragPreviewOffset?.y ?? persistedOffsetY;
  const desiredMidX = tableX + effectiveOffsetX;
  const desiredMidY = tableY + effectiveOffsetY;
  const controlX = 2 * desiredMidX - (sourceX + targetX) / 2;
  const controlY = 2 * desiredMidY - (sourceY + targetY) / 2;
  const edgePath = `M ${sourceX},${sourceY} Q ${controlX},${controlY} ${targetX},${targetY}`;

  useEffect(() => {
    if (!dragState) return;

    const handleMouseMove = (event: MouseEvent) => {
      const deltaX = event.clientX - dragState.startClientX;
      const deltaY = event.clientY - dragState.startClientY;
      const moved = Math.abs(deltaX) > 2 || Math.abs(deltaY) > 2;
      const flowDeltaX = deltaX / zoom;
      const flowDeltaY = deltaY / zoom;

      if (moved && !dragState.moved) {
        setDragState((current) => (current ? { ...current, moved: true } : current));
      }

      setDragPreviewOffset({
        x: dragState.startOffsetX + flowDeltaX,
        y: dragState.startOffsetY + flowDeltaY,
      });
    };

    const handleMouseUp = () => {
      const finalOffset = dragPreviewOffset ?? {
        x: dragState.startOffsetX,
        y: dragState.startOffsetY,
      };

      setEdges((currentEdges) =>
        currentEdges.map((edge) =>
          edge.id === id
            ? {
                ...edge,
                data: {
                  ...(edge.data ?? {}),
                  labelOffset: finalOffset,
                },
              }
            : edge,
        ),
      );

      if (dragState.moved) {
        setSkipNextToggle(true);
      }
      document.body.style.userSelect = "";
      document.body.style.cursor = "";
      setDragPreviewOffset(null);
      setDragState(null);
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
  }, [dragPreviewOffset, dragState, id, setEdges, zoom]);

  return (
    <>
      <BaseEdge id={id} path={edgePath} markerEnd={markerEnd} style={style} />
      {uniqueMappings.length || fallbackSummary ? (
        <EdgeLabelRenderer>
          <div
            className="pointer-events-auto absolute max-w-[320px] rounded-md border border-slate-300 bg-white/95 text-[10px] text-slate-700 shadow"
            style={{
              left: 0,
              top: 0,
              transform: `translate(-50%, -50%) translate(${desiredMidX}px, ${desiredMidY}px)`,
            }}
            onPointerDown={(event) => {
              event.stopPropagation();
              if (event.button !== 0) return;
              setDragState({
                startClientX: event.clientX,
                startClientY: event.clientY,
                startOffsetX: persistedOffsetX,
                startOffsetY: persistedOffsetY,
                moved: false,
              });
            }}
            onClick={(event) => event.stopPropagation()}
          >
            <button
              type="button"
              className="flex w-full items-center justify-between gap-2 px-2 py-1 text-left font-semibold text-slate-700"
              onClick={() => {
                if (skipNextToggle) {
                  setSkipNextToggle(false);
                  return;
                }
                setCollapsed((current) => !current);
              }}
            >
              <span>Connections ({uniqueMappings.length || 1})</span>
              <span className="text-[9px] font-medium text-slate-500">{collapsed ? "open" : "hide"}</span>
            </button>

            {!collapsed && uniqueMappings.length ? (
              <div className="max-h-40 overflow-auto border-t border-slate-200">
                <table className="w-full border-separate border-spacing-0 text-[10px]">
                  <thead className="bg-slate-50 text-slate-500">
                    <tr>
                      <th className="px-2 py-1 text-left font-medium">FROM NODE</th>
                      <th className="px-2 py-1 text-left font-medium">TO NODE</th>
                      <th className="px-2 py-1 text-left font-medium">SENDS</th>
                      <th className="px-2 py-1 text-left font-medium">SETS</th>
                    </tr>
                  </thead>
                  <tbody>
                    {uniqueMappings.map((mapping) => (
                      <tr key={routeKey(mapping)} className="odd:bg-white even:bg-slate-50/70">
                        <td className="px-2 py-1 text-slate-600">{mapping.fromNodeLabel ?? mapping.fromNodeId}</td>
                        <td className="px-2 py-1 text-slate-600">{mapping.toNodeLabel ?? mapping.toNodeId}</td>
                        <td className="px-2 py-1 font-medium text-slate-700">{parseOutAttribute(mapping.sourceExpression)}</td>
                        <td className="px-2 py-1 font-medium text-slate-700">{mapping.targetAttribute}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            ) : !collapsed ? (
              <div className="border-t border-slate-200 px-2 py-1 text-slate-500">
                {fallbackSummary || "No mappings"}
              </div>
            ) : null}
          </div>
        </EdgeLabelRenderer>
      ) : null}
    </>
  );
}
