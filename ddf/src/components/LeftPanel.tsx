import {
  useState,
  useRef,
  useEffect,
  useMemo,
  type DragEvent,
  type KeyboardEvent,
  type MouseEvent as ReactMouseEvent,
} from "react";
import { Icon } from '@iconify/react';
import { NODE_SCHEMAS, type TerraformNodeSchema } from "../models/nodeRegistry";
import { NODE_DRAG_MIME, serializeDraggedNode } from "../commands/nodeDragPayload";
import {
  clearActiveLeftPanelDrag,
  setActiveLeftPanelDrag,
} from "../commands/leftPanelDragState";
import { ProviderSelector } from "./ProviderSelector";

type LeftPanelProps = {
  addResource: (node: TerraformNodeSchema) => void;
  cloudProvider: "aws" | "gcp" | "azure";
  onCloudProviderChange: (provider: "aws" | "gcp" | "azure") => void;
  onWidthChange?: (width: number) => void;
};

const GROUP_ORDER: Array<TerraformNodeSchema["schemaGroup"]> = [
  "resources",
  "data_sources",
  "ephemeral_resources",
  "functions",
  "provider",
];

const GROUP_LABELS: Record<TerraformNodeSchema["schemaGroup"], string> = {
  resources: "Resources",
  data_sources: "Data Sources",
  ephemeral_resources: "Ephemeral Resources",
  functions: "Functions",
  provider: "Provider",
};

const LEFT_PANEL_MIN_WIDTH = 200;
const LEFT_PANEL_MAX_WIDTH = 600;
const LEFT_PANEL_KEYBOARD_STEP = 12;
const LEFT_PANEL_KEYBOARD_FAST_STEP = 32;

const normalize = (value: string) =>
  value
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-z0-9]+/g, " ")
    .trim();

const compact = (value: string) => normalize(value).replace(/\s+/g, "");

const rankNode = (node: TerraformNodeSchema, query: string) => {
  const normalizedQuery = normalize(query);
  if (!normalizedQuery) return 1;

  const queryTokens = normalizedQuery.split(/\s+/).filter(Boolean);
  if (!queryTokens.length) return 1;

  const labelNormalized = normalize(node.label);
  const idNormalized = normalize(node.id);
  const typeNormalized = normalize(node.terraformType);
  const searchTermsNormalized = (node.searchTerms ?? []).map((term) => normalize(term));

  const primaryFields = [labelNormalized, idNormalized, typeNormalized].filter(Boolean);
  const secondaryFields = searchTermsNormalized.filter(Boolean);

  const labelCompact = compact(node.label);
  const idCompact = compact(node.id);
  const typeCompact = compact(node.terraformType);
  const searchTermsCompact = (node.searchTerms ?? []).map((term) => compact(term));

  const primaryCompactFields = [labelCompact, idCompact, typeCompact].filter(Boolean);
  const secondaryCompactFields = searchTermsCompact.filter(Boolean);

  let score = 0;

  for (const token of queryTokens) {
    const tokenCompact = compact(token);
    let tokenBest = 0;

    for (const value of primaryFields) {
      if (!value) continue;
      if (value === token) tokenBest = Math.max(tokenBest, 200);
      else if (value.startsWith(token)) tokenBest = Math.max(tokenBest, 140);
      else if (value.includes(token)) tokenBest = Math.max(tokenBest, 95);
    }

    if (tokenBest === 0) {
      for (const value of primaryCompactFields) {
        if (!value || !tokenCompact) continue;
        if (value === tokenCompact) tokenBest = Math.max(tokenBest, 125);
        else if (value.startsWith(tokenCompact)) tokenBest = Math.max(tokenBest, 105);
        else if (value.includes(tokenCompact)) tokenBest = Math.max(tokenBest, 80);
      }
    }

    if (tokenBest === 0) {
      for (const value of secondaryFields) {
        if (!value) continue;
        if (value === token) tokenBest = Math.max(tokenBest, 70);
        else if (value.startsWith(token)) tokenBest = Math.max(tokenBest, 55);
        else if (value.includes(token)) tokenBest = Math.max(tokenBest, 40);
      }
    }

    if (tokenBest === 0) {
      for (const value of secondaryCompactFields) {
        if (!value || !tokenCompact) continue;
        if (value === tokenCompact) tokenBest = Math.max(tokenBest, 50);
        else if (value.startsWith(tokenCompact)) tokenBest = Math.max(tokenBest, 45);
        else if (value.includes(tokenCompact)) tokenBest = Math.max(tokenBest, 35);
      }
    }

    if (tokenBest === 0) return 0;
    score += tokenBest;
  }

  if (labelNormalized === normalizedQuery || idNormalized === normalizedQuery || typeNormalized === normalizedQuery) {
    score += 1000;
  } else if (
    labelNormalized.startsWith(normalizedQuery) ||
    idNormalized.startsWith(normalizedQuery) ||
    typeNormalized.startsWith(normalizedQuery)
  ) {
    score += 500;
  }

  return score;
};

