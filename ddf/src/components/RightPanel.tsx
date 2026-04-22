import { useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";
import { HclCodeArea } from "./HclCodeArea";
import { Icon } from "@iconify/react";
import type { Node } from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";

import type { TerraformResource } from "../models/terraform";
import { NODE_SCHEMAS, type TerraformNodeSchema } from "../models/nodeRegistry";
import {
  SUBNET_PRIVATE_ICON_PATH,
  SUBNET_PUBLIC_ICON_PATH,
} from "../models/iconRegistry";
import {
  getInspectorPropertiesForSchema,
  type InspectorProperty,
} from "../commands/schemaInspector";

type RightPanelTab = "info" | "hcl";

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
  onOverlayWidthChange?: (width: number) => void;
  onOverlayResizingChange?: (isResizing: boolean) => void;
};

const OBJECT_MAPPER_REF_MIME = "application/x-ddf-object-mapper-ref";
const BOTTOM_PANEL_CHANNEL = "ddf-bottompanel-sync";
let latestMapperDragPayload = "";

const terraformRefPattern = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;
const INVALID_HCL_VALUE = Symbol("invalid-hcl-value");
const RIGHT_PANEL_MIN_WIDTH = 350;
const RIGHT_PANEL_MAX_WIDTH = 600;
const RIGHT_PANEL_KEYBOARD_STEP = 12;
const RIGHT_PANEL_KEYBOARD_FAST_STEP = 32;

