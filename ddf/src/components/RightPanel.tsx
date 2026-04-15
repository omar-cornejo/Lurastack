import { useEffect, useMemo, useRef, useState } from "react";
import { Icon } from "@iconify/react";
import type { Node } from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";

import type { TerraformResource } from "../models/terraform";
import { NODE_SCHEMAS, type TerraformNodeSchema } from "../models/nodeRegistry";
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

const parseHclValueToAttribute = (input: string): unknown => {
  const trimmed = input.trim();
  if (!trimmed) return "";
  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(trimmed)) return Number(trimmed);
  if (trimmed.startsWith('"') && trimmed.endsWith('"')) {
    return trimmed.slice(1, -1);
  }
  return trimmed;
};

const toHclLiteral = (value: unknown): string => {
  if (typeof value === "boolean" || typeof value === "number") {
    return String(value);
  }
  if (typeof value === "string" && terraformRefPattern.test(value.trim())) {
    return value.trim();
  }
  if (value === null || value === undefined) {
    return '""';
  }
  return `"${String(value).replace(/"/g, '\\"')}"`;
};

const buildHclFromResource = (
  resource: TerraformResource,
  inspectorProperties: InspectorProperty[],
) => {
  const blockKind = resource.kind ?? "resource";
  const header = `${blockKind} "${resource.type}" "${resource.name}" {`;
  const attrs = resource.config.attributes ?? {};
  const lines = Object.entries(attrs)
    .filter(([key, value]) => {
      if (inspectorProperties.some((p) => p.name === key && p.required)) {
        return true;
      }
      return value !== "" && value !== undefined && value !== null;
    })
    .map(([key, value]) => `  ${key} = ${toHclLiteral(value)}`);

  const requiredNotFilled = inspectorProperties
    .filter((prop) => prop.required)
    .filter((prop) => !(prop.name in attrs))
    .map((prop) => `  ${prop.name} = ""`);

  return [header, ...lines, ...requiredNotFilled, "}"].join("\n");
};

const parseHclAttributes = (hcl: string): Record<string, unknown> => {
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

    const simpleAssignment = trimmed.match(/^([a-zA-Z0-9_.-]+)\s*=\s*(.+)$/);
    if (!simpleAssignment) return;

    const [, key, rawValue] = simpleAssignment;
    attributes[key] = parseHclValueToAttribute(rawValue);
  });

  return attributes;
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
    () =>
      selectedNodeId
        ? nodes.filter((node) => node.parentNode === selectedNodeId)
        : [],
    [nodes, selectedNodeId],
  );

  useEffect(() => {
    if (!selectedResource) {
      setHclDraft("");
      return;
    }

    setHclDraft(buildHclFromResource(selectedResource, inspectorProperties));
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
                            const displayValue =
                              currentValue === undefined || currentValue === null
                                ? ""
                                : String(currentValue);

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

                                <input
                                  disabled={property.computed && !property.optional}
                                  value={displayValue}
                                  onDragOver={(event) => {
                                    event.preventDefault();
                                  }}
                                  onDrop={(event) => {
                                    event.preventDefault();
                                    const droppedValue =
                                      event.dataTransfer.getData(OBJECT_MAPPER_REF_MIME) ||
                                      event.dataTransfer.getData("text/plain") ||
                                      latestMapperDragPayload;
                                    const mapped = normalizeMappedReference(
                                      droppedValue,
                                      property.name,
                                      resources,
                                    );

                                    onUpdateSelectedResource((resource) => ({
                                      ...resource,
                                      config: {
                                        ...resource.config,
                                        attributes: {
                                          ...resource.config.attributes,
                                          [property.name]: mapped,
                                        },
                                      },
                                    }));
                                  }}
                                  onChange={(event) => {
                                    const value = normalizeMappedReference(
                                      event.target.value,
                                      property.name,
                                      resources,
                                    );
                                    onUpdateSelectedResource((resource) => ({
                                      ...resource,
                                      config: {
                                        ...resource.config,
                                        attributes: {
                                          ...resource.config.attributes,
                                          [property.name]: value,
                                        },
                                      },
                                    }));
                                  }}
                                  className="w-full rounded border border-gray-300 bg-white px-2 py-1 text-xs disabled:bg-gray-100"
                                />
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
                      <div className="mb-2 text-xs font-semibold text-gray-800">Children ({children.length})</div>
                      <div className="space-y-1">
                        {children.length === 0 ? (
                          <p className="text-xs text-gray-500">This container has no children.</p>
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
              <textarea
                value={hclDraft}
                onChange={(event) => {
                  const next = event.target.value;
                  setHclDraft(next);
                  if (!selectedResource) return;

                  const parsedAttributes = parseHclAttributes(next);
                  onUpdateSelectedResource((resource) => ({
                    ...resource,
                    config: {
                      ...resource.config,
                      attributes: {
                        ...resource.config.attributes,
                        ...parsedAttributes,
                      },
                    },
                  }));
                }}
                disabled={!selectedNode || !selectedResource || !selectedSchema}
                className="h-[65vh] w-full rounded border border-gray-200 bg-[#0b1120] p-2 font-mono text-xs text-[#e5e7eb] disabled:bg-slate-100 disabled:text-slate-500"
              />
            </div>
          )}
        </div>
      )}
    </aside>
  );
};
