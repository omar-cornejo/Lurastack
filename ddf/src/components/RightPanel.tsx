import { useEffect, useMemo, useRef, useState } from "react";
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
};

const OBJECT_MAPPER_REF_MIME = "application/x-ddf-object-mapper-ref";
const BOTTOM_PANEL_CHANNEL = "ddf-bottompanel-sync";
let latestMapperDragPayload = "";

const terraformRefPattern = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;
const INVALID_HCL_VALUE = Symbol("invalid-hcl-value");

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

      const minWidth = 200;
      const maxWidth = 600;

      if (newWidth >= minWidth && newWidth <= maxWidth) {
        setWidth(newWidth);
      }
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
      style={{ width: visible ? width : 12 }}
      className={`relative bg-gray-100 border-l flex-none
    ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {visible && (
        <div
          onMouseDown={(e) => {
            e.preventDefault();
            document.body.style.userSelect = "none";
            document.body.style.cursor = "col-resize";
            setIsResizing(true);
          }}
          className="absolute left-0 top-0 h-full w-1 cursor-col-resize bg-transparent hover:bg-gray-300"
        />
      )}

      {visible && (
        <div className="px-2 pt-2 pb-1 flex items-center justify-between border-b border-gray-200">
          <strong className="text-sm text-gray-800">Inspector</strong>
          <div className="flex gap-1">
            <button
              type="button"
              onClick={() => setActiveTab("info")}
              className={`px-2 py-1 rounded-t text-xs border-b-2 ${
                activeTab === "info"
                  ? "border-blue-500 text-blue-600 bg-white"
                  : "border-transparent text-gray-500 hover:text-gray-700"
              }`}
            >
              Info
            </button>
            <button
              type="button"
              onClick={() => setActiveTab("hcl")}
              className={`px-2 py-1 rounded-t text-xs border-b-2 ${
                activeTab === "hcl"
                  ? "border-blue-500 text-blue-600 bg-white"
                  : "border-transparent text-gray-500 hover:text-gray-700"
              }`}
            >
              HCL
            </button>
          </div>
        </div>
      )}

      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible((v) => !v);
        }}
        className="absolute left-0 top-1/2 transform -translate-x-1/2 -translate-y-1/2 px-2 py-1 bg-gray-200 rounded z-10 flex items-center justify-center"
        type="button"
      >
        <Icon
          icon="weui:arrow-filled"
          className={`transition-transform ${visible ? "" : "rotate-180"}`}
          width={10}
          height={18}
        />
      </button>

      {visible && (
        <div id="right-panel-content" className="p-2 h-full overflow-auto">
          {!selectedNode || !selectedResource || !selectedSchema ? (
            <div className="rounded border border-dashed border-gray-300 p-3 text-xs text-gray-500">
              Select a node in the canvas to inspect and edit its configuration.
            </div>
          ) : null}

          {activeTab === "info" && (
            <div className="space-y-3 text-sm text-gray-800">
              {selectedNode && selectedResource && selectedSchema && (
                <>
                  <div className="rounded border border-gray-200 bg-white p-2 text-xs">
                    <div><span className="font-semibold">Node:</span> {selectedNode.data.label}</div>
                    <div><span className="font-semibold">Type:</span> {selectedSchema.terraformType}</div>
                    <div><span className="font-semibold">Kind:</span> {selectedSchema.terraformKind}</div>
                  </div>

                  <div className="space-y-2">
                    <label className="block text-xs font-medium text-gray-600">Resource name</label>
                    <input
                      value={selectedResource.name}
                      onChange={(event) => {
                        const name = event.target.value;
                        onUpdateSelectedResource((resource) => ({
                          ...resource,
                          name,
                        }));
                      }}
                      className="w-full rounded border border-gray-300 bg-white px-2 py-1 text-xs"
                    />
                  </div>

                  {selectedSchema.terraformType === "aws_subnet" ? (
                    <div className="space-y-2">
                      <label className="block text-xs font-medium text-gray-600">Subnet visual type</label>
                      <button
                        type="button"
                        onClick={() => {
                          const isPublic = selectedResource.ui.icon === SUBNET_PUBLIC_ICON_PATH;
                          onUpdateSelectedResource((resource) => ({
                            ...resource,
                            ui: {
                              ...resource.ui,
                              icon: isPublic ? SUBNET_PRIVATE_ICON_PATH : SUBNET_PUBLIC_ICON_PATH,
                            },
                          }));
                        }}
                        className="w-full rounded border border-gray-300 bg-white px-2 py-1 text-xs text-left hover:bg-gray-50"
                      >
                        {selectedResource.ui.icon === SUBNET_PUBLIC_ICON_PATH
                          ? "Public subnet"
                          : "Private subnet"}
                      </button>
                    </div>
                  ) : null}

                  <div className="space-y-3">
                    <div className="rounded border border-gray-300 bg-white p-2">
                      <div className="grid grid-cols-1 gap-2">
                        <input
                          value={attributeSearch}
                          onChange={(event) => setAttributeSearch(event.target.value)}
                          placeholder="Search attributes..."
                          className="w-full rounded border border-gray-300 bg-white px-2 py-1 text-xs"
                        />

                        <div className="flex flex-wrap gap-1">
                          <button
                            type="button"
                            onClick={() =>
                              setAttributeStateFilters((current) =>
                                current.includes("required")
                                  ? current.filter((value) => value !== "required")
                                  : [...current, "required"],
                              )
                            }
                            className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                              attributeStateFilters.includes("required")
                                ? "border-red-300 bg-red-100 text-red-700"
                                : "border-gray-300 bg-white text-gray-600"
                            }`}
                          >
                            Required
                          </button>
                          <button
                            type="button"
                            onClick={() =>
                              setAttributeStateFilters((current) =>
                                current.includes("optional")
                                  ? current.filter((value) => value !== "optional")
                                  : [...current, "optional"],
                              )
                            }
                            className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                              attributeStateFilters.includes("optional")
                                ? "border-slate-300 bg-slate-100 text-slate-700"
                                : "border-gray-300 bg-white text-gray-600"
                            }`}
                          >
                            Optional
                          </button>
                          <button
                            type="button"
                            onClick={() =>
                              setAttributeStateFilters((current) =>
                                current.includes("computed")
                                  ? current.filter((value) => value !== "computed")
                                  : [...current, "computed"],
                              )
                            }
                            className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                              attributeStateFilters.includes("computed")
                                ? "border-amber-300 bg-amber-100 text-amber-700"
                                : "border-gray-300 bg-white text-gray-600"
                            }`}
                          >
                            Computed
                          </button>

                          <div className="relative">
                            <button
                              type="button"
                              onClick={() => setShowTypeMenu((current) => !current)}
                              className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                                attributeTypeFilters.length > 0
                                  ? "border-blue-300 bg-blue-100 text-blue-700"
                                  : "border-gray-300 bg-white text-gray-600"
                              }`}
                            >
                              Type {attributeTypeFilters.length > 0 ? `(${attributeTypeFilters.length})` : ""}
                            </button>

                            {showTypeMenu ? (
                              <div className="absolute right-0 z-20 mt-1 w-44 rounded border border-gray-300 bg-white p-2 shadow-lg">
                                <div className="mb-1 flex items-center justify-between">
                                  <div className="text-[10px] font-semibold text-gray-700">Attribute types</div>
                                  <button
                                    type="button"
                                    onClick={() => setAttributeTypeFilters([])}
                                    className="text-[10px] text-blue-600"
                                  >
                                    Clear
                                  </button>
                                </div>

                                <div className="max-h-44 space-y-1 overflow-auto pr-1">
                                  {availableTypeOptions.map((typeOption) => (
                                    <label
                                      key={typeOption}
                                      className="flex cursor-pointer items-center gap-2 text-[11px] text-gray-700"
                                    >
                                      <input
                                        type="checkbox"
                                        checked={attributeTypeFilters.includes(typeOption)}
                                        onChange={() => {
                                          setAttributeTypeFilters((current) =>
                                            current.includes(typeOption)
                                              ? current.filter((value) => value !== typeOption)
                                              : [...current, typeOption],
                                          );
                                        }}
                                      />
                                      <span className="break-all">{typeOption}</span>
                                    </label>
                                  ))}
                                </div>
                              </div>
                            ) : null}
                          </div>

                        </div>
                      </div>
                    </div>

                    {filteredInspectorSections.map((section) => (
                      <div key={section.sectionKey} className="rounded border border-gray-300 bg-white p-2">
                        <div className="mb-2 border-b border-gray-200 pb-1">
                          <div className="text-[11px] font-semibold uppercase tracking-wide text-gray-700 break-words">
                            {section.sectionTitle}
                          </div>
                        </div>

                        <div className="space-y-2">
                          {section.properties.map((property) => {
                            const currentValue = selectedResource.config.attributes[property.name];
                            const isEditable = !property.computed || !!property.optional;

                            // ── Object collection: set(object{...}) / list(object{...}) ──
                            if (isObjectCollection(property.rawType) && isEditable) {
                              const entries = (Array.isArray(currentValue) ? currentValue : []) as Array<Record<string, unknown>>;
                              const objectFields = getObjectFields(property.rawType);
                              const fieldNames = Object.keys(objectFields);

                              const updateEntries = (next: Array<Record<string, unknown>>) =>
                                onUpdateSelectedResource((resource) => ({
                                  ...resource,
                                  config: {
                                    ...resource.config,
                                    attributes: { ...resource.config.attributes, [property.name]: next },
                                  },
                                }));

                              return (
                                <div key={property.name} className="rounded border border-gray-200 bg-gray-50 p-2">
                                  <div className="mb-1 flex items-start justify-between gap-2">
                                    <div className="min-w-0 flex-1">
                                      <div className="text-xs font-semibold text-gray-800 break-all">{property.fieldName}</div>
                                      <div className="text-[10px] text-gray-500">{property.type}</div>
                                    </div>
                                    <div className="flex shrink-0 gap-1">
                                      <span className="rounded bg-slate-100 px-1.5 py-0.5 text-[10px] font-semibold text-slate-600">optional</span>
                                      {property.computed && (
                                        <span className="rounded bg-amber-100 px-1.5 py-0.5 text-[10px] font-semibold text-amber-700">computed</span>
                                      )}
                                    </div>
                                  </div>

                                  <div className="space-y-1.5">
                                    {entries.map((entry, entryIndex) => (
                                      <div key={entryIndex} className="rounded border border-gray-300 bg-white p-1.5">
                                        <div className="mb-1 flex items-center justify-between">
                                          <span className="text-[10px] font-semibold text-gray-500">Entry {entryIndex + 1}</span>
                                          <button
                                            type="button"
                                            onClick={() => updateEntries(entries.filter((_, i) => i !== entryIndex))}
                                            className="text-[10px] text-red-400 hover:text-red-600"
                                          >
                                            Remove
                                          </button>
                                        </div>
                                        <div className="space-y-1">
                                          {fieldNames.map((fieldName) => (
                                            <div key={fieldName} className="flex items-center gap-1.5">
                                              <span className="w-[42%] shrink-0 truncate text-[10px] text-gray-500" title={fieldName}>
                                                {fieldName}
                                              </span>
                                              <span className="shrink-0 text-[10px] font-mono text-gray-400">=</span>
                                              <input
                                                value={displaySubFieldValue(entry[fieldName])}
                                                placeholder={renderSubFieldType(objectFields[fieldName])}
                                                onChange={(e) => {
                                                  const parsed = parseInspectorInputValue(e.target.value);
                                                  updateEntries(
                                                    entries.map((ent, i) =>
                                                      i === entryIndex ? { ...ent, [fieldName]: parsed } : ent,
                                                    ),
                                                  );
                                                }}
                                                className="w-[58%] rounded border border-gray-300 bg-white px-1.5 py-0.5 text-[10px]"
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
                                    className="mt-1.5 w-full rounded border border-dashed border-gray-300 py-1 text-[10px] text-gray-400 hover:bg-gray-100 hover:text-gray-600"
                                  >
                                    + Add entry
                                  </button>
                                </div>
                              );
                            }

                            // ── Default: scalar / map / simple types ──
                            const displayValue = formatInspectorInputValue(currentValue);

                            return (
                              <div key={property.name} className="rounded border border-gray-200 bg-gray-50 p-2">
                                <div className="mb-1 flex items-start justify-between gap-2">
                                  <div className="min-w-0 flex-1">
                                    <div className="text-xs font-semibold text-gray-800 break-all">
                                      {property.fieldName}
                                    </div>
                                    <div className="text-[10px] text-gray-500 break-words">
                                      {property.type} · {property.computed ? "computed" : "editable"}
                                    </div>
                                  </div>

                                  <div className="flex shrink-0 gap-1">
                                    <span
                                      className={`rounded px-1.5 py-0.5 text-[10px] font-semibold ${
                                        property.required
                                          ? "bg-red-100 text-red-700"
                                          : "bg-slate-100 text-slate-600"
                                      }`}
                                    >
                                      {property.required ? "required" : "optional"}
                                    </span>
                                    {property.computed ? (
                                      <span className="rounded bg-amber-100 px-1.5 py-0.5 text-[10px] font-semibold text-amber-700">
                                        computed
                                      </span>
                                    ) : null}
                                  </div>
                                </div>

                                <div className="flex items-center gap-1.5">
                                  <span className="shrink-0 text-xs font-mono text-gray-400">=</span>
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
                                        config: {
                                          ...resource.config,
                                          attributes: { ...resource.config.attributes, [property.name]: mapped },
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
                                          attributes: { ...resource.config.attributes, [property.name]: nextValue },
                                        },
                                      }));
                                    }}
                                    className="w-full rounded border border-gray-300 bg-white px-2 py-1 text-xs disabled:bg-gray-100"
                                  />
                                </div>
                              </div>
                            );
                          })}
                        </div>
                      </div>
                    ))}

                    {filteredInspectorSections.length === 0 ? (
                      <div className="rounded border border-dashed border-gray-300 p-2 text-xs text-gray-500">
                        No attributes match the current filters.
                      </div>
                    ) : null}
                  </div>

                  {selectedNode.data.isContainer && (
                    <div className="rounded border border-gray-200 bg-white p-2">
                      <div className="mb-2 text-xs font-semibold text-gray-800">
                        {(selectedNode.data.containerKind === "zone" ||
                          selectedNode.data.schemaId === "aws_availability_zone")
                          ? `Nodes in zone (${children.length})`
                          : `Children (${children.length})`}
                      </div>
                      <div className="space-y-1">
                        {children.length === 0 ? (
                          <p className="text-xs text-gray-500">
                            {(selectedNode.data.containerKind === "zone" ||
                              selectedNode.data.schemaId === "aws_availability_zone")
                              ? "No nodes currently inside this zone marker."
                              : "This container has no children."}
                          </p>
                        ) : (
                          children.map((child) => (
                            <button
                              key={child.id}
                              type="button"
                              onClick={() => onSelectNode(child.id)}
                              className="w-full rounded border border-gray-200 px-2 py-1 text-left text-xs hover:bg-blue-50"
                            >
                              {child.data.label}
                            </button>
                          ))
                        )}
                      </div>
                    </div>
                  )}
                </>
              )}
            </div>
          )}

          {activeTab === "hcl" && (
            <div className="h-full flex flex-col">
              <p className="mb-2 text-sm font-medium text-gray-800">Selected node HCL</p>
              {(!selectedNode || !selectedResource || !selectedSchema) ? (
                <textarea
                  disabled
                  value=""
                  className="h-[65vh] w-full rounded border border-gray-200 bg-slate-100 p-2 font-mono text-xs text-slate-500"
                />
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
                      config: {
                        ...selectedResource.config,
                        attributes: nextAttributes,
                      },
                    };

                    setHclDraft(buildHclFromResource(nextResource));
                    onUpdateSelectedResource(() => nextResource);
                  }}
                  containerClassName="h-[65vh] rounded border border-gray-200 bg-[#0b1120]"
                  innerClassName="p-2 font-mono text-xs"
                />
              )}
            </div>
          )}
        </div>
      )}
    </aside>
  );
};
