import { useEffect, useState } from "react";
import {
  BaseEdge,
  EdgeLabelRenderer,
  useReactFlow,
  useStore,
  type EdgeProps,
} from "reactflow";
import type { CanvasEdgeData } from "./types";

const parseOutAttr = (sourceExpression: string) => {
  const parts = sourceExpression.trim().split(".");
  return parts[parts.length - 1] || sourceExpression.trim();
};

const routeKey = (route: {
  fromNodeId: string;
  toNodeId: string;
  sourceExpression: string;
  targetAttribute: string;
}) =>
  [route.fromNodeId, route.toNodeId, route.sourceExpression.trim(), route.targetAttribute.trim()].join("|");

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
  const zoom = useStore((state) => state.transform[2] || 1);
  const edges = useStore((state) => state.edges);
  const { setEdges, getNodes } = useReactFlow();

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
    new Map(mappings.map((m) => [routeKey(m), m])).values(),
  );

  // Sibling spread so parallel edges don't overlap
  const siblingEdges = edges
    .filter(
      (e) =>
        (e.source === source && e.target === target) ||
        (e.source === target && e.target === source),
    )
    .map((e) => e.id)
    .sort();
  const siblingIndex = Math.max(0, siblingEdges.indexOf(id));
  const siblingSpread = (siblingIndex - (siblingEdges.length - 1) / 2) * 22;

  const dx = targetX - sourceX;
  const dy = targetY - sourceY;
  const length = Math.hypot(dx, dy) || 1;
  const nx = -dy / length;
  const ny = dx / length;

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

  const allNodes = getNodes();
  const sourceNodeLabel = allNodes.find((n) => n.id === source)?.data?.label ?? source;
  const targetNodeLabel = allNodes.find((n) => n.id === target)?.data?.label ?? target;

  useEffect(() => {
    if (!dragState) return;

    const handleMouseMove = (event: MouseEvent) => {
      const deltaX = event.clientX - dragState.startClientX;
      const deltaY = event.clientY - dragState.startClientY;
      const moved = Math.abs(deltaX) > 2 || Math.abs(deltaY) > 2;
      if (moved && !dragState.moved) {
        setDragState((cur) => (cur ? { ...cur, moved: true } : cur));
      }
      setDragPreviewOffset({
        x: dragState.startOffsetX + deltaX / zoom,
        y: dragState.startOffsetY + deltaY / zoom,
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
            ? { ...edge, data: { ...(edge.data ?? {}), labelOffset: finalOffset } }
            : edge,
        ),
      );
      if (dragState.moved) setSkipNextToggle(true);
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

  const handleRemoveMapping = (mapping: (typeof uniqueMappings)[number]) => {
    window.dispatchEvent(
      new CustomEvent("lurastack-remove-edge-mapping", {
        detail: {
          edgeId: id,
          fromNodeId: mapping.fromNodeId,
          toNodeId: mapping.toNodeId,
          sourceExpression: mapping.sourceExpression,
          targetAttribute: mapping.targetAttribute,
        },
      }),
    );
  };

  const handleAddMapping = () => {
    window.dispatchEvent(
      new CustomEvent("lurastack-open-edge-mapper", {
        detail: {
          edgeId: id,
        },
      }),
    );
  };

  const fromLabel =
    uniqueMappings.find((m) => m.fromNodeId === source)?.fromNodeLabel ??
    sourceNodeLabel;
  const toLabel =
    uniqueMappings.find((m) => m.toNodeId === target)?.toNodeLabel ??
    targetNodeLabel;

  return (
    <>
      <BaseEdge id={id} path={edgePath} markerEnd={markerEnd} style={style} />

      {uniqueMappings.length > 0 && <EdgeLabelRenderer>
        <div
          className="connection-overlay pointer-events-auto absolute"
          style={{
            left: 0,
            top: 0,
            transform: `translate(-50%, -50%) translate(${desiredMidX}px, ${desiredMidY}px)`,
            zIndex: 12000,
            width: collapsed ? "240px" : "380px",
          }}
          onPointerDown={(e) => {
            e.stopPropagation();
            if (e.button !== 0) return;
            setDragState({
              startClientX: e.clientX,
              startClientY: e.clientY,
              startOffsetX: persistedOffsetX,
              startOffsetY: persistedOffsetY,
              moved: false,
            });
          }}
          onClick={(e) => e.stopPropagation()}
        >
          <div className="rounded-lg border border-slate-200 bg-white shadow-md overflow-hidden select-none">

            <button
              type="button"
              className="w-full flex items-center gap-1.5 px-2.5 py-1.5 hover:bg-slate-50 transition-colors"
              onClick={() => {
                if (skipNextToggle) { setSkipNextToggle(false); return; }
                setCollapsed((c) => !c);
              }}
            >
              <span className="shrink-0 w-1.5 h-1.5 rounded-full bg-sky-400" />

              <div className="flex-1 min-w-0 flex items-center gap-1 text-[11px]">
                <span className="truncate font-medium text-slate-700" title={fromLabel}>
                  {fromLabel}
                </span>
                <span className="shrink-0 text-slate-400">→</span>
                <span className="truncate font-medium text-slate-700" title={toLabel}>
                  {toLabel}
                </span>
              </div>

              <div className="shrink-0 flex items-center gap-1">
                <span className="rounded-full bg-sky-100 px-1.5 text-[9px] font-semibold text-sky-700">
                  {uniqueMappings.length}
                </span>
                <span className="text-slate-400 text-[9px]">{collapsed ? "▾" : "▴"}</span>
              </div>
            </button>

            {!collapsed && (
              <div className="border-t border-slate-100">
                {uniqueMappings.map((mapping) => {
                  const mappingFromLabel = mapping.fromNodeLabel ?? mapping.fromNodeId;
                  const mappingToLabel = mapping.toNodeLabel ?? mapping.toNodeId;
                  return (
                    <div
                      key={routeKey(mapping)}
                      className="group flex items-center gap-2 px-2.5 py-1 hover:bg-slate-50 transition-colors"
                    >
                      <span
                        className="truncate text-[10px] font-semibold text-slate-700 flex-1 min-w-0"
                        title={mappingFromLabel}
                      >
                        {mappingFromLabel}
                      </span>

                      <span className="shrink-0 text-[9px] text-slate-400">:</span>

                      <span
                        className="truncate text-[11px] font-mono text-sky-700 flex-1 min-w-0"
                        title={mapping.sourceExpression}
                      >
                        {parseOutAttr(mapping.sourceExpression)}
                      </span>

                      <span className="shrink-0 text-[11px] text-slate-400">→</span>

                      <span
                        className="truncate text-[10px] font-semibold text-slate-700 flex-1 min-w-0"
                        title={mappingToLabel}
                      >
                        {mappingToLabel}
                      </span>

                      <span className="shrink-0 text-[9px] text-slate-400">:</span>

                      <span
                        className="truncate text-[11px] font-mono text-violet-700 flex-1 min-w-0"
                        title={mapping.targetAttribute}
                      >
                        {mapping.targetAttribute}
                      </span>

                      <button
                        type="button"
                        onClick={(e) => {
                          e.stopPropagation();
                          handleRemoveMapping(mapping);
                        }}
                        className="shrink-0 flex items-center justify-center w-5 h-5 rounded text-slate-300 hover:bg-red-50 hover:text-red-500 transition-colors opacity-0 group-hover:opacity-100"
                        title="Remove mapping"
                      >
                        ×
                      </button>
                    </div>
                  );
                })}

                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    handleAddMapping();
                  }}
                  className="w-full flex items-center justify-center py-2 text-slate-400 hover:bg-slate-50 hover:text-slate-600 transition-colors border-t border-slate-100 text-xl"
                  title="Add mapping"
                >
                  +
                </button>
              </div>
            )}

            {collapsed && uniqueMappings.length === 0 && (
              <button
                type="button"
                onClick={(e) => {
                  e.stopPropagation();
                  handleAddMapping();
                }}
                className="w-full flex items-center justify-center py-8 text-slate-400 hover:bg-slate-50 hover:text-slate-600 transition-colors text-3xl"
                title="Add mapping"
              >
                +
              </button>
            )}
          </div>
        </div>
      </EdgeLabelRenderer>}
    </>
  );
}
