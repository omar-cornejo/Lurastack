import { memo } from "react";
import type { NodeProps } from "reactflow";
import { Handle, NodeResizer, Position } from "reactflow";
import type { CanvasTerraformNodeData } from "./types";
import { DEFAULT_CONTAINER_SIZE } from "../commands/createCanvasNode";

export const TerraformResourceNode = memo(function TerraformResourceNode({ data, selected }: NodeProps<CanvasTerraformNodeData>) {
  // Plan action styles — computed once, used by all node variants
  const planBorderClass =
    data.planAction === "create"  ? "!border-emerald-400" :
    data.planAction === "change"  ? "!border-orange-400" :
    data.planAction === "destroy" ? "!border-red-400" :
    null;

  const planBg =
    data.planAction === "create"  ? "bg-emerald-50/30" :
    data.planAction === "change"  ? "bg-orange-50/30" :
    data.planAction === "destroy" ? "bg-red-50/30" :
    null;

  const planBadge =
    data.planAction === "create"  ? { label: "create",  cls: "bg-emerald-100 text-emerald-700" } :
    data.planAction === "change"  ? { label: "change",  cls: "bg-orange-100 text-orange-700" } :
    data.planAction === "destroy" ? { label: "destroy", cls: "bg-red-100 text-red-700" } :
    null;

  if (data.isContainer) {
    const isZoneContainer =
      data.containerKind === "zone" ||
      data.schemaId === "aws_availability_zone" ||
      data.schemaId === "aws_security_group";

    if (isZoneContainer) {
      const defaultBorder = data.isDropTarget
        ? "border-emerald-400 ring-2 ring-emerald-200/60"
        : planBorderClass ?? "border-violet-300";

      return (
        <div
          className={`pointer-events-none relative flex h-full w-full flex-col overflow-hidden rounded-xl border-2 border-dashed transition-colors ${defaultBorder} ${planBg ?? ""} ${data.isLayerGhost ? "opacity-40 grayscale" : ""}`}
        >
          {planBadge && (
            <span className={`absolute right-2 top-2 z-10 rounded-[4px] px-1.5 py-[1px] text-[8px] font-bold tracking-wide ${planBadge.cls}`}>
              {planBadge.label}
            </span>
          )}
          <NodeResizer
            isVisible={selected}
            minWidth={DEFAULT_CONTAINER_SIZE.width}
            minHeight={DEFAULT_CONTAINER_SIZE.height}
            lineClassName="!pointer-events-none !border-violet-300"
            handleClassName="!pointer-events-auto !z-[13000] !h-2.5 !w-2.5 !rounded-full !border-2 !border-white !bg-violet-500"
          />

          <Handle type="target" id="top" position={Position.Top} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-violet-500" />
          <Handle type="source" id="top" position={Position.Top} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-violet-500" />

          {/* Header */}
          <div className="container-drag-handle pointer-events-auto flex shrink-0 items-start gap-3 border-b border-dashed border-violet-200 bg-white/90 px-3 py-2.5">
            <div className="mt-0.5 flex h-10 w-10 shrink-0 overflow-hidden rounded-lg bg-gradient-to-br from-violet-50 to-violet-100/60 shadow-[0_1px_4px_rgba(0,0,0,0.08),0_0_0_1px_rgba(0,0,0,0.05)]">
              <img src={data.icon} alt={data.label} className="h-full w-full object-cover drop-shadow-sm" draggable={false} />
            </div>
            <div className="min-w-0 flex-1">
              <p className="truncate text-[12.5px] font-semibold leading-snug text-slate-800">{data.label}</p>
              <span className="mt-1 inline-block max-w-full truncate rounded-[4px] bg-violet-50 px-1.5 py-[1.5px] font-mono text-[9px] font-medium tracking-tight text-violet-700">
                {data.terraformType}
              </span>
            </div>
          </div>

          {/* Body */}
          <div className="pointer-events-none flex flex-1 items-center justify-center">
            <span className="text-[10px] font-medium text-violet-300/80">Drop nodes here</span>
          </div>

          <Handle type="source" id="bottom" position={Position.Bottom} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-violet-500" />
          <Handle type="target" id="bottom" position={Position.Bottom} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-violet-500" />
        </div>
      );
    }

    const defaultBorder = data.isDropTarget
      ? "border-emerald-400 ring-2 ring-emerald-200/60"
      : planBorderClass ?? "border-indigo-200";

    return (
      <div
        className={`pointer-events-none relative flex h-full w-full flex-col overflow-hidden rounded-xl border-2 transition-colors ${defaultBorder} ${planBg ?? ""} ${data.isLayerGhost ? "opacity-40 grayscale" : ""}`}
      >
        {planBadge && (
          <span className={`absolute right-2 top-2 z-10 rounded-[4px] px-1.5 py-[1px] text-[8px] font-bold tracking-wide ${planBadge.cls}`}>
            {planBadge.label}
          </span>
        )}
        <NodeResizer
          isVisible={selected}
          minWidth={DEFAULT_CONTAINER_SIZE.width}
          minHeight={DEFAULT_CONTAINER_SIZE.height}
          lineClassName="!pointer-events-none !border-indigo-300"
          handleClassName="!pointer-events-auto !z-[13000] !h-2.5 !w-2.5 !rounded-full !border-2 !border-white !bg-indigo-500"
        />

        <Handle type="target" id="top" position={Position.Top} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-indigo-500" />
        <Handle type="source" id="top" position={Position.Top} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-indigo-500" />

        {/* Header */}
        <div className="container-drag-handle pointer-events-auto flex shrink-0 items-start gap-3 border-b border-indigo-100 bg-white px-3 py-2.5">
          <div className="mt-0.5 flex h-10 w-10 shrink-0 overflow-hidden rounded-lg bg-gradient-to-br from-indigo-50 to-indigo-100/60 shadow-[0_1px_4px_rgba(0,0,0,0.08),0_0_0_1px_rgba(0,0,0,0.05)]">
            <img src={data.icon} alt={data.label} className="h-full w-full object-cover drop-shadow-sm" draggable={false} />
          </div>
          <div className="min-w-0 flex-1">
            <p className="truncate text-[12.5px] font-semibold leading-snug text-slate-800">{data.label}</p>
            <span className="mt-1 inline-block max-w-full truncate rounded-[4px] bg-indigo-50 px-1.5 py-[1.5px] font-mono text-[9px] font-medium tracking-tight text-indigo-700">
              {data.terraformType}
            </span>
          </div>
        </div>

        {/* Body */}
        <div className={`pointer-events-none flex flex-1 items-center justify-center ${planBg ?? "bg-indigo-50/30"}`}>
          <span className="text-[10px] font-medium text-indigo-300/80">Drop nodes here</span>
        </div>

        <Handle type="source" id="bottom" position={Position.Bottom} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-indigo-500" />
        <Handle type="target" id="bottom" position={Position.Bottom} className="!pointer-events-auto !h-2 !w-2 !rounded-full !border-2 !border-white !bg-indigo-500" />
      </div>
    );
  }

  const isData = data.terraformKind === "data";
  const handleColor = isData ? "!bg-emerald-500" : "!bg-indigo-500";
  const iconBg      = isData ? "from-emerald-50 to-emerald-100/60" : "from-indigo-50 to-indigo-100/60";
  const badgeBg     = isData ? "bg-emerald-50 text-emerald-700" : "bg-indigo-50 text-indigo-700";

  const cardBorder = planBorderClass ?? (selected
    ? isData
      ? "border-emerald-400 shadow-[0_4px_16px_rgba(16,185,129,0.18),0_0_0_1px_rgba(16,185,129,0.25)]"
      : "border-indigo-400 shadow-[0_4px_16px_rgba(99,102,241,0.18),0_0_0_1px_rgba(99,102,241,0.25)]"
    : "border-slate-200/90"
  );

  return (
    <div
      className={`
        relative inline-flex min-w-[160px] items-start gap-3
        rounded-xl border
        p-3
        shadow-[0_2px_10px_rgba(0,0,0,0.07),0_0_0_1px_rgba(0,0,0,0.04)]
        transition-all duration-150
        ${planBg ?? "bg-white"}
        ${cardBorder}
        ${data.isLayerGhost ? "opacity-40 grayscale" : ""}
      `}
    >
      {planBadge && (
        <span className={`absolute -top-2 right-2 rounded-[4px] px-1.5 py-[1px] text-[8px] font-bold tracking-wide ${planBadge.cls}`}>
          {planBadge.label}
        </span>
      )}
      <Handle
        type="target" id="top" position={Position.Top}
        className={`!h-2 !w-2 !rounded-full !border-2 !border-white ${handleColor} !-top-[5px]`}
      />
      <Handle
        type="source" id="top" position={Position.Top}
        className={`!h-2 !w-2 !rounded-full !border-2 !border-white ${handleColor} !-top-[5px]`}
      />

      {/* Icon container */}
      <div
        className={`mt-0.5 flex h-10 w-10 shrink-0 overflow-hidden rounded-lg bg-gradient-to-br ${iconBg}
          shadow-[0_1px_4px_rgba(0,0,0,0.08),0_0_0_1px_rgba(0,0,0,0.05)]`}
      >
        <img
          src={data.icon}
          alt={data.label}
          className="h-full w-full object-cover drop-shadow-sm"
          draggable={false}
        />
      </div>

      {/* Text */}
      <div className="flex flex-col">
        <p className="whitespace-nowrap text-[12.5px] font-semibold leading-snug text-slate-800">
          {data.label}
        </p>
        <span
          className={`mt-1 inline-block whitespace-nowrap rounded-[4px] px-1.5 py-[1.5px] font-mono text-[9px] font-medium tracking-tight ${badgeBg}`}
        >
          {data.terraformType}
        </span>
      </div>

      <Handle
        type="source" id="bottom" position={Position.Bottom}
        className={`!h-2 !w-2 !rounded-full !border-2 !border-white ${handleColor} !-bottom-[5px]`}
      />
      <Handle
        type="target" id="bottom" position={Position.Bottom}
        className={`!h-2 !w-2 !rounded-full !border-2 !border-white ${handleColor} !-bottom-[5px]`}
      />
    </div>
  );
});
