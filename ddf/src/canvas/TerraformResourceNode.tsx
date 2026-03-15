import type { NodeProps } from "reactflow";
import { Handle, Position } from "reactflow";
import type { CanvasTerraformNodeData } from "./types";

export function TerraformResourceNode({ data }: NodeProps<CanvasTerraformNodeData>) {
  if (data.isContainer) {
    return (
      <div
        className={`h-full w-full rounded-md border-2 bg-blue-50/60 shadow-inner transition-colors ${
          data.isDropTarget
            ? "border-emerald-500 ring-2 ring-emerald-300"
            : "border-blue-300"
        }`}
      >
        <Handle type="target" position={Position.Top} className="!pointer-events-auto !bg-blue-500" />

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
          position={Position.Bottom}
          className="!pointer-events-auto !bg-blue-500"
        />
      </div>
    );
  }

  return (
    <div className="h-full w-full rounded-md border border-slate-300 bg-white px-3 py-2 shadow-sm">
      <Handle type="target" position={Position.Top} className="!bg-slate-500" />

      <div className="flex items-center gap-2">
        <img src={data.icon} alt={data.label} className="h-7 w-7 rounded object-cover" />
        <div className="min-w-0">
          <p className="truncate text-xs font-semibold text-slate-800">{data.label}</p>
          <p className="truncate text-[10px] text-slate-500">{data.terraformKind} · {data.terraformType}</p>
        </div>
      </div>

      <Handle type="source" position={Position.Bottom} className="!bg-slate-500" />
    </div>
  );
}
