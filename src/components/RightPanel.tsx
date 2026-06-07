import { useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";
import { useTranslation } from "react-i18next";
import { HclCodeArea } from "./HclCodeArea";
import { Icon } from "@iconify/react";
import type { Node } from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";

import type { TerraformResource } from "../models/terraform";
import type { ResourcePlanChange } from "../canvas/types";
import { type TerraformNodeSchema } from "../models/nodeRegistry";
import { isObjectCollection, getObjectFields } from "../utils/objectCollection";
import { buildHclFromResource } from "../utils/hclBlocks";
import {
  normalizeMappedReference,
  readNestedAttribute,
  writeNestedAttribute,
} from "../utils/mappingRef";
import {
  INVALID_HCL_VALUE,
  parseHclValueToAttribute,
  parseInspectorInputValue,
  formatInspectorInputValue,
  toHclLiteral,
} from "../utils/hclAttributes";
import {
  SUBNET_PRIVATE_ICON_PATH,
  SUBNET_PUBLIC_ICON_PATH,
} from "../models/iconRegistry";
import {
  getInspectorPropertiesForSchema,
  formatTypeLabel,
  getValuePlaceholder,
  type InspectorProperty,
} from "../commands/schemaInspector";
import HistoryTab from "./HistoryTab";
import type { ViewSnapshot } from "../types/project";
import { scaledPx } from "../utils/uiScale";

type RightPanelTab = "info" | "hcl";
type RightPanelMode = "inspector" | "history";

type PropertySection = {
  sectionKey: string;
  sectionTitle: string;
  properties: Array<
    InspectorProperty & {
      fieldName: string;
    }
  >;
};

type RightPanelProps = {
  nodes: Node<CanvasTerraformNodeData>[];
  resources: TerraformResource[];
  selectedNodeId?: string;
  selectedNode?: Node<CanvasTerraformNodeData>;
  selectedSchema?: TerraformNodeSchema;
  selectedResource?: TerraformResource;
  onSelectNode: (nodeId?: string) => void;
  onUpdateSelectedResource: (
    updater: (resource: TerraformResource) => TerraformResource,
  ) => void;
  diffMode?: boolean;
  cloudMode?: boolean;
  planChanges?: Map<string, ResourcePlanChange>;
  cloudState?: Map<string, Record<string, unknown>>;
  cloudStateAvailable?: boolean;
  cloudStateLoading?: boolean;
  onOverlayWidthChange?: (width: number) => void;
  onOverlayResizingChange?: (isResizing: boolean) => void;
  projectDir?: string;
  currentViewId?: string;
  historyRefreshSignal?: number;
  onRestoreFromHistory?: (snapshot: ViewSnapshot, entryId: string) => void;
};

type DiffAttributeStatus = "create" | "change" | "destroy" | "unchanged";

type DiffAttributeRow = {
  name: string;
  value: unknown;
  status: DiffAttributeStatus;
};

const OBJECT_MAPPER_REF_MIME = "application/x-lurastack-object-mapper-ref";
const BOTTOM_PANEL_CHANNEL = "lurastack-bottompanel-sync";
let latestMapperDragPayload = "";

const RIGHT_PANEL_MIN_WIDTH = 350;
const RIGHT_PANEL_MAX_WIDTH = 600;
const RIGHT_PANEL_KEYBOARD_STEP = 12;
const RIGHT_PANEL_KEYBOARD_FAST_STEP = 32;


const parseHclAttributesForAllowedKeys = (
  hcl: string,
  allowedKeys: Set<string>,
  objectCollectionKeys: Set<string> = new Set(),
): Record<string, unknown> => {
  const attributes: Record<string, unknown> = {};
  const lines = hcl.split("\n");
  const prefixStack: string[] = [];
  // For each object-collection block we're currently inside, accumulate field entries.
  // Stack entry: { blockName, entry } — entry collects field assignments.
  const objBlockStack: Array<{ blockName: string; entry: Record<string, unknown> }> = [];
  let rawDepth = 0;

  lines.forEach((line) => {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith("#") || trimmed.startsWith("//")) return;

    const opens = (line.match(/{/g) ?? []).length;
    const closes = (line.match(/}/g) ?? []).length;

    const isOuterHeader = !!trimmed.match(/^(?:resource|data)\s+"[^"]+"\s+"[^"]+"\s*\{/);
    const namedOpener = !isOuterHeader ? trimmed.match(/^([a-zA-Z_][a-zA-Z0-9_-]*)\s*\{$/) : null;

    if (namedOpener) {
      const blockName = namedOpener[1];
      if (objectCollectionKeys.has(blockName) && prefixStack.length === 0) {
        // Start accumulating a new entry for this object-collection block.
        objBlockStack.push({ blockName, entry: {} });
      } else {
        prefixStack.push(blockName);
      }
    }

    const assignment = trimmed.match(/^([a-zA-Z0-9_.-]+)\s*=\s*(.*)$/);
    if (assignment) {
      const [, key, rawValue] = assignment;
      if (objBlockStack.length > 0) {
        // Inside an object-collection block — accumulate into entry.
        const parsed = parseHclValueToAttribute(rawValue);
        if (parsed !== INVALID_HCL_VALUE) {
          objBlockStack[objBlockStack.length - 1]!.entry[key] = parsed;
        }
      } else {
        const prefix = prefixStack.join(".");
        const fullKey = prefix ? `${prefix}.${key}` : key;
        if (allowedKeys.has(fullKey)) {
          const parsed = parseHclValueToAttribute(rawValue);
          if (parsed !== INVALID_HCL_VALUE) {
            attributes[fullKey] = parsed;
          }
        }
      }
    }

    const nextRawDepth = rawDepth + opens - closes;
    if (nextRawDepth < rawDepth) {
      if (objBlockStack.length > 0) {
        // Closing an object-collection block entry — append to the array.
        const top = objBlockStack.pop()!;
        const existing = attributes[top.blockName];
        const arr = Array.isArray(existing) ? (existing as Array<Record<string, unknown>>) : [];
        attributes[top.blockName] = [...arr, top.entry];
      } else {
        const keepCount = Math.max(0, nextRawDepth - 1);
        if (prefixStack.length > keepCount) {
          prefixStack.splice(keepCount);
        }
      }
    }
    rawDepth = nextRawDepth;
  });

  return attributes;
};

// Returns true for set(object({...})) and list(object({...})) types —
// these are rendered as attribute-as-blocks lists, not simple scalars.
const renderSubFieldType = (rawType: unknown): string => {
  if (typeof rawType === "string") return rawType;
  if (Array.isArray(rawType) && rawType.length >= 2) {
    const [container, inner] = rawType as [unknown, unknown];
    if (typeof inner === "string") return `${container}(${inner})`;
    return String(container);
  }
  return "any";
};

const displaySubFieldValue = (value: unknown): string => {
  return formatInspectorInputValue(value);
};

export const RightPanel = ({
  nodes,
  resources,
  selectedNodeId,
  selectedNode,
  selectedSchema,
  selectedResource,
  onSelectNode,
  onUpdateSelectedResource,
  diffMode = false,
  cloudMode = false,
  planChanges,
  cloudState,
  cloudStateAvailable = false,
  cloudStateLoading = false,
  onOverlayWidthChange,
  onOverlayResizingChange,
  projectDir,
  currentViewId,
  historyRefreshSignal = 0,
  onRestoreFromHistory,
}: RightPanelProps) => {
  const { t } = useTranslation();
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(() => scaledPx(288));
  const [isResizing, setIsResizing] = useState(false);
  const [activeTab, setActiveTab] = useState<RightPanelTab>("info");
  const [activeMode, setActiveMode] = useState<RightPanelMode>("inspector");
  const [hclDraft, setHclDraft] = useState("");
  const [attributeSearch, setAttributeSearch] = useState("");
  const [attributeStateFilters, setAttributeStateFilters] = useState<
    Array<"required" | "optional" | "computed">
  >([]);
  const [attributeTypeFilters, setAttributeTypeFilters] = useState<string[]>([]);
  const [showTypeMenu, setShowTypeMenu] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const nameInputRef = useRef<HTMLInputElement>(null);
  const [isEditingName, setIsEditingName] = useState(false);
  const [nameInputValue, setNameInputValue] = useState("");

  useEffect(() => {
    if (typeof BroadcastChannel === "undefined") return;

    const channel = new BroadcastChannel(BOTTOM_PANEL_CHANNEL);
    channel.onmessage = (event: MessageEvent) => {
      const message = event.data as
        | {
            type?: string;
            value?: string;
          }
        | undefined;

      if (!message || message.type !== "mapper-drag") return;
      latestMapperDragPayload = message.value ?? "";
    };

    return () => {
      channel.close();
    };
  }, []);

  const inspectorProperties = useMemo<InspectorProperty[]>(() => {
    return getInspectorPropertiesForSchema(selectedSchema);
  }, [selectedSchema]);

  const inspectorSections = useMemo<PropertySection[]>(() => {
    const sectionMap = new Map<string, PropertySection>();

    inspectorProperties.forEach((property) => {
      const parts = property.name.split(".");
      const sectionKey = parts.length > 1 ? parts.slice(0, -1).join(".") : "root";
      const fieldName = parts[parts.length - 1] ?? property.name;

      if (!sectionMap.has(sectionKey)) {
        sectionMap.set(sectionKey, {
          sectionKey,
          sectionTitle:
            sectionKey === "root"
              ? t("inspector.mainAttributes")
              : t("inspector.block", { name: sectionKey }),
          properties: [],
        });
      }

      sectionMap.get(sectionKey)!.properties.push({
        ...property,
        fieldName,
      });
    });

    const sections = Array.from(sectionMap.values()).map((section) => ({
      ...section,
      properties: section.properties.sort((left, right) =>
        left.fieldName.localeCompare(right.fieldName),
      ),
    }));

    sections.sort((left, right) => {
      if (left.sectionKey === "root") return -1;
      if (right.sectionKey === "root") return 1;
      return left.sectionKey.localeCompare(right.sectionKey);
    });

    return sections;
  }, [inspectorProperties, t]);

  const availableTypeOptions = useMemo(() => {
    const preferredOrder = ["string", "number", "bool", "map", "list", "set", "object"];
    const discovered = new Set<string>();

    inspectorProperties.forEach((property) => {
      property.typeKinds.forEach((kind) => discovered.add(kind));
    });

    const discoveredList = Array.from(discovered);
    const sorted = [...preferredOrder.filter((kind) => discovered.has(kind))];
    discoveredList
      .filter((kind) => !preferredOrder.includes(kind))
      .sort((left, right) => left.localeCompare(right))
      .forEach((kind) => sorted.push(kind));

    return sorted;
  }, [inspectorProperties]);

  const attributeStats = useMemo(() => ({
    required: inspectorProperties.filter((p) => p.required).length,
    optional: inspectorProperties.filter((p) => p.optional && !p.required).length,
    total: inspectorProperties.length,
  }), [inspectorProperties]);

  const filteredInspectorSections = useMemo(() => {
    const search = attributeSearch.trim().toLowerCase();

    const matchByState = (property: InspectorProperty) => {
      if (!attributeStateFilters.length) return true;

      return attributeStateFilters.some((state) => {
        if (state === "required") return !!property.required;
        if (state === "optional") return !!property.optional;
        return !!property.computed;
      });
    };

    const matchByType = (property: InspectorProperty) => {
      if (!attributeTypeFilters.length) return true;
      return property.typeKinds.some((kind) => attributeTypeFilters.includes(kind));
    };

    const matchBySearch = (property: InspectorProperty & { fieldName: string }) => {
      if (!search) return true;
      return (
        property.name.toLowerCase().includes(search) ||
        property.fieldName.toLowerCase().includes(search) ||
        property.type.toLowerCase().includes(search)
      );
    };

    return inspectorSections
      .map((section) => ({
        ...section,
        properties: section.properties.filter(
          (property) =>
            matchByState(property) &&
            matchByType(property) &&
            matchBySearch(property),
        ),
      }))
      .map((section) => ({
        ...section,
        properties:
          attributeStateFilters.length === 1 && attributeStateFilters[0] === "optional"
            ? [...section.properties].sort((left, right) => {
                const leftOptionalOnly = left.optional && !left.computed;
                const rightOptionalOnly = right.optional && !right.computed;

                if (leftOptionalOnly !== rightOptionalOnly) {
                  return leftOptionalOnly ? -1 : 1;
                }

                return left.fieldName.localeCompare(right.fieldName);
              })
            : section.properties,
      }))
      .filter((section) => section.properties.length > 0);
  }, [attributeSearch, attributeStateFilters, attributeTypeFilters, inspectorSections]);

  const children = useMemo(
    () => {
      if (!selectedNodeId || !selectedNode) return [];
      const isZoneContainer =
        selectedNode.data.containerKind === "zone" ||
        selectedNode.data.schemaId === "aws_availability_zone" ||
        selectedNode.data.schemaId === "aws_security_group";

      if (isZoneContainer) {
        return nodes.filter((node) =>
          (node.data.zoneContainerIds ?? []).includes(selectedNodeId),
        );
      }

      return nodes.filter((node) => node.parentNode === selectedNodeId);
    },
    [nodes, selectedNode, selectedNodeId],
  );

  const diffAttributeRows = useMemo<DiffAttributeRow[]>(() => {
    if (!selectedResource) return [];

    const resourceChange = planChanges?.get(`${selectedResource.type}.${selectedResource.name}`);

    return Object.entries(selectedResource.config.attributes ?? {})
      .filter(([, value]) => {
        if (value === undefined || value === null) return false;
        if (typeof value === "string" && value.trim() === "") return false;
        if (Array.isArray(value) && value.length === 0) return false;
        return true;
      })
      .map(([name, value]) => {
        let status: DiffAttributeStatus;
        if (!resourceChange) {
          status = "unchanged";
        } else if (resourceChange.attrActions?.has(name)) {
          status = resourceChange.attrActions.get(name)!;
        } else if (resourceChange.action === "change") {
          status = "unchanged";
        } else {
          status = resourceChange.action;
        }
        return { name, value, status };
      });
  }, [selectedResource, planChanges]);

  const cloudResourceValues = useMemo<Record<string, unknown> | undefined>(() => {
    if (!selectedResource || !cloudState) return undefined;
    return cloudState.get(`${selectedResource.type}.${selectedResource.name}`);
  }, [selectedResource, cloudState]);

  const cloudAttributeRows = useMemo<DiffAttributeRow[]>(() => {
    if (!cloudResourceValues) return [];
    return Object.entries(cloudResourceValues)
      .filter(([, value]) => {
        if (value === undefined || value === null) return false;
        if (typeof value === "string" && value.trim() === "") return false;
        if (Array.isArray(value) && value.length === 0) return false;
        if (typeof value === "object" && !Array.isArray(value) && Object.keys(value as Record<string, unknown>).length === 0) return false;
        return true;
      })
      .map(([name, value]) => ({ name, value, status: "unchanged" as DiffAttributeStatus }));
  }, [cloudResourceValues]);

  useEffect(() => {
    if (!selectedResource) {
      setHclDraft("");
      return;
    }

    setHclDraft(buildHclFromResource(selectedResource));
  }, [selectedResource, inspectorProperties]);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;

      const newWidth =
        panelRef.current.getBoundingClientRect().right - e.clientX;

      setWidth(
        Math.max(RIGHT_PANEL_MIN_WIDTH, Math.min(RIGHT_PANEL_MAX_WIDTH, newWidth)),
      );
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

  useEffect(() => {
    setIsEditingName(false);
  }, [selectedNodeId]);

  useLayoutEffect(() => {
    onOverlayWidthChange?.(visible ? width : 0);
  }, [onOverlayWidthChange, visible, width]);

  useEffect(() => {
    onOverlayResizingChange?.(isResizing);
  }, [isResizing, onOverlayResizingChange]);

  const startEditingName = () => {
    if (!selectedResource) return;
    setNameInputValue(selectedResource.name);
    setIsEditingName(true);
  };

  const commitName = () => {
    const trimmed = nameInputValue.trim();
    if (trimmed && selectedResource) {
      onUpdateSelectedResource((resource) => ({ ...resource, name: trimmed }));
    }
    setIsEditingName(false);
  };

  const cancelEditingName = () => {
    setIsEditingName(false);
  };

  const startPanelResize = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    e.stopPropagation();
    document.body.style.userSelect = "none";
    document.body.style.cursor = "col-resize";
    setIsResizing(true);
  };

  const resizePanelWithKeyboard = (e: React.KeyboardEvent<HTMLButtonElement>) => {
    const step = e.shiftKey ? RIGHT_PANEL_KEYBOARD_FAST_STEP : RIGHT_PANEL_KEYBOARD_STEP;

    if (e.key === "ArrowLeft") {
      e.preventDefault();
      setWidth((current) => Math.min(RIGHT_PANEL_MAX_WIDTH, current + step));
      return;
    }

    if (e.key === "ArrowRight") {
      e.preventDefault();
      setWidth((current) => Math.max(RIGHT_PANEL_MIN_WIDTH, current - step));
      return;
    }

    if (e.key === "Home") {
      e.preventDefault();
      setWidth(RIGHT_PANEL_MIN_WIDTH);
      return;
    }

    if (e.key === "End") {
      e.preventDefault();
      setWidth(RIGHT_PANEL_MAX_WIDTH);
    }
  };

  return (
    <aside
      ref={panelRef}
      style={{ width: visible ? width : 0 }}
      className={`absolute right-0 top-0 z-30 flex h-full flex-col bg-white border-l border-slate-200 ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {visible && (
        <div className="absolute left-0 top-0 z-10 h-full w-3 -translate-x-1/2 cursor-col-resize">
          <button
            type="button"
            onMouseDown={startPanelResize}
            onKeyDown={resizePanelWithKeyboard}
            role="separator"
            aria-label={t("inspector.resizePanel")}
            aria-orientation="vertical"
            aria-valuemin={RIGHT_PANEL_MIN_WIDTH}
            aria-valuemax={RIGHT_PANEL_MAX_WIDTH}
            aria-valuenow={Math.round(width)}
            className={`group flex h-full w-full cursor-col-resize items-center justify-center rounded-full transition-colors focus:outline-none focus-visible:outline-none ${isResizing ? "bg-indigo-100" : "bg-slate-100/90 hover:bg-slate-200"}`}
          >
            <span
              aria-hidden="true"
              className={`h-12 w-[2px] rounded-full transition-colors ${isResizing ? "bg-indigo-500" : "bg-slate-400 group-hover:bg-slate-500"}`}
            />
          </button>
        </div>
      )}

      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible((v) => !v);
        }}
        className="absolute left-0 top-1/2 z-20 flex h-10 w-[1.125rem] -translate-x-full -translate-y-1/2 cursor-pointer items-center justify-center rounded-l-md border border-r-0 border-slate-200 bg-white shadow-sm transition-colors hover:bg-slate-50"
        type="button"
        aria-expanded={visible}
        aria-label={visible ? t("inspector.close") : t("inspector.open")}
      >
        <Icon
          icon="weui:arrow-filled"
          className={`text-slate-400 transition-transform ${visible ? "" : "rotate-180"}`}
          width={8}
          aria-hidden="true"
        />
      </button>

      <div className="overflow-hidden flex flex-col h-full w-full min-w-0">
          <div className="shrink-0 flex border-b border-slate-200 bg-white">
            {(["inspector", "history"] as RightPanelMode[]).map((mode) => {
              const isActive = activeMode === mode;
              const label = mode === "inspector" ? t("inspector.modeInspector") : t("inspector.modeHistory");
              const icon = mode === "inspector" ? "mdi:tune-variant" : "mdi:history";
              return (
                <button
                  key={mode}
                  type="button"
                  onClick={() => setActiveMode(mode)}
                  className={`flex flex-1 items-center justify-center gap-1.5 border-b-2 px-3 py-2.5 text-[0.6875rem] font-medium transition-colors ${
                    isActive
                      ? "border-slate-900 text-slate-900"
                      : "border-transparent text-slate-500 hover:text-slate-800"
                  }`}
                >
                  <Icon icon={icon} width={13} />
                  {label}
                </button>
              );
            })}
          </div>

          {activeMode === "history" && (
            <div className="flex-1 min-w-0 w-full overflow-hidden bg-slate-50/60">
              {projectDir && currentViewId ? (
                <HistoryTab
                  projectDir={projectDir}
                  currentViewId={currentViewId}
                  refreshSignal={historyRefreshSignal ?? 0}
                  onRestore={onRestoreFromHistory ?? (() => {})}
                />
              ) : (
                <div className="flex flex-col items-center gap-3 px-4 py-10 text-center">
                  <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-slate-100">
                    <Icon icon="mdi:history" className="text-slate-400" width={20} />
                  </div>
                  <p className="text-[0.75rem] text-slate-500">{t("inspector.openProjectForHistory")}</p>
                </div>
              )}
            </div>
          )}

          {activeMode === "inspector" && (<>
          <div className="shrink-0 border-b border-slate-200 bg-white">
            <div className="flex items-center gap-3 px-4 pt-3.5 pb-3">
              {selectedNode ? (
                <>
                  <div className="flex h-9 w-9 shrink-0 overflow-hidden rounded-lg bg-slate-100 ring-1 ring-slate-200">
                    <img
                      src={selectedNode.data.icon}
                      alt={selectedNode.data.label}
                      className="h-full w-full object-cover"
                      draggable={false}
                    />
                  </div>
                  <div className="min-w-0 flex-1">
                    {selectedResource && isEditingName && !diffMode && !cloudMode ? (
                      <input
                        ref={nameInputRef}
                        value={nameInputValue}
                        onChange={(e) => setNameInputValue(e.target.value)}
                        onBlur={commitName}
                        onKeyDown={(e) => {
                          if (e.key === "Enter") e.currentTarget.blur();
                          if (e.key === "Escape") cancelEditingName();
                        }}
                        autoFocus
                        className="w-full rounded-md border border-slate-300 bg-white px-1.5 py-0.5 text-[0.78125rem] font-semibold text-slate-900 focus:border-slate-300 focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 outline-none ring-0"
                      />
                    ) : (
                      <button
                        type="button"
                        onClick={selectedResource && !diffMode && !cloudMode ? startEditingName : undefined}
                        disabled={!selectedResource || diffMode || cloudMode}
                        className="group flex w-full items-center gap-1 text-left disabled:cursor-default"
                      >
                        <span className="truncate text-[0.78125rem] font-semibold text-slate-900">
                          {selectedResource?.name ?? selectedNode.data.label}
                        </span>
                        {selectedResource && !diffMode && !cloudMode && (
                          <Icon
                            icon="mdi:pencil-outline"
                            className="shrink-0 text-slate-300 opacity-0 transition-opacity group-hover:opacity-100"
                            width={11}
                          />
                        )}
                      </button>
                    )}
                    <div className="mt-0.5 flex items-center gap-1.5">
                      <span className="truncate font-mono text-[0.59375rem] text-slate-400">
                        {selectedNode.data.terraformType}
                      </span>
                      <span className={`shrink-0 rounded-full px-1.5 py-[1px] text-[0.53125rem] font-semibold ring-1 ${
                        selectedSchema?.terraformKind === "data"
                          ? "bg-emerald-50 text-emerald-700 ring-emerald-200"
                          : "bg-slate-100 text-slate-600 ring-slate-200"
                      }`}>
                        {selectedSchema?.terraformKind ?? "resource"}
                      </span>
                    </div>
                  </div>
                </>
              ) : (
                <div className="flex items-center gap-2.5">
                  <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-slate-100 ring-1 ring-slate-200">
                    <Icon icon="mdi:tune-variant" className="text-slate-400" width={18} />
                  </div>
                  <p className="text-[0.8125rem] font-semibold text-slate-800">{t("inspector.modeInspector")}</p>
                </div>
              )}
            </div>

            <div className="flex border-t border-slate-100 px-3">
              {(["info", "hcl"] as RightPanelTab[]).map((tab) => (
                <button
                  key={tab}
                  type="button"
                  onClick={() => setActiveTab(tab)}
                  className={`border-b-2 px-3 py-2 text-[0.6875rem] font-semibold transition-colors ${
                    activeTab === tab
                      ? "border-slate-900 text-slate-900"
                      : "border-transparent text-slate-400 hover:text-slate-700"
                  }`}
                >
                  {tab === "info" ? t("inspector.tab.info") : "HCL"}
                </button>
              ))}
            </div>
          </div>

          <div
            id="right-panel-content"
            className="flex-1 overflow-y-auto overflow-x-hidden bg-slate-50/60 py-3"
            style={{ scrollbarWidth: "thin", scrollbarColor: "#e2e8f0 transparent" }}
          >
            {activeTab === "info" && (!selectedNode || !selectedResource || !selectedSchema) && (
              <div className="mx-3 flex flex-col items-center gap-3 rounded-xl border border-dashed border-slate-200 px-4 py-10 text-center">
                <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-slate-100">
                  <Icon icon="mdi:cursor-default-click-outline" className="text-slate-400" width={22} />
                </div>
                <div>
                  <p className="text-[0.75rem] font-medium text-slate-600">{t("inspector.nothingSelected")}</p>
                  <p className="mt-0.5 text-[0.6875rem] text-slate-400">{t("inspector.nothingSelectedHint")}</p>
                </div>
              </div>
            )}

            {activeTab === "info" && selectedNode && selectedResource && selectedSchema && (
              <div className="space-y-3 px-3">
                {!diffMode && !cloudMode && selectedSchema.terraformType === "aws_subnet" && (
                  <div className="space-y-1.5">
                    <label className="block text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">{t("inspector.subnetType")}</label>
                    <button
                      type="button"
                      onClick={() => {
                        const isPublic = selectedResource.ui.icon === SUBNET_PUBLIC_ICON_PATH;
                        onUpdateSelectedResource((resource) => ({
                          ...resource,
                          ui: { ...resource.ui, icon: isPublic ? SUBNET_PRIVATE_ICON_PATH : SUBNET_PUBLIC_ICON_PATH },
                        }));
                      }}
                      className="w-full rounded-lg border border-slate-200 bg-white px-3 py-2 text-left text-[0.75rem] font-medium text-slate-700 shadow-sm transition-colors hover:border-indigo-300/60 hover:bg-indigo-50/20"
                    >
                      {selectedResource.ui.icon === SUBNET_PUBLIC_ICON_PATH ? t("inspector.publicSubnet") : t("inspector.privateSubnet")}
                    </button>
                  </div>
                )}

                {cloudMode ? (() => {
                  const groups = new Map<string, DiffAttributeRow[]>();
                  cloudAttributeRows.forEach((row) => {
                    const parts = row.name.split(".");
                    const sectionKey = parts.length > 1 ? parts.slice(0, -1).join(".") : "root";
                    if (!groups.has(sectionKey)) groups.set(sectionKey, []);
                    groups.get(sectionKey)!.push(row);
                  });
                  const sortedSections = Array.from(groups.entries()).sort(([a], [b]) => {
                    if (a === "root") return -1;
                    if (b === "root") return 1;
                    return a.localeCompare(b);
                  });

                  if (cloudAttributeRows.length === 0) {
                    const emptyMessage = cloudStateLoading
                      ? t("inspector.loadingCloud")
                      : !cloudStateAvailable
                        ? t("inspector.noStateFile")
                        : t("inspector.notInCloud");
                    return (
                      <div className="space-y-2">
                        <div className="rounded-xl border border-slate-200 bg-white p-3 shadow-sm">
                          <div className="mb-2.5 flex items-center justify-between">
                            <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">{t("inspector.cloudState")}</span>
                            <span className="text-[0.5625rem] text-slate-400">{t("inspector.activeCount", { count: 0 })}</span>
                          </div>
                          <p className="rounded-lg border border-dashed border-slate-200 px-3 py-4 text-center text-[0.6875rem] text-slate-400">
                            {emptyMessage}
                          </p>
                        </div>
                      </div>
                    );
                  }

                  return (
                    <div className="space-y-2">
                      {sortedSections.map(([sectionKey, rows]) => {
                        const sectionTitle = sectionKey === "root" ? t("inspector.mainAttributes") : t("inspector.block", { name: sectionKey });
                        return (
                          <div key={sectionKey} className="rounded-xl border border-slate-200 bg-white shadow-sm">
                            <div className="flex items-center gap-2 border-b border-slate-100 px-3 py-2">
                              <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400 break-words">
                                {sectionTitle}
                              </span>
                              <div className="h-px flex-1 bg-slate-100" />
                              <span className="text-[0.5625rem] tabular-nums text-slate-400">{rows.length}</span>
                            </div>

                            <div className="space-y-1.5 p-2">
                              {rows.map((row) => {
                                const fieldName = row.name.split(".").pop() ?? row.name;
                                const isCollection = Array.isArray(row.value) && row.value.every((it) => it && typeof it === "object" && !Array.isArray(it));

                                if (isCollection) {
                                  const entries = row.value as Array<Record<string, unknown>>;
                                  return (
                                    <div key={row.name} className="rounded-lg border border-slate-200 bg-slate-50 p-2.5">
                                      <div className="mb-2 flex items-start justify-between gap-2">
                                        <p className="text-[0.71875rem] font-semibold text-slate-800 break-all">{fieldName}</p>
                                      </div>
                                      <div className="space-y-1.5">
                                        {entries.map((entry, idx) => (
                                          <div key={idx} className="rounded-lg border border-slate-200 bg-white p-2">
                                            <div className="mb-1 text-[0.625rem] font-semibold text-slate-400">{t("inspector.entry", { number: idx + 1 })}</div>
                                            <div className="space-y-0.5">
                                              {Object.entries(entry).map(([k, v]) => (
                                                <div key={k} className="flex items-center gap-1.5">
                                                  <span className="w-[42%] shrink-0 truncate text-[0.625rem] text-slate-500" title={k}>{k}</span>
                                                  <span className="shrink-0 font-mono text-[0.625rem] text-slate-300">=</span>
                                                  <span className="w-[58%] truncate font-mono text-[0.625rem] text-slate-700" title={typeof v === "string" ? v : JSON.stringify(v)}>
                                                    {toHclLiteral(v)}
                                                  </span>
                                                </div>
                                              ))}
                                            </div>
                                          </div>
                                        ))}
                                      </div>
                                    </div>
                                  );
                                }

                                return (
                                  <div key={row.name} className="rounded-lg border border-slate-200 bg-slate-50/80 p-2.5">
                                    <div className="mb-1.5 flex items-start justify-between gap-2">
                                      <p className="text-[0.71875rem] font-semibold text-slate-800 break-all">{fieldName}</p>
                                    </div>
                                    <div className="rounded-md border border-slate-200 bg-white px-2 py-1.5 font-mono text-[0.6875rem] text-slate-700 break-all">
                                      {toHclLiteral(row.value)}
                                    </div>
                                  </div>
                                );
                              })}
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  );
                })() : diffMode ? (() => {
                  const statusBadge = (status: DiffAttributeStatus) => {
                    const cls =
                      status === "create"   ? "bg-emerald-50 text-emerald-700 ring-emerald-200" :
                      status === "change"   ? "bg-amber-50 text-amber-700 ring-amber-200" :
                      status === "destroy"  ? "bg-red-50 text-red-700 ring-red-200" :
                      null;
                    if (!cls) return null;
                    return (
                      <span className={`shrink-0 rounded-[4px] px-1.5 py-[1.5px] text-[0.5625rem] font-semibold ring-1 ${cls}`}>
                        {status}
                      </span>
                    );
                  };

                  const groups = new Map<string, DiffAttributeRow[]>();
                  diffAttributeRows.forEach((row) => {
                    const parts = row.name.split(".");
                    const sectionKey = parts.length > 1 ? parts.slice(0, -1).join(".") : "root";
                    if (!groups.has(sectionKey)) groups.set(sectionKey, []);
                    groups.get(sectionKey)!.push(row);
                  });
                  const sortedSections = Array.from(groups.entries()).sort(([a], [b]) => {
                    if (a === "root") return -1;
                    if (b === "root") return 1;
                    return a.localeCompare(b);
                  });

                  if (diffAttributeRows.length === 0) {
                    return (
                      <div className="rounded-xl border border-slate-200 bg-white p-3 shadow-sm">
                        <div className="mb-2.5 flex items-center justify-between">
                          <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">{t("inspector.diffAttributes")}</span>
                          <span className="text-[0.5625rem] text-slate-400">{t("inspector.activeCount", { count: 0 })}</span>
                        </div>
                        <p className="rounded-lg border border-dashed border-slate-200 px-3 py-4 text-center text-[0.6875rem] text-slate-400">
                          {t("inspector.noActiveAttrs")}
                        </p>
                      </div>
                    );
                  }

                  return (
                    <div className="space-y-2">
                      {sortedSections.map(([sectionKey, rows]) => {
                        const sectionTitle = sectionKey === "root" ? t("inspector.mainAttributes") : t("inspector.block", { name: sectionKey });
                        return (
                          <div key={sectionKey} className="rounded-xl border border-slate-200 bg-white shadow-sm">
                            <div className="flex items-center gap-2 border-b border-slate-100 px-3 py-2">
                              <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400 break-words">
                                {sectionTitle}
                              </span>
                              <div className="h-px flex-1 bg-slate-100" />
                              <span className="text-[0.5625rem] tabular-nums text-slate-400">{rows.length}</span>
                            </div>

                            <div className="space-y-1.5 p-2">
                              {rows.map((row) => {
                                const fieldName = row.name.split(".").pop() ?? row.name;
                                const isCollection = Array.isArray(row.value) && row.value.every((it) => it && typeof it === "object" && !Array.isArray(it));

                                if (isCollection) {
                                  const entries = row.value as Array<Record<string, unknown>>;
                                  return (
                                    <div key={row.name} className={`rounded-lg border p-2.5 ${row.status === "unchanged" ? "border-slate-100 bg-white opacity-60" : "border-slate-200 bg-slate-50"}`}>
                                      <div className="mb-2 flex items-start justify-between gap-2">
                                        <p className="text-[0.71875rem] font-semibold text-slate-800 break-all">{fieldName}</p>
                                        {statusBadge(row.status)}
                                      </div>
                                      <div className="space-y-1.5">
                                        {entries.map((entry, idx) => (
                                          <div key={idx} className="rounded-lg border border-slate-200 bg-white p-2">
                                            <div className="mb-1 text-[0.625rem] font-semibold text-slate-400">{t("inspector.entry", { number: idx + 1 })}</div>
                                            <div className="space-y-0.5">
                                              {Object.entries(entry).map(([k, v]) => (
                                                <div key={k} className="flex items-center gap-1.5">
                                                  <span className="w-[42%] shrink-0 truncate text-[0.625rem] text-slate-500" title={k}>{k}</span>
                                                  <span className="shrink-0 font-mono text-[0.625rem] text-slate-300">=</span>
                                                  <span className="w-[58%] truncate font-mono text-[0.625rem] text-slate-700" title={typeof v === "string" ? v : JSON.stringify(v)}>
                                                    {toHclLiteral(v)}
                                                  </span>
                                                </div>
                                              ))}
                                            </div>
                                          </div>
                                        ))}
                                      </div>
                                    </div>
                                  );
                                }

                                return (
                                  <div key={row.name} className={`rounded-lg border p-2.5 ${row.status === "unchanged" ? "border-slate-100 bg-white opacity-50" : "border-slate-200 bg-slate-50/80"}`}>
                                    <div className="mb-1.5 flex items-start justify-between gap-2">
                                      <p className="text-[0.71875rem] font-semibold text-slate-800 break-all">{fieldName}</p>
                                      {statusBadge(row.status)}
                                    </div>
                                    <div className="rounded-md border border-slate-200 bg-white px-2 py-1.5 font-mono text-[0.6875rem] text-slate-700 break-all">
                                      {toHclLiteral(row.value)}
                                    </div>
                                  </div>
                                );
                              })}
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  );
                })() : (
                <div className="space-y-2">
                  <div className="rounded-xl border border-slate-200 bg-white p-3 shadow-sm">
                    <div className="mb-2.5 flex items-center justify-between">
                      <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">{t("inspector.attributes")}</span>
                      <div className="flex items-center gap-1 text-[0.59375rem] text-slate-400">
                        <span className="font-semibold text-red-500">{attributeStats.required} {t("inspector.reqAbbrev")}</span>
                        <span>·</span>
                        <span>{attributeStats.optional} {t("inspector.optAbbrev")}</span>
                        <span>·</span>
                        <span>{attributeStats.total} {t("inspector.totalAbbrev")}</span>
                      </div>
                    </div>

                    <div className="relative mb-2.5">
                      <Icon icon="mdi:magnify" className="pointer-events-none absolute left-2.5 top-1/2 -translate-y-1/2 text-slate-400" width={13} />
                      <input
                        value={attributeSearch}
                        onChange={(event) => setAttributeSearch(event.target.value)}
                        placeholder={t("inspector.searchAttributes")}
                        className="w-full rounded-lg border border-slate-200 bg-slate-50 py-1.5 pl-8 pr-3 text-[0.6875rem] text-slate-700 placeholder-slate-400 transition-all focus:bg-white focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 outline-none ring-0"
                      />
                    </div>

                    <div className="flex flex-wrap gap-1.5">
                      {(["required", "optional", "computed"] as const).map((state) => {
                        const active = attributeStateFilters.includes(state);
                        const colors = {
                          required: active ? "border-red-200 bg-red-50 text-red-600" : "border-slate-200 bg-white text-slate-500 hover:border-slate-300",
                          optional: active ? "border-slate-300 bg-slate-100 text-slate-700" : "border-slate-200 bg-white text-slate-500 hover:border-slate-300",
                          computed: active ? "border-amber-200 bg-amber-50 text-amber-600" : "border-slate-200 bg-white text-slate-500 hover:border-slate-300",
                        };
                        return (
                          <button
                            key={state}
                            type="button"
                            onClick={() =>
                              setAttributeStateFilters((current) =>
                                current.includes(state) ? current.filter((v) => v !== state) : [...current, state],
                              )
                            }
                            className={`rounded-lg border px-2.5 py-1 text-[0.65625rem] font-semibold capitalize transition-colors ${colors[state]}`}
                          >
                            {t(`inspector.filter.${state}`)}
                          </button>
                        );
                      })}

                      <div className="relative">
                        <button
                          type="button"
                          onClick={() => setShowTypeMenu((v) => !v)}
                          className={`rounded-lg border px-2.5 py-1 text-[0.65625rem] font-semibold transition-colors ${
                            attributeTypeFilters.length > 0
                              ? "border-indigo-200 bg-indigo-50 text-indigo-600"
                              : "border-slate-200 bg-white text-slate-500 hover:border-slate-300"
                          }`}
                        >
                          {t("inspector.type")}{attributeTypeFilters.length > 0 ? ` (${attributeTypeFilters.length})` : ""}
                        </button>

                        {showTypeMenu && (
                          <div className="absolute right-0 z-20 mt-1 w-44 rounded-xl border border-slate-200 bg-white p-2.5 shadow-lg shadow-slate-200/60">
                            <div className="mb-2 flex items-center justify-between">
                              <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-500">{t("inspector.types")}</span>
                              <button
                                type="button"
                                onClick={() => setAttributeTypeFilters([])}
                                className="text-[0.625rem] font-medium text-indigo-500 hover:text-indigo-700"
                              >
                                {t("inspector.clear")}
                              </button>
                            </div>
                            <div className="max-h-44 space-y-1 overflow-auto">
                              {availableTypeOptions.map((typeOption) => (
                                <label key={typeOption} className="flex cursor-pointer items-center gap-2 rounded-md px-1.5 py-1 text-[0.6875rem] text-slate-600 hover:bg-slate-50">
                                    <input
                                    type="checkbox"
                                    checked={attributeTypeFilters.includes(typeOption)}
                                    onChange={() =>
                                      setAttributeTypeFilters((current) =>
                                        current.includes(typeOption) ? current.filter((v) => v !== typeOption) : [...current, typeOption],
                                      )
                                    }
                                    className="accent-indigo-500 focus:outline-none focus-visible:outline-none focus:ring-0"
                                  />
                                  <span className="break-all font-mono">{typeOption}</span>
                                </label>
                              ))}
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                  </div>

                  {filteredInspectorSections.map((section) => (
                    <div key={section.sectionKey} className="rounded-xl border border-slate-200 bg-white shadow-sm">
                      <div className="flex items-center gap-2 border-b border-slate-100 px-3 py-2">
                        <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400 break-words">
                          {section.sectionTitle}
                        </span>
                        <div className="h-px flex-1 bg-slate-100" />
                        <span className="text-[0.5625rem] tabular-nums text-slate-400">{section.properties.length}</span>
                      </div>

                      <div className="space-y-1.5 p-2">
                        {section.properties.map((property) => {
                          const currentValue = readNestedAttribute(
                            selectedResource.config.attributes ?? {},
                            property.name,
                          );
                          const isEditable = !property.computed || !!property.optional;

                          if (isObjectCollection(property.rawType) && isEditable) {
                            const entries = (Array.isArray(currentValue) ? currentValue : []) as Array<Record<string, unknown>>;
                            const objectFields = getObjectFields(property.rawType);
                            const fieldNames = Object.keys(objectFields);

                            const updateEntries = (next: Array<Record<string, unknown>>) =>
                              onUpdateSelectedResource((resource) => ({
                                ...resource,
                                config: { ...resource.config, attributes: { ...resource.config.attributes, [property.name]: next } },
                              }));

                            return (
                              <div key={property.name} className="rounded-lg border border-slate-200 bg-slate-50 p-2.5">
                                <div className="mb-2 flex items-start justify-between gap-2">
                                  <div className="min-w-0">
                                    <p className="text-[0.71875rem] font-semibold text-slate-800 break-all">{property.fieldName}</p>
                                    <p className="font-mono text-[0.59375rem] text-slate-400 break-all">{formatTypeLabel(property.rawType)}</p>
                                  </div>
                                  <div className="flex shrink-0 gap-1">
                                    <span className="rounded-[4px] bg-slate-100 px-1.5 py-[1.5px] text-[0.5625rem] font-semibold text-slate-500">{t("inspector.optional")}</span>
                                    {property.computed && (
                                      <span className="rounded-[4px] bg-amber-50 px-1.5 py-[1.5px] text-[0.5625rem] font-semibold text-amber-600">{t("inspector.computed")}</span>
                                    )}
                                  </div>
                                </div>

                                <div className="space-y-1.5">
                                  {entries.map((entry, entryIndex) => (
                                    <div key={entryIndex} className="rounded-lg border border-slate-200 bg-white p-2">
                                      <div className="mb-1.5 flex items-center justify-between">
                                        <span className="text-[0.625rem] font-semibold text-slate-400">{t("inspector.entry", { number: entryIndex + 1 })}</span>
                                        <button
                                          type="button"
                                          onClick={() => updateEntries(entries.filter((_, i) => i !== entryIndex))}
                                          className="text-[0.625rem] font-medium text-red-400 transition-colors hover:text-red-600"
                                        >
                                          {t("inspector.remove")}
                                        </button>
                                      </div>
                                      <div className="space-y-1">
                                        {fieldNames.map((fieldName) => (
                                          <div key={fieldName} className="flex items-center gap-1.5">
                                            <span className="w-[42%] shrink-0 truncate text-[0.625rem] text-slate-500" title={fieldName}>{fieldName}</span>
                                            <span className="shrink-0 font-mono text-[0.625rem] text-slate-300">=</span>
                                            <input
                                              value={displaySubFieldValue(entry[fieldName])}
                                              placeholder={renderSubFieldType(objectFields[fieldName])}
                                              onChange={(e) => {
                                                const parsed = parseInspectorInputValue(e.target.value);
                                                updateEntries(entries.map((ent, i) => i === entryIndex ? { ...ent, [fieldName]: parsed } : ent));
                                              }}
                                              className="w-[58%] rounded-md border border-slate-200 bg-white px-1.5 py-1 text-[0.625rem] text-slate-700 transition-all focus:outline-none focus:shadow-none focus:ring-0 focus:border-slate-200"
                                            />
                                          </div>
                                        ))}
                                      </div>
                                    </div>
                                  ))}
                                </div>

                                <button
                                  type="button"
                                  onClick={() => {
                                    const newEntry: Record<string, unknown> = {};
                                    fieldNames.forEach((k) => { newEntry[k] = null; });
                                    updateEntries([...entries, newEntry]);
                                  }}
                                  className="mt-1.5 w-full rounded-lg border border-dashed border-slate-300 py-1.5 text-[0.625rem] font-medium text-slate-400 transition-colors hover:border-indigo-300 hover:bg-indigo-50/30 hover:text-indigo-500"
                                >
                                  {t("inspector.addEntry")}
                                </button>
                              </div>
                            );
                          }

                          const displayValue = formatInspectorInputValue(currentValue);

                          return (
                            <div key={property.name} className={`rounded-lg border bg-slate-50/80 p-2.5 ${property.required ? "border-l-2 border-red-200 border-l-red-400" : "border-slate-200"}`}>
                              <div className="mb-1.5 flex items-start justify-between gap-2">
                                <div className="min-w-0">
                                  <p className="text-[0.71875rem] font-semibold text-slate-800 break-all">{property.fieldName}</p>
                                  <p className="font-mono text-[0.59375rem] text-slate-400 break-all">{formatTypeLabel(property.rawType)}</p>
                                </div>
                                <div className="flex shrink-0 gap-1">
                                  <span className={`rounded-[4px] px-1.5 py-[1.5px] text-[0.5625rem] font-semibold ${
                                    property.required ? "bg-red-50 text-red-600" : "bg-slate-100 text-slate-500"
                                  }`}>
                                    {property.required ? t("inspector.required") : t("inspector.optional")}
                                  </span>
                                  {property.computed && (
                                    <span className="rounded-[4px] bg-amber-50 px-1.5 py-[1.5px] text-[0.5625rem] font-semibold text-amber-600">
                                      {t("inspector.computed")}
                                    </span>
                                  )}
                                </div>
                              </div>

                              <div className="flex items-center gap-1.5">
                                <span className="shrink-0 font-mono text-[0.6875rem] text-slate-300">=</span>
                                <input
                                  disabled={!isEditable}
                                  value={displayValue}
                                  placeholder={getValuePlaceholder(property.rawType)}
                                  onDragOver={(event) => event.preventDefault()}
                                  onDrop={(event) => {
                                    event.preventDefault();
                                    const droppedValue =
                                      event.dataTransfer.getData(OBJECT_MAPPER_REF_MIME) ||
                                      event.dataTransfer.getData("text/plain") ||
                                      latestMapperDragPayload;
                                    const mapped = normalizeMappedReference(droppedValue, property.name, resources);
                                    onUpdateSelectedResource((resource) => ({
                                      ...resource,
                                      config: {
                                        ...resource.config,
                                        attributes: writeNestedAttribute(
                                          resource.config.attributes ?? {},
                                          property.name,
                                          mapped,
                                        ),
                                      },
                                    }));
                                  }}
                                  onChange={(event) => {
                                    const parsed = parseInspectorInputValue(event.target.value);
                                    const nextValue =
                                      typeof parsed === "string"
                                        ? normalizeMappedReference(parsed, property.name, resources)
                                        : parsed;
                                    onUpdateSelectedResource((resource) => ({
                                      ...resource,
                                      config: {
                                        ...resource.config,
                                        attributes: writeNestedAttribute(
                                          resource.config.attributes ?? {},
                                          property.name,
                                          nextValue,
                                        ),
                                      },
                                    }));
                                  }}
                                  className="w-full rounded-lg border border-slate-200 bg-white px-2.5 py-1.5 text-[0.6875rem] text-slate-800 transition-all outline-none ring-0 focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 focus:border-slate-200 disabled:cursor-not-allowed disabled:bg-slate-100 disabled:text-slate-400"
                                />
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  ))}

                  {filteredInspectorSections.length === 0 && (
                    <div className="rounded-xl border border-dashed border-slate-200 px-4 py-6 text-center">
                      <p className="text-[0.6875rem] text-slate-400">{t("inspector.noMatchingAttributes")}</p>
                    </div>
                  )}
                </div>
                )}

                {!diffMode && !cloudMode && selectedNode.data.isContainer && (
                  <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
                    <div className="flex items-center gap-2 border-b border-slate-100 px-3 py-2">
                      <span className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">
                        {(selectedNode.data.containerKind === "zone" || selectedNode.data.schemaId === "aws_availability_zone")
                          ? t("inspector.nodesInZone")
                          : t("inspector.children")}
                      </span>
                      <div className="h-px flex-1 bg-slate-100" />
                      <span className="text-[0.5625rem] tabular-nums text-slate-400">{children.length}</span>
                    </div>

                    <div className="space-y-1 p-2">
                      {children.length === 0 ? (
                        <p className="px-1 py-2 text-center text-[0.6875rem] text-slate-400">
                          {(selectedNode.data.containerKind === "zone" || selectedNode.data.schemaId === "aws_availability_zone")
                            ? t("inspector.noNodesInZone")
                            : t("inspector.noChildren")}
                        </p>
                      ) : (
                        children.map((child) => (
                          <button
                            key={child.id}
                            type="button"
                            onClick={() => onSelectNode(child.id)}
                            className="flex w-full items-center gap-2.5 rounded-lg border border-slate-200 bg-white px-2.5 py-2 text-left transition-colors hover:border-indigo-300/60 hover:bg-indigo-50/20"
                          >
                            <div className="flex h-6 w-6 shrink-0 overflow-hidden rounded-md bg-slate-100">
                              <img src={child.data.icon} alt={child.data.label} className="h-full w-full object-cover" draggable={false} />
                            </div>
                            <span className="text-[0.6875rem] font-medium text-slate-700">{child.data.label}</span>
                            <Icon icon="mdi:chevron-right" className="ml-auto text-slate-400" width={14} />
                          </button>
                        ))
                      )}
                    </div>
                  </div>
                )}
              </div>
            )}

            {activeTab === "hcl" && (
              <div className="flex h-full flex-col px-3">
                {(!selectedNode || !selectedResource || !selectedSchema) ? (
                  <div className="flex flex-col items-center gap-3 rounded-xl border border-dashed border-slate-200 px-4 py-10 text-center">
                    <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-slate-100">
                      <Icon icon="mdi:code-braces" className="text-slate-400" width={22} />
                    </div>
                    <p className="text-[0.6875rem] text-slate-400">{t("inspector.selectNodeForHcl")}</p>
                  </div>
                ) : cloudMode ? (
                  <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
                    <div className="border-b border-slate-100 px-3 py-2">
                      <p className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">{t("inspector.cloudHcl")}</p>
                    </div>
                    <div className="space-y-1 p-3 font-mono text-[0.6875rem] text-slate-700">
                      <div className="text-slate-600">
                        {`${selectedResource.kind ?? "resource"} \"${selectedResource.type}\" \"${selectedResource.name}\" {`}
                      </div>
                      {cloudAttributeRows.length === 0 ? (
                        <div className="px-2 py-1 text-slate-400">
                          {cloudStateLoading ? t("inspector.hclLoading") : t("inspector.hclNoStateData")}
                        </div>
                      ) : (
                        cloudAttributeRows.map((attribute) => (
                          <div key={attribute.name} className="flex items-start gap-2">
                            <span className="break-all">{`  ${attribute.name} = ${toHclLiteral(attribute.value)}`}</span>
                          </div>
                        ))
                      )}
                      <div className="text-slate-600">{"}"}</div>
                    </div>
                  </div>
                ) : diffMode ? (
                  <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
                    <div className="border-b border-slate-100 px-3 py-2">
                      <p className="text-[0.625rem] font-semibold uppercase tracking-widest text-slate-400">{t("inspector.diffHcl")}</p>
                    </div>
                    <div className="space-y-1 p-3 font-mono text-[0.6875rem] text-slate-700">
                      <div className="text-slate-600">
                        {`${selectedResource.kind ?? "resource"} \"${selectedResource.type}\" \"${selectedResource.name}\" {`}
                      </div>
                      {diffAttributeRows.map((attribute) => {
                        const statusClasses =
                          attribute.status === "create"   ? "bg-emerald-50 text-emerald-700 ring-emerald-200" :
                          attribute.status === "change"   ? "bg-amber-50 text-amber-700 ring-amber-200" :
                          attribute.status === "destroy"  ? "bg-red-50 text-red-700 ring-red-200" :
                          null;

                        return (
                          <div key={attribute.name} className={`flex items-start gap-2 ${attribute.status === "unchanged" ? "opacity-40" : ""}`}>
                            {statusClasses ? (
                              <span className={`mt-[1px] shrink-0 rounded-[4px] px-1.5 py-[1.5px] text-[0.5625rem] font-semibold ring-1 ${statusClasses}`}>
                                {attribute.status}
                              </span>
                            ) : (
                              <span className="mt-[1px] shrink-0 w-[2.375rem]" />
                            )}
                            <span className="break-all">{`  ${attribute.name} = ${toHclLiteral(attribute.value)}`}</span>
                          </div>
                        );
                      })}
                      <div className="text-slate-600">{"}"}</div>
                    </div>
                  </div>
                ) : (
                  <HclCodeArea
                    value={hclDraft}
                    onChange={(next) => {
                      if (!selectedResource) return;
                      const currentAttributes = selectedResource.config.attributes ?? {};
                      const allowedKeys = new Set([
                        ...Object.keys(currentAttributes),
                        ...inspectorProperties.map((p) => p.name),
                      ]);
                      const objectCollectionKeys = new Set(
                        inspectorProperties
                          .filter((p) => isObjectCollection(p.rawType))
                          .map((p) => p.name),
                      );
                      const parsedAttributes = parseHclAttributesForAllowedKeys(
                        next,
                        allowedKeys,
                        objectCollectionKeys,
                      );
                      const nextAttributes: Record<string, unknown> = { ...currentAttributes };

                      // Apply every key present in the parsed HCL.
                      Object.keys(parsedAttributes).forEach((key) => {
                        const val = parsedAttributes[key];
                        if (val === "" || val === null || val === undefined) {
                          delete nextAttributes[key];
                        } else {
                          nextAttributes[key] = val;
                        }
                      });

                      // Remove a dotted key only when its parent block IS represented
                      // in the parsed HCL but this specific field is missing — that's a
                      // user removing one field. If the whole block is absent from
                      // parsedAttributes, the parser likely failed to extract it
                      // (deep nesting, etc.); preserve the value rather than destroy data.
                      Object.keys(currentAttributes).forEach((key) => {
                        if (!key.includes(".")) return;
                        const prefix = key.split(".").slice(0, -1).join(".");
                        const blockHasAnyParsedField = Object.keys(parsedAttributes).some(
                          (k) => k.startsWith(`${prefix}.`),
                        );
                        const fieldIsParsed = Object.prototype.hasOwnProperty.call(
                          parsedAttributes,
                          key,
                        );
                        if (blockHasAnyParsedField && !fieldIsParsed) {
                          delete nextAttributes[key];
                        }
                      });

                      // Clear object-collection arrays that are no longer present in the HCL.
                      objectCollectionKeys.forEach((key) => {
                        if (
                          Object.prototype.hasOwnProperty.call(currentAttributes, key) &&
                          !Object.prototype.hasOwnProperty.call(parsedAttributes, key)
                        ) {
                          delete nextAttributes[key];
                        }
                      });

                      const nextResource: TerraformResource = {
                        ...selectedResource,
                        config: { ...selectedResource.config, attributes: nextAttributes },
                      };
                      setHclDraft(buildHclFromResource(nextResource));
                      onUpdateSelectedResource(() => nextResource);
                    }}
                    containerClassName="h-[65vh] rounded-xl border border-slate-200 bg-[#0b1120] shadow-sm"
                    innerClassName="p-2 font-mono text-xs"
                  />
                )}
              </div>
            )}
          </div>
          </>)}
        </div>
    </aside>
  );
};
