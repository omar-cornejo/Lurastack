import type { NodeProps } from "reactflow";
import { Handle, Position } from "reactflow";
import type { CanvasTerraformNodeData } from "./types";

export function TerraformResourceNode({ data }: NodeProps<CanvasTerraformNodeData>) {
  return (
    <div className="min-w-[150px] rounded-md border border-slate-300 bg-white px-3 py-2 shadow-sm">
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