const sanitizeLooseQuotedString = (raw: string): string => {
  let value = raw.trim();
  if (!value) return "";

  value = value.replace(/^\\+"+/, "");
  value = value.replace(/\\+"+$/, "");
  value = value.replace(/^"+/, "");
  value = value.replace(/"+$/, "");

  return value;
};

const normalizeMappedReference = (
  rawValue: string,
  targetPropertyName: string,
  resources: TerraformResource[],
) => {
  const value = rawValue.trim();
  if (!value) return value;
  if (terraformRefPattern.test(value) || value.startsWith("var.")) {
    return value;
  }

  const match = value.match(/^([a-zA-Z0-9_-]+)\.([a-zA-Z0-9_]+)(?:\.([a-zA-Z0-9_]+))?$/);
  if (!match) return value;

  const [, schemaOrType, resourceName, explicitAttr] = match;
  const schema = NODE_SCHEMAS.find(
    (candidate) =>
      candidate.id.toLowerCase() === schemaOrType.toLowerCase() ||
      candidate.terraformType.toLowerCase() === schemaOrType.toLowerCase(),
  );

  if (!schema) return value;

  const resource = resources.find(
    (candidate) =>
      candidate.name === resourceName &&
      (candidate.schemaId === schema.id || candidate.type === schema.terraformType),
  );

  if (!resource) return value;

  const attr = explicitAttr ?? (targetPropertyName.endsWith("_id") ? "id" : "id");
  const prefix = resource.kind === "data" ? "data." : "";
  return `${prefix}${schema.terraformType}.${resource.name}.${attr}`;
};

const parseHclValueToAttribute = (input: string): unknown | typeof INVALID_HCL_VALUE => {
  const trimmed = input.trim();
  if (!trimmed) return "";
  if (trimmed === "null") return null;
  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(trimmed)) return Number(trimmed);
  if (trimmed.includes('"') && !(trimmed.startsWith('"') && trimmed.endsWith('"'))) {
    return INVALID_HCL_VALUE;
  }
  if (trimmed.startsWith('"') && trimmed.endsWith('"')) {
    try {
      const parsed = JSON.parse(trimmed);
      return typeof parsed === "string" ? sanitizeLooseQuotedString(parsed) : parsed;
    } catch {
      return sanitizeLooseQuotedString(trimmed.slice(1, -1));
    }
  }
  return sanitizeLooseQuotedString(trimmed);
};

const parseHclAttributesForAllowedKeys = (
  hcl: string,
  allowedKeys: Set<string>,
): Record<string, unknown> => {
  const attributes: Record<string, unknown> = {};
  const lines = hcl.split("\n");

  lines.forEach((line) => {
    const trimmed = line.trim();
    if (
      !trimmed ||
      trimmed.startsWith("#") ||
      trimmed.startsWith("//") ||
      trimmed.startsWith("resource ") ||
      trimmed.startsWith("data ") ||
      trimmed === "{" ||
      trimmed === "}"
    ) {
      return;
    }

    const simpleAssignment = trimmed.match(/^([a-zA-Z0-9_.-]+)\s*=\s*(.*)$/);
    if (!simpleAssignment) return;

    const [, key, rawValue] = simpleAssignment;
    if (!allowedKeys.has(key)) return;
    const parsed = parseHclValueToAttribute(rawValue);
    if (parsed === INVALID_HCL_VALUE) return;
    attributes[key] = parsed;
  });

  return attributes;
};

const parseInspectorInputValue = (input: string): unknown => {
  const trimmed = input.trim();
  if (trimmed === "") return "";
  if (trimmed === "null") return null;
  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(trimmed)) return Number(trimmed);
  if (trimmed.startsWith('"') && trimmed.endsWith('"')) {
    try {
      const parsed = JSON.parse(trimmed);
      return typeof parsed === "string" ? sanitizeLooseQuotedString(parsed) : parsed;
    } catch {
      return sanitizeLooseQuotedString(trimmed.slice(1, -1));
    }
  }
  return sanitizeLooseQuotedString(trimmed);
};

const formatInspectorInputValue = (value: unknown): string => {
  if (value === undefined || value === null) return "";
  if (typeof value === "string") {
    return sanitizeLooseQuotedString(value);
  }
  if (Array.isArray(value)) return JSON.stringify(value);
  if (typeof value === "object") return JSON.stringify(value);
  return String(value);
};

const toHclLiteral = (value: unknown): string => {
  if (value === null || value === undefined) return "null";
  if (typeof value === "boolean" || typeof value === "number") return String(value);
  if (Array.isArray(value)) {
    if (value.length === 0) return "[]";
    if (value.every((item) => typeof item === "object" && item !== null && !Array.isArray(item))) {
      const entries = (value as Array<Record<string, unknown>>).map((item) => {
        const fields = Object.entries(item)
          .filter(([, v]) => v !== undefined)
          .map(([k, v]) => `      ${k} = ${toHclLiteral(v)}`)
          .join("\n");
        return `    {\n${fields}\n    }`;
      });
      return `[\n${entries.join(",\n")}\n  ]`;
    }
    return `[${value.map(toHclLiteral).join(", ")}]`;
  }
  if (typeof value === "string") {
    const trimmed = sanitizeLooseQuotedString(value);
    if (terraformRefPattern.test(trimmed) || trimmed.startsWith("var.")) return trimmed;
    if (
      trimmed === "true" || trimmed === "false" ||
      /^-?\d+(\.\d+)?$/.test(trimmed) ||
      (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
      (trimmed.startsWith("{") && trimmed.endsWith("}"))
    ) return trimmed;
    return JSON.stringify(trimmed);
  }
  return JSON.stringify(String(value));
};

// Returns true for set(object({...})) and list(object({...})) types —
// these are rendered as attribute-as-blocks lists, not simple scalars.
const isObjectCollection = (rawType: unknown): boolean => {
  if (!Array.isArray(rawType) || rawType.length < 2) return false;
  const [container, inner] = rawType as [unknown, unknown];
  if (container !== "set" && container !== "list") return false;
  return Array.isArray(inner) && inner[0] === "object";
};

// Returns the field-name → raw-type map for the object inside the collection.
const getObjectFields = (rawType: unknown): Record<string, unknown> => {
  if (!Array.isArray(rawType) || rawType.length < 2) return {};
  const inner = rawType[1] as unknown[];
  if (!Array.isArray(inner) || inner.length < 2 || inner[0] !== "object") return {};
  return (inner[1] as Record<string, unknown>) ?? {};
};

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

const buildHclFromResource = (resource: TerraformResource) => {
  const blockKind = resource.kind ?? "resource";
  const header = `${blockKind} "${resource.type}" "${resource.name}" {`;
  const attrs = resource.config.attributes ?? {};
  const lines = Object.entries(attrs)
    .filter(([, value]) =>
      value !== "" && value !== undefined && value !== null &&
      !(Array.isArray(value) && value.length === 0),
    )
    .map(([key, value]) => `  ${key} = ${toHclLiteral(value)}`);

  return [header, ...lines, "}"].join("\n");
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
  onOverlayWidthChange,
  onOverlayResizingChange,
}: RightPanelProps) => {
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const [activeTab, setActiveTab] = useState<RightPanelTab>("info");
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
              ? "Atributos principales"
              : `Bloque: ${sectionKey}`,
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
  }, [inspectorProperties]);

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
      {/* Resize handle */}
      {visible && (
        <div className="absolute left-0 top-0 z-10 h-full w-3 -translate-x-1/2 cursor-col-resize">
          <button
            type="button"
            onMouseDown={startPanelResize}
            onKeyDown={resizePanelWithKeyboard}
            role="separator"
            aria-label="Resize inspector panel"
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

      {/* Toggle button */}
      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible((v) => !v);
        }}
        className="absolute left-0 top-1/2 z-20 flex h-10 w-[18px] -translate-x-full -translate-y-1/2 cursor-pointer items-center justify-center rounded-l-md border border-r-0 border-slate-200 bg-white shadow-sm transition-colors hover:bg-slate-50"
        type="button"
        aria-expanded={visible}
        aria-label={visible ? "Close inspector" : "Open inspector"}
      >
        <Icon
          icon="weui:arrow-filled"
          className={`text-slate-400 transition-transform ${visible ? "" : "rotate-180"}`}
          width={8}
          aria-hidden="true"
        />
      </button>

      <div className="overflow-hidden flex flex-col h-full w-full min-w-0">
          {/* Header */}
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
                    {selectedResource && isEditingName ? (
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
                        className="w-full rounded-md border border-slate-300 bg-white px-1.5 py-0.5 text-[12.5px] font-semibold text-slate-900 focus:border-slate-300 focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 outline-none ring-0"
                      />
                    ) : (
                      <button
                        type="button"
                        onClick={selectedResource ? startEditingName : undefined}
                        disabled={!selectedResource}
                        className="group flex w-full items-center gap-1 text-left disabled:cursor-default"
                      >
                        <span className="truncate text-[12.5px] font-semibold text-slate-900">
                          {selectedResource?.name ?? selectedNode.data.label}
                        </span>
                        {selectedResource && (
                          <Icon
                            icon="mdi:pencil-outline"
                            className="shrink-0 text-slate-300 opacity-0 transition-opacity group-hover:opacity-100"
                            width={11}
                          />
                        )}
                      </button>
                    )}
                    <div className="mt-0.5 flex items-center gap-1.5">
                      <span className="truncate font-mono text-[9.5px] text-slate-400">
                        {selectedNode.data.terraformType}
                      </span>
                      <span className={`shrink-0 rounded-full px-1.5 py-[1px] text-[8.5px] font-semibold ring-1 ${
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
                    <Icon icon="mdi:inspector" className="text-slate-400" width={18} />
                  </div>
                  <p className="text-[13px] font-semibold text-slate-800">Inspector</p>
                </div>
              )}
            </div>

            {/* Tabs */}
            <div className="flex border-t border-slate-100 px-3">
              {(["info", "hcl"] as RightPanelTab[]).map((tab) => (
                <button
                  key={tab}
                  type="button"
                  onClick={() => setActiveTab(tab)}
                  className={`border-b-2 px-3 py-2 text-[11px] font-semibold transition-colors ${
                    activeTab === tab
                      ? "border-slate-900 text-slate-900"
                      : "border-transparent text-slate-400 hover:text-slate-700"
                  }`}
                >
                  {tab === "info" ? "Info" : "HCL"}
                </button>
              ))}
            </div>
          </div>

          {/* Scrollable content */}
          <div
            id="right-panel-content"
            className="flex-1 overflow-y-auto overflow-x-hidden bg-slate-50/60 py-3"
            style={{ scrollbarWidth: "thin", scrollbarColor: "#e2e8f0 transparent" }}
          >
            {/* Empty state */}
            {(!selectedNode || !selectedResource || !selectedSchema) && (
              <div className="mx-3 flex flex-col items-center gap-3 rounded-xl border border-dashed border-slate-200 px-4 py-10 text-center">
                <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-slate-100">
                  <Icon icon="mdi:cursor-default-click-outline" className="text-slate-400" width={22} />
                </div>
                <div>
                  <p className="text-[12px] font-medium text-slate-600">Nothing selected</p>
                  <p className="mt-0.5 text-[11px] text-slate-400">Click a node on the canvas to inspect it</p>
                </div>
              </div>
            )}

            {/* INFO TAB */}
            {activeTab === "info" && selectedNode && selectedResource && selectedSchema && (
              <div className="space-y-3 px-3">
                {/* Subnet toggle */}
                {selectedSchema.terraformType === "aws_subnet" && (
                  <div className="space-y-1.5">
                    <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400">Subnet type</label>
                    <button
                      type="button"
                      onClick={() => {
                        const isPublic = selectedResource.ui.icon === SUBNET_PUBLIC_ICON_PATH;
                        onUpdateSelectedResource((resource) => ({
                          ...resource,
                          ui: { ...resource.ui, icon: isPublic ? SUBNET_PRIVATE_ICON_PATH : SUBNET_PUBLIC_ICON_PATH },
                        }));
                      }}
                      className="w-full rounded-lg border border-slate-200 bg-white px-3 py-2 text-left text-[12px] font-medium text-slate-700 shadow-sm transition-colors hover:border-indigo-300/60 hover:bg-indigo-50/20"
                    >
                      {selectedResource.ui.icon === SUBNET_PUBLIC_ICON_PATH ? "Public subnet" : "Private subnet"}
                    </button>
                  </div>
                )}

                {/* Attributes section */}
                <div className="space-y-2">
                  {/* Filters bar */}
                  <div className="rounded-xl border border-slate-200 bg-white p-3 shadow-sm">
                    <div className="mb-2.5 flex items-center justify-between">
                      <span className="text-[10px] font-semibold uppercase tracking-widest text-slate-400">Attributes</span>
                      <div className="flex items-center gap-1 text-[9.5px] text-slate-400">
                        <span className="font-semibold text-red-500">{attributeStats.required} req</span>
                        <span>·</span>
                        <span>{attributeStats.optional} opt</span>
                        <span>·</span>
                        <span>{attributeStats.total} total</span>
                      </div>
                    </div>

                    <div className="relative mb-2.5">
                      <Icon icon="mdi:magnify" className="pointer-events-none absolute left-2.5 top-1/2 -translate-y-1/2 text-slate-400" width={13} />
                      <input
                        value={attributeSearch}
                        onChange={(event) => setAttributeSearch(event.target.value)}
                        placeholder="Search attributes…"
                        className="w-full rounded-lg border border-slate-200 bg-slate-50 py-1.5 pl-8 pr-3 text-[11px] text-slate-700 placeholder-slate-400 transition-all focus:bg-white focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 outline-none ring-0"
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
                            className={`rounded-lg border px-2.5 py-1 text-[10.5px] font-semibold capitalize transition-colors ${colors[state]}`}
                          >
                            {state}
                          </button>
                        );
                      })}

                      <div className="relative">
                        <button
                          type="button"
                          onClick={() => setShowTypeMenu((v) => !v)}
                          className={`rounded-lg border px-2.5 py-1 text-[10.5px] font-semibold transition-colors ${
                            attributeTypeFilters.length > 0
                              ? "border-indigo-200 bg-indigo-50 text-indigo-600"
                              : "border-slate-200 bg-white text-slate-500 hover:border-slate-300"
                          }`}
                        >
                          Type{attributeTypeFilters.length > 0 ? ` (${attributeTypeFilters.length})` : ""}
                        </button>

                        {showTypeMenu && (
                          <div className="absolute right-0 z-20 mt-1 w-44 rounded-xl border border-slate-200 bg-white p-2.5 shadow-lg shadow-slate-200/60">
                            <div className="mb-2 flex items-center justify-between">
                              <span className="text-[10px] font-semibold uppercase tracking-widest text-slate-500">Types</span>
                              <button
                                type="button"
                                onClick={() => setAttributeTypeFilters([])}
                                className="text-[10px] font-medium text-indigo-500 hover:text-indigo-700"
                              >
                                Clear
                              </button>
                            </div>
                            <div className="max-h-44 space-y-1 overflow-auto">
                              {availableTypeOptions.map((typeOption) => (
                                <label key={typeOption} className="flex cursor-pointer items-center gap-2 rounded-md px-1.5 py-1 text-[11px] text-slate-600 hover:bg-slate-50">
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

                  {/* Property sections */}
                  {filteredInspectorSections.map((section) => (
                    <div key={section.sectionKey} className="rounded-xl border border-slate-200 bg-white shadow-sm">
                      <div className="flex items-center gap-2 border-b border-slate-100 px-3 py-2">
                        <span className="text-[10px] font-semibold uppercase tracking-widest text-slate-400 break-words">
                          {section.sectionTitle}
                        </span>
                        <div className="h-px flex-1 bg-slate-100" />
                        <span className="text-[9px] tabular-nums text-slate-400">{section.properties.length}</span>
                      </div>

                      <div className="space-y-1.5 p-2">
                        {section.properties.map((property) => {
                          const currentValue = selectedResource.config.attributes[property.name];
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
                                    <p className="text-[11.5px] font-semibold text-slate-800 break-all">{property.fieldName}</p>
                                    <p className="font-mono text-[9.5px] text-slate-400">{property.type}</p>
                                  </div>
                                  <div className="flex shrink-0 gap-1">
                                    <span className="rounded-[4px] bg-slate-100 px-1.5 py-[1.5px] text-[9px] font-semibold text-slate-500">optional</span>
                                    {property.computed && (
                                      <span className="rounded-[4px] bg-amber-50 px-1.5 py-[1.5px] text-[9px] font-semibold text-amber-600">computed</span>
                                    )}
                                  </div>
                                </div>

                                <div className="space-y-1.5">
                                  {entries.map((entry, entryIndex) => (
                                    <div key={entryIndex} className="rounded-lg border border-slate-200 bg-white p-2">
                                      <div className="mb-1.5 flex items-center justify-between">
                                        <span className="text-[10px] font-semibold text-slate-400">Entry {entryIndex + 1}</span>
                                        <button
                                          type="button"
                                          onClick={() => updateEntries(entries.filter((_, i) => i !== entryIndex))}
                                          className="text-[10px] font-medium text-red-400 transition-colors hover:text-red-600"
                                        >
                                          Remove
                                        </button>
                                      </div>
                                      <div className="space-y-1">
                                        {fieldNames.map((fieldName) => (
                                          <div key={fieldName} className="flex items-center gap-1.5">
                                            <span className="w-[42%] shrink-0 truncate text-[10px] text-slate-500" title={fieldName}>{fieldName}</span>
                                            <span className="shrink-0 font-mono text-[10px] text-slate-300">=</span>
                                            <input
                                              value={displaySubFieldValue(entry[fieldName])}
                                              placeholder={renderSubFieldType(objectFields[fieldName])}
                                              onChange={(e) => {
                                                const parsed = parseInspectorInputValue(e.target.value);
                                                updateEntries(entries.map((ent, i) => i === entryIndex ? { ...ent, [fieldName]: parsed } : ent));
                                              }}
                                              className="w-[58%] rounded-md border border-slate-200 bg-white px-1.5 py-1 text-[10px] text-slate-700 transition-all focus:outline-none focus:shadow-none focus:ring-0 focus:border-slate-200"
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
                                  className="mt-1.5 w-full rounded-lg border border-dashed border-slate-300 py-1.5 text-[10px] font-medium text-slate-400 transition-colors hover:border-indigo-300 hover:bg-indigo-50/30 hover:text-indigo-500"
                                >
                                  + Add entry
                                </button>
                              </div>
                            );
                          }

                          const displayValue = formatInspectorInputValue(currentValue);

                          return (
                            <div key={property.name} className={`rounded-lg border bg-slate-50/80 p-2.5 ${property.required ? "border-l-2 border-red-200 border-l-red-400" : "border-slate-200"}`}>
                              <div className="mb-1.5 flex items-start justify-between gap-2">
                                <div className="min-w-0">
                                  <p className="text-[11.5px] font-semibold text-slate-800 break-all">{property.fieldName}</p>
                                  <p className="font-mono text-[9.5px] text-slate-400">{property.type}</p>
                                </div>
                                <div className="flex shrink-0 gap-1">
                                  <span className={`rounded-[4px] px-1.5 py-[1.5px] text-[9px] font-semibold ${
                                    property.required ? "bg-red-50 text-red-600" : "bg-slate-100 text-slate-500"
                                  }`}>
                                    {property.required ? "required" : "optional"}
                                  </span>
                                  {property.computed && (
                                    <span className="rounded-[4px] bg-amber-50 px-1.5 py-[1.5px] text-[9px] font-semibold text-amber-600">
                                      computed
                                    </span>
                                  )}
                                </div>
                              </div>

                              <div className="flex items-center gap-1.5">
                                <span className="shrink-0 font-mono text-[11px] text-slate-300">=</span>
                                <input
                                  disabled={!isEditable}
                                  value={displayValue}
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
                                      config: { ...resource.config, attributes: { ...resource.config.attributes, [property.name]: mapped } },
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
                                      config: { ...resource.config, attributes: { ...resource.config.attributes, [property.name]: nextValue } },
                                    }));
                                  }}
                                  className="w-full rounded-lg border border-slate-200 bg-white px-2.5 py-1.5 text-[11px] text-slate-800 transition-all outline-none ring-0 focus:outline-none focus-visible:outline-none focus:shadow-none focus:ring-0 focus:border-slate-200 disabled:cursor-not-allowed disabled:bg-slate-100 disabled:text-slate-400"
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
                      <p className="text-[11px] text-slate-400">No attributes match the current filters</p>
                    </div>
                  )}
                </div>

                {/* Children / zone nodes */}
                {selectedNode.data.isContainer && (
                  <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
                    <div className="flex items-center gap-2 border-b border-slate-100 px-3 py-2">
                      <span className="text-[10px] font-semibold uppercase tracking-widest text-slate-400">
                        {(selectedNode.data.containerKind === "zone" || selectedNode.data.schemaId === "aws_availability_zone")
                          ? "Nodes in zone"
                          : "Children"}
                      </span>
                      <div className="h-px flex-1 bg-slate-100" />
                      <span className="text-[9px] tabular-nums text-slate-400">{children.length}</span>
                    </div>

                    <div className="space-y-1 p-2">
                      {children.length === 0 ? (
                        <p className="px-1 py-2 text-center text-[11px] text-slate-400">
                          {(selectedNode.data.containerKind === "zone" || selectedNode.data.schemaId === "aws_availability_zone")
                            ? "No nodes inside this zone"
                            : "No children in this container"}
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
                            <span className="text-[11px] font-medium text-slate-700">{child.data.label}</span>
                            <Icon icon="mdi:chevron-right" className="ml-auto text-slate-400" width={14} />
                          </button>
                        ))
                      )}
                    </div>
                  </div>
                )}
              </div>
            )}

            {/* HCL TAB */}
            {activeTab === "hcl" && (
              <div className="flex h-full flex-col px-3">
                {(!selectedNode || !selectedResource || !selectedSchema) ? (
                  <div className="flex flex-col items-center gap-3 rounded-xl border border-dashed border-slate-200 px-4 py-10 text-center">
                    <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-slate-100">
                      <Icon icon="mdi:code-braces" className="text-slate-400" width={22} />
                    </div>
                    <p className="text-[11px] text-slate-400">Select a node to view its HCL</p>
                  </div>
                ) : (
                  <HclCodeArea
                    value={hclDraft}
                    onChange={(next) => {
                      if (!selectedResource) return;
                      const currentAttributes = selectedResource.config.attributes ?? {};
                      const allowedKeys = new Set(Object.keys(currentAttributes));
                      const parsedAllowedAttributes = parseHclAttributesForAllowedKeys(next, allowedKeys);
                      const nextAttributes: Record<string, unknown> = { ...currentAttributes };
                      Object.keys(currentAttributes).forEach((key) => {
                        if (Object.prototype.hasOwnProperty.call(parsedAllowedAttributes, key)) {
                          nextAttributes[key] = parsedAllowedAttributes[key];
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
        </div>
    </aside>
  );
};
