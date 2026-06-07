import { Icon } from "@iconify/react";
import type { CSSProperties, MouseEvent } from "react";

type Props = {
  open: boolean;
  onClick: (e: MouseEvent<HTMLButtonElement>) => void;
  edge: "right" | "left" | "top";
  ariaLabel?: string;
  ariaControls?: string;
  style?: CSSProperties;
};

const EDGE_CLASSES: Record<Props["edge"], string> = {
  right: "absolute right-0 top-1/2 z-20 flex h-10 w-[1.125rem] -translate-y-1/2 translate-x-full cursor-pointer items-center justify-center rounded-r-md border border-l-0",
  left: "absolute left-0 top-1/2 z-20 flex h-10 w-[1.125rem] -translate-y-1/2 -translate-x-full cursor-pointer items-center justify-center rounded-l-md border border-r-0",
  top: "absolute left-4 top-0 z-20 flex h-[1.125rem] w-10 -translate-y-full cursor-pointer items-center justify-center rounded-t-md border border-b-0",
};

const iconClass = (edge: Props["edge"], open: boolean) => {
  if (edge === "right") return open ? "rotate-180" : "";
  if (edge === "left") return open ? "" : "rotate-180";
  return open ? "rotate-90" : "-rotate-90";
};

export function PanelToggleTab({ open, onClick, edge, ariaLabel, ariaControls, style }: Props) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-expanded={open}
      aria-controls={ariaControls}
      aria-label={ariaLabel ?? (open ? "Collapse panel" : "Expand panel")}
      className={`${EDGE_CLASSES[edge]} border-slate-200 bg-white shadow-sm transition-colors hover:bg-slate-50`}
      style={style}
    >
      <Icon
        icon="weui:arrow-filled"
        className={`text-slate-400 transition-transform ${iconClass(edge, open)}`}
        width={8}
        aria-hidden="true"
      />
    </button>
  );
}
