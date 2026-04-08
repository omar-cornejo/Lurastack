import type { NodeProps } from "reactflow";
import { Handle, NodeResizer, Position } from "reactflow";
import type { CanvasTerraformNodeData } from "./types";
import { DEFAULT_CONTAINER_SIZE } from "../commands/createCanvasNode";

export function TerraformResourceNode({ data, selected }: NodeProps<CanvasTerraformNodeData>) {
  if (data.isContainer) {
    return (
      <div
        className={`pointer-events-none h-full w-full rounded-md border-2 bg-blue-50/60 shadow-inner transition-colors ${
          data.isDropTarget
            ? "border-emerald-500 ring-2 ring-emerald-300"
            : "border-blue-300"
        } ${data.isLayerGhost ? "opacity-40 grayscale" : ""}`}
      >
        <NodeResizer
          isVisible={selected}
          minWidth={DEFAULT_CONTAINER_SIZE.width}
          minHeight={DEFAULT_CONTAINER_SIZE.height}
          lineClassName="!pointer-events-none !border-blue-400"
          handleClassName="!pointer-events-auto !z-[13000] !h-2.5 !w-2.5 !rounded-sm !border !border-white !bg-blue-500"
        />

        <Handle
          type="target"
          id="top"
          position={Position.Top}
          className="!pointer-events-auto !bg-blue-500"
        />
        <Handle
          type="source"
          id="top"
          position={Position.Top}
          className="!pointer-events-auto !bg-blue-500"
        />

        <div className="container-drag-handle pointer-events-auto flex items-center gap-2 border-b border-blue-200 bg-blue-100/80 px-3 py-2">
          <img
            src={data.icon}
            alt={data.label}
            className="h-6 w-6 rounded object-cover"
            draggable={false}
          />
          <div className="min-w-0">
            <p className="truncate text-xs font-semibold text-blue-900">{data.label}</p>
            <p className="truncate text-[10px] text-blue-700">container · {data.terraformType}</p>
          </div>
        </div>

        <div className="pointer-events-none flex h-[calc(100%-45px)] items-center justify-center px-2">
          <span className="text-[10px] text-blue-500">Drop nodes here</span>
        </div>

        <Handle
          type="source"
          id="bottom"
          position={Position.Bottom}
          className="!pointer-events-auto !bg-blue-500"
        />
        <Handle
          type="target"
          id="bottom"
          position={Position.Bottom}
          className="!pointer-events-auto !bg-blue-500"
        />
      </div>
    );
  }

  return (
    <div className={`h-full w-full rounded-md border border-slate-300 bg-white px-3 py-2 shadow-sm ${data.isLayerGhost ? "opacity-40 grayscale" : ""}`}>
      <Handle type="target" id="top" position={Position.Top} className="!bg-slate-500" />
      <Handle type="source" id="top" position={Position.Top} className="!bg-slate-500" />

      <div className="flex items-center gap-2">
        <img src={data.icon} alt={data.label} className="h-7 w-7 rounded object-cover" />
        <div className="min-w-0">
          <p className="truncate text-xs font-semibold text-slate-800">{data.label}</p>
          <p className="truncate text-[10px] text-slate-500">{data.terraformKind} · {data.terraformType}</p>
        </div>
      </div>

      <Handle type="source" id="bottom" position={Position.Bottom} className="!bg-slate-500" />
      <Handle type="target" id="bottom" position={Position.Bottom} className="!bg-slate-500" />
    </div>
  );
}
