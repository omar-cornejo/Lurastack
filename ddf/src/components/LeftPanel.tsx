import { useState, useRef, useEffect, useMemo, type DragEvent } from "react";
import { Icon } from '@iconify/react';
import { TEST_NODE_SCHEMAS, type TerraformNodeSchema } from "../models/testNodes";
import { NODE_DRAG_MIME, serializeDraggedNode } from "../commands/nodeDragPayload";

type LeftPanelProps = {
  bottomHeight: number;
  addResource: (node: TerraformNodeSchema) => void;
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

const normalize = (value: string) =>
  value
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-z0-9]+/g, " ")
    .trim();

const compact = (value: string) => normalize(value).replace(/\s+/g, "");

const isSubsequence = (needle: string, haystack: string) => {
  if (!needle) return true;
  let needleIndex = 0;
  for (const character of haystack) {
    if (character === needle[needleIndex]) {
      needleIndex += 1;
      if (needleIndex === needle.length) return true;
    }
  }
  return false;
};

const rankNode = (node: TerraformNodeSchema, query: string) => {
  const normalizedQuery = normalize(query);
  if (!normalizedQuery) return 1;

  const queryTokens = normalizedQuery.split(/\s+/).filter(Boolean);
  if (!queryTokens.length) return 1;

  const haystacks = [
    node.label,
    node.id,
    node.terraformType,
    node.terraformKind,
    ...node.properties.map((property) => property.name),
    ...(node.searchTerms ?? []),
  ];

  const normalizedHaystacks = haystacks.map((value) => normalize(value));
  const compactHaystacks = haystacks.map((value) => compact(value));

  let score = 0;

  for (const token of queryTokens) {
    const tokenCompact = token.replace(/\s+/g, "");
    let tokenBest = 0;

    for (const value of normalizedHaystacks) {
      if (!value) continue;
      if (value === token) tokenBest = Math.max(tokenBest, 120);
      else if (value.startsWith(token)) tokenBest = Math.max(tokenBest, 90);
      else if (value.includes(token)) tokenBest = Math.max(tokenBest, 60);
    }

    if (tokenBest === 0) {
      for (const value of compactHaystacks) {
        if (!value || !tokenCompact) continue;
        if (value === tokenCompact) tokenBest = Math.max(tokenBest, 85);
        else if (value.startsWith(tokenCompact)) tokenBest = Math.max(tokenBest, 70);
        else if (isSubsequence(tokenCompact, value)) tokenBest = Math.max(tokenBest, 40);
      }
    }

    if (tokenBest === 0) return 0;
    score += tokenBest;
  }

  return score;
};

export const LeftPanel = ({ bottomHeight, addResource }: LeftPanelProps) => {
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const [search, setSearch] = useState("");

  const handleDragStart = (
    event: DragEvent<HTMLButtonElement>,
    node: TerraformNodeSchema,
  ) => {
    event.dataTransfer.setData(NODE_DRAG_MIME, serializeDraggedNode(node));
    event.dataTransfer.setData("text/plain", node.id);
    event.dataTransfer.effectAllowed = "copy";
  };

  const filteredNodes = useMemo(() => {
    return TEST_NODE_SCHEMAS
      .map((node) => ({ node, score: rankNode(node, search) }))
      .filter((entry) => entry.score > 0)
      .sort((left, right) => {
        if (right.score !== left.score) return right.score - left.score;
        return left.node.label.localeCompare(right.node.label);
      })
      .map((entry) => entry.node);
  }, [search]);

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
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;
      const rect = panelRef.current.getBoundingClientRect();
      const newWidth = e.clientX - rect.left;
      if (newWidth >= 200 && newWidth <= 600) setWidth(newWidth);
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

  return (
    <aside
      ref={panelRef}
      style={{
        width: visible ? width : 12,
        height: `calc(100vh - ${bottomHeight}px)`, 
      }}
      className={`relative bg-gray-100 border-r flex-none ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {visible && (
        <div
          onMouseDown={(e) => {
            e.preventDefault();
            document.body.style.userSelect = "none";
            document.body.style.cursor = "col-resize";
            setIsResizing(true);
          }}
          className="absolute right-0 top-0 h-full w-1 cursor-col-resize bg-transparent hover:bg-gray-300"
        />
      )}

      {visible && (
        <div className="p-2">
          <div className="relative">
            <input
              type="text"
              placeholder="Search icon..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="w-full pl-8 pr-2 py-1.5 text-sm rounded bg-white border border-gray-300 focus:outline-none focus:ring-1 focus:ring-blue-400"
            />
            <Icon icon="mdi:magnify" className="absolute left-2 top-1/2 -translate-y-1/2 text-gray-400" width={16} />
          </div>
        </div>
      )}

      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible(v => !v);
        }}
        className="absolute right-0 top-1/2 transform translate-x-1/2 -translate-y-1/2 px-2 py-1 bg-gray-200 rounded z-10 flex items-center justify-center"
        aria-expanded={visible}
        aria-controls="left-panel-content"
        aria-label={visible ? 'Close left panel' : 'Show left panel'}
        type="button"
      >
        <Icon icon="weui:arrow-filled" className={`transition-transform ${visible ? "rotate-180" : ""}`} width={10} height={18} aria-hidden="true" />
      </button>

      {visible && (
        <div
          id="left-panel-content"
          className="p-2 overflow-auto box-border"
          style={{ maxHeight: '100%' }}
        >
          {hasSearch && !hasResults && (
            <p className="rounded border border-dashed border-gray-300 p-2 text-xs text-gray-500">
              No matches found.
            </p>
          )}

          <div className="space-y-3">
            {GROUP_ORDER
              .filter((groupKey) => groupedNodes[groupKey].length > 0 || !hasSearch)
              .map((groupKey) => (
                <section key={groupKey}>
                  <div className="mb-1 flex items-center justify-between">
                    <h3 className="text-[11px] font-semibold uppercase tracking-wide text-gray-500">
                      {GROUP_LABELS[groupKey]}
                    </h3>
                    <span className="text-[10px] text-gray-400">
                      {groupedNodes[groupKey].length}
                    </span>
                  </div>

                  {groupedNodes[groupKey].length === 0 ? (
                    <p className="text-[11px] text-gray-400">No test nodes</p>
                  ) : (
                    <div
                      className="grid gap-2"
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
                          title={`${node.label} (${node.terraformType})`}
                          className="group flex min-h-[84px] cursor-grab select-none flex-col items-center justify-center gap-2 rounded-md border border-gray-200 bg-white px-2 py-2 text-center hover:border-blue-300 hover:bg-blue-50 active:cursor-grabbing"
                        >
                          <img
                            src={node.icon}
                            alt={node.label}
                            draggable={false}
                            className="pointer-events-none h-8 w-8 select-none rounded object-cover opacity-95 group-hover:opacity-100"
                          />
                          <span className="pointer-events-none line-clamp-2 select-none text-[11px] font-medium leading-4 text-gray-700">
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
      )}
    </aside>
  );
};