export const LeftPanel = ({
  addResource,
  cloudProvider,
    onCloudProviderChange,
  onWidthChange,
}: LeftPanelProps) => {
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const [search, setSearch] = useState("");

  const handleDragStart = (
    event: DragEvent<HTMLButtonElement>,
    node: TerraformNodeSchema,
  ) => {
    setActiveLeftPanelDrag(node);
    event.dataTransfer.setData(NODE_DRAG_MIME, serializeDraggedNode(node));
    event.dataTransfer.setData("text/plain", node.id);
    event.dataTransfer.effectAllowed = "copy";
  };

  const handleDragEnd = () => {
    clearActiveLeftPanelDrag();
  };

  const filteredNodes = useMemo(() => {
    const providerFiltered = NODE_SCHEMAS.filter((node) => {
      if (cloudProvider === "aws") {
        return node.terraformType.startsWith("aws_");
      }
      return true;
    });

    return providerFiltered
      .map((node) => ({ node, score: rankNode(node, search) }))
      .filter((entry) => entry.score > 0)
      .sort((left, right) => {
        if (right.score !== left.score) return right.score - left.score;
        return left.node.label.localeCompare(right.node.label);
      })
      .map((entry) => entry.node);
  }, [cloudProvider, search]);

  const groupedNodes = useMemo(() => {
    const groups: Record<TerraformNodeSchema["schemaGroup"], TerraformNodeSchema[]> = {
      resources: [],
      data_sources: [],
      ephemeral_resources: [],
      functions: [],
      provider: [],
    };

    filteredNodes.forEach((node) => {
      groups[node.schemaGroup].push(node);
    });

    return groups;
  }, [filteredNodes]);

  const tileMin = Math.max(78, Math.min(132, Math.floor(width / 3.2)));
  const hasSearch = search.trim().length > 0;
  const hasResults = filteredNodes.length > 0;

  useEffect(() => {
    onWidthChange?.(visible ? width : 0);
  }, [visible, width, onWidthChange]);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;
      const rect = panelRef.current.getBoundingClientRect();
      const newWidth = e.clientX - rect.left;
      setWidth(Math.max(LEFT_PANEL_MIN_WIDTH, Math.min(LEFT_PANEL_MAX_WIDTH, newWidth)));
    };
    const handleMouseUp = () => {
      document.body.style.userSelect = "";
      document.body.style.cursor = "";
      setIsResizing(false);
    };
    if (isResizing) {
      document.addEventListener("mousemove", handleMouseMove);
      document.addEventListener("mouseup", handleMouseUp);
    }
    return () => {
      document.removeEventListener("mousemove", handleMouseMove);
      document.removeEventListener("mouseup", handleMouseUp);
    };
  }, [isResizing]);

  const startPanelResize = (e: ReactMouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    e.stopPropagation();
    document.body.style.userSelect = "none";
    document.body.style.cursor = "col-resize";
    setIsResizing(true);
  };

  const resizePanelWithKeyboard = (e: KeyboardEvent<HTMLButtonElement>) => {
    const step = e.shiftKey ? LEFT_PANEL_KEYBOARD_FAST_STEP : LEFT_PANEL_KEYBOARD_STEP;

    if (e.key === "ArrowLeft") {
      e.preventDefault();
      setWidth((current) => Math.max(LEFT_PANEL_MIN_WIDTH, current - step));
      return;
    }

    if (e.key === "ArrowRight") {
      e.preventDefault();
      setWidth((current) => Math.min(LEFT_PANEL_MAX_WIDTH, current + step));
      return;
    }

    if (e.key === "Home") {
      e.preventDefault();
      setWidth(LEFT_PANEL_MIN_WIDTH);
      return;
    }

    if (e.key === "End") {
      e.preventDefault();
      setWidth(LEFT_PANEL_MAX_WIDTH);
    }
  };

  return (
    <aside
      ref={panelRef}
      style={{ width: visible ? width : 0 }}
      className={`absolute left-0 top-0 z-30 h-full flex flex-col bg-white border-r border-slate-200 ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {/* Resize handle */}
      {visible && (
        <div className="absolute right-0 top-0 z-10 h-full w-3 translate-x-1/2 cursor-col-resize">
          <button
            type="button"
            onMouseDown={startPanelResize}
            onKeyDown={resizePanelWithKeyboard}
            role="separator"
            aria-label="Resize left panel"
            aria-orientation="vertical"
            aria-valuemin={LEFT_PANEL_MIN_WIDTH}
            aria-valuemax={LEFT_PANEL_MAX_WIDTH}
            aria-valuenow={Math.round(width)}
            className={`group flex h-full w-full cursor-col-resize items-center justify-center rounded-full transition-colors focus:outline-none focus-visible:outline-none ${isResizing ? "bg-slate-200" : "bg-slate-100/90 hover:bg-slate-200"}`}
          >
            <span
              aria-hidden="true"
              className={`h-12 w-[2px] rounded-full transition-colors ${isResizing ? "bg-slate-500" : "bg-slate-400 group-hover:bg-slate-500"}`}
            />
          </button>
        </div>
      )}

      {/* Toggle button */}
      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible(v => !v);
        }}
        className="absolute right-0 top-1/2 z-20 flex h-10 w-[18px] -translate-y-1/2 translate-x-full cursor-pointer items-center justify-center rounded-r-md border border-l-0 border-slate-200 bg-white shadow-sm transition-colors hover:bg-slate-50"
        aria-expanded={visible}
        aria-controls="left-panel-content"
        aria-label={visible ? "Close left panel" : "Show left panel"}
        type="button"
      >
        <Icon
          icon="weui:arrow-filled"
          className={`text-slate-400 transition-transform ${visible ? "rotate-180" : ""}`}
          width={8}
          aria-hidden="true"
        />
      </button>

      <div className="overflow-hidden flex flex-col h-full w-full min-w-0">
          {/* Provider selector */}
          <ProviderSelector
            selectedProvider={cloudProvider}
            onProviderChange={onCloudProviderChange}
          />

          {/* Provider header */}
          <div className="shrink-0 border-b border-slate-200 bg-white px-4 py-3.5">
            <div className="flex items-center gap-3">
              <div className="flex h-9 w-9 shrink-0 items-center justify-center overflow-hidden rounded-xl bg-slate-100 ring-1 ring-slate-200">
                <img src="/icons/AWS-Cloud-logo_32_Dark.svg" alt="AWS" className="h-full w-full object-cover" draggable={false} />
              </div>
              <div className="min-w-0 flex-1">
                <p className="text-[12.5px] font-semibold text-slate-900">Amazon Web Services</p>
                <p className="mt-0.5 text-[10px] text-slate-400">Resource library</p>
              </div>
            </div>

            {/* Search */}
            <div className="relative mt-3">
              <Icon
                icon="mdi:magnify"
                className="pointer-events-none absolute left-2.5 top-1/2 -translate-y-1/2 text-slate-400"
                width={13}
              />
              <input
                type="text"
                placeholder="Search resources…"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className="w-full rounded-lg border border-slate-200 bg-slate-50 py-1.5 pl-8 pr-7 text-[11px] text-slate-700 placeholder-slate-400 transition-all focus:bg-white focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 outline-none ring-0"
              />
              {search && (
                <button
                  onClick={() => setSearch("")}
                  className="absolute right-2.5 top-1/2 -translate-y-1/2 text-slate-400 transition-colors hover:text-slate-700"
                  type="button"
                  aria-label="Clear search"
                >
                  <Icon icon="mdi:close" width={13} />
                </button>
              )}
            </div>
          </div>

          {/* Scrollable content */}
          <div
            id="left-panel-content"
            className="flex-1 overflow-y-auto overflow-x-hidden bg-slate-50/60 py-3"
            style={{ scrollbarWidth: "thin", scrollbarColor: "#e2e8f0 transparent" }}
          >
            {hasSearch && !hasResults && (
              <div className="mx-3 flex flex-col items-center gap-3 rounded-xl border border-dashed border-slate-200 px-4 py-10 text-center">
                <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-slate-100">
                  <Icon icon="mdi:magnify-remove-outline" className="text-slate-400" width={22} />
                </div>
                <div>
                  <p className="text-[12px] font-medium text-slate-600">No results found</p>
                  <p className="mt-0.5 text-[11px] text-slate-400">
                    Nothing matches <span className="font-semibold">"{search}"</span>
                  </p>
                </div>
              </div>
            )}

            <div className="space-y-5">
              {GROUP_ORDER
                .filter((groupKey) => groupedNodes[groupKey].length > 0 || !hasSearch)
                .map((groupKey) => (
                  <section key={groupKey} className="px-3">
                    {/* Group header */}
                    <div className="mb-2.5 flex items-center gap-2">
                      <span className="text-[10px] font-semibold uppercase tracking-widest text-slate-400">
                        {GROUP_LABELS[groupKey]}
                      </span>
                      <div className="h-px flex-1 bg-slate-200" />
                      {groupedNodes[groupKey].length > 0 && (
                        <span className="rounded-full bg-slate-200/80 px-1.5 py-0.5 text-[9px] font-medium tabular-nums text-slate-500">
                          {groupedNodes[groupKey].length}
                        </span>
                      )}
                    </div>

                    {groupedNodes[groupKey].length === 0 ? (
                      <p className="px-1 text-[11px] text-slate-400">None available</p>
                    ) : (
                      <div
                        className="grid gap-1.5"
                        style={{
                          gridTemplateColumns: `repeat(auto-fill, minmax(${tileMin}px, 1fr))`,
                        }}
                      >
                        {groupedNodes[groupKey].map((node) => (
                          <button
                            key={node.id}
                            type="button"
                            draggable
                            onClick={() => addResource(node)}
                            onDragStart={(event) => handleDragStart(event, node)}
                            onDragEnd={handleDragEnd}
                            title={`${node.label} (${node.terraformType})`}
                            className="group flex cursor-grab select-none flex-col items-center gap-2 rounded-xl border border-slate-200 bg-white px-2 py-3 text-center shadow-sm transition-all duration-150 hover:border-orange-300 hover:shadow-md hover:shadow-orange-100/50 active:scale-[0.96] active:cursor-grabbing"
                          >
                            <img
                              src={node.icon}
                              alt={node.label}
                              draggable={false}
                              className="pointer-events-none h-8 w-8 select-none object-cover transition-transform duration-150 group-hover:scale-110"
                            />
                            <span className="pointer-events-none line-clamp-2 select-none text-[10.5px] font-medium leading-tight text-slate-600 transition-colors group-hover:text-slate-900">
                              {node.label}
                            </span>
                          </button>
                        ))}
                      </div>
                    )}
                  </section>
                ))}
            </div>
          </div>
        </div>
    </aside>
  );
};
