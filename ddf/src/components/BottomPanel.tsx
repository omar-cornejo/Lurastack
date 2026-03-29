import { useState, useRef, useEffect, useMemo } from "react";
import { Terminal } from "xterm";
import { FitAddon } from "xterm-addon-fit";
import "xterm/css/xterm.css";
import { Icon } from '@iconify/react';
import { invoke } from "@tauri-apps/api/core";
import { listen } from "@tauri-apps/api/event";
import type { Edge, Node } from "reactflow";
import type { CanvasEdgeData, CanvasTerraformNodeData } from "../canvas/types";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/testNodes";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";

type BottomPanelProps = {
  onHeightChange?: (height: number) => void;
  nodes: Node<CanvasTerraformNodeData>[];
  edges: Edge<CanvasEdgeData>[];
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
};

type BottomPanelTab = "terminal" | "mapper";

const OBJECT_MAPPER_REF_MIME = "application/x-ddf-object-mapper-ref";


export default function BottomPanel({ onHeightChange, nodes, edges, resources, schemas }: BottomPanelProps) {
  const [open, setOpen] = useState(true);
  const [height, setHeight] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const [activeTab, setActiveTab] = useState<BottomPanelTab>("terminal");
  const [selectedMapperResourceId, setSelectedMapperResourceId] = useState<string | undefined>(undefined);
  const [resourceSearch, setResourceSearch] = useState("");
  const [attributeSearch, setAttributeSearch] = useState("");
  const [attributeStateFilters, setAttributeStateFilters] = useState<
    Array<"required" | "optional" | "computed">
  >([]);
  const [attributeTypeFilters, setAttributeTypeFilters] = useState<string[]>([]);
  const [mapperSourceFilter, setMapperSourceFilter] = useState<"properties" | "connections" | "container">("properties");
  const [showTypeMenu, setShowTypeMenu] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const terminalRef = useRef<HTMLDivElement>(null);
  const term = useRef<Terminal | null>(null);
  const fitAddon = useRef<FitAddon | null>(null);
  const terminalDisposedRef = useRef(false);

  const safeFitTerminal = () => {
    if (terminalDisposedRef.current || !term.current || !fitAddon.current) return;
    try {
      fitAddon.current.fit();
    } catch {
      // ignore transient fit errors when terminal is mounting/unmounting
    }
  };

  const resourcesInCanvas = useMemo(() => {
    const byResourceId = new Map(resources.map((resource) => [resource.id, resource]));
    const collected: Array<{
      node: Node<CanvasTerraformNodeData>;
      resource: TerraformResource;
      schema?: TerraformNodeSchema;
    }> = [];

    nodes.forEach((node) => {
      const resource = byResourceId.get(node.data.resourceId);
      if (!resource) return;
      const schema = schemas.find((candidate) => candidate.id === resource.schemaId);
      collected.push({
        node,
        resource,
        schema,
      });
    });

    return collected.sort((left, right) =>
      left.resource.name.localeCompare(right.resource.name),
    );
  }, [nodes, resources, schemas]);

  const selectedMapperItem = useMemo(() => {
    if (!selectedMapperResourceId) return resourcesInCanvas[0];
    return resourcesInCanvas.find((entry) => entry.resource.id === selectedMapperResourceId) ?? resourcesInCanvas[0];
  }, [resourcesInCanvas, selectedMapperResourceId]);

  const selectedMapperProperties = useMemo(() => {
    return getInspectorPropertiesForSchema(selectedMapperItem?.schema);
  }, [selectedMapperItem]);

  const filteredResourcesInCanvas = useMemo(() => {
    const search = resourceSearch.trim().toLowerCase();
    if (!search) return resourcesInCanvas;

    return resourcesInCanvas.filter(({ resource, schema }) => {
      const haystack = [
        resource.name,
        resource.type,
        resource.schemaId ?? "",
        schema?.id ?? "",
      ]
        .join(" ")
        .toLowerCase();
      return haystack.includes(search);
    });
  }, [resourceSearch, resourcesInCanvas]);

  const activeMapperItem = useMemo(() => {
    if (selectedMapperResourceId) {
      const selected = filteredResourcesInCanvas.find(
        (entry) => entry.resource.id === selectedMapperResourceId,
      );
      if (selected) return selected;
    }
    return filteredResourcesInCanvas[0];
  }, [filteredResourcesInCanvas, selectedMapperResourceId]);

  const availableTypeOptions = useMemo(() => {
    const preferredOrder = ["string", "number", "bool", "map", "list", "set", "object"];
    const discovered = new Set<string>();
    selectedMapperProperties.forEach((property) => {
      property.typeKinds.forEach((kind) => discovered.add(kind));
    });

    const sorted = [...preferredOrder.filter((kind) => discovered.has(kind))];
    Array.from(discovered)
      .filter((kind) => !preferredOrder.includes(kind))
      .sort((left, right) => left.localeCompare(right))
      .forEach((kind) => sorted.push(kind));
    return sorted;
  }, [selectedMapperProperties]);

  const filteredMapperProperties = useMemo(() => {
    const search = attributeSearch.trim().toLowerCase();

    return selectedMapperProperties.filter((property) => {
      const matchesSearch = !search ||
        property.name.toLowerCase().includes(search) ||
        property.type.toLowerCase().includes(search);

      const matchesState =
        attributeStateFilters.length === 0 ||
        attributeStateFilters.some((state) => {
          if (state === "required") return !!property.required;
          if (state === "optional") return !!property.optional;
          return !!property.computed;
        });

      const matchesType =
        attributeTypeFilters.length === 0 ||
        property.typeKinds.some((kind) => attributeTypeFilters.includes(kind));

      return matchesSearch && matchesState && matchesType;
    });
  }, [attributeSearch, attributeStateFilters, attributeTypeFilters, selectedMapperProperties]);

  const groupedMapperProperties = useMemo(() => {
    const sectionMap = new Map<string, typeof filteredMapperProperties>();

    filteredMapperProperties.forEach((property) => {
      const parts = property.name.split(".");
      const section = parts.length > 1 ? parts.slice(0, -1).join(".") : "root";
      if (!sectionMap.has(section)) {
        sectionMap.set(section, []);
      }
      sectionMap.get(section)!.push(property);
    });

    return Array.from(sectionMap.entries())
      .map(([key, properties]) => ({
        key,
        title: key === "root" ? "Main" : key,
        properties: properties.sort((left, right) => left.name.localeCompare(right.name)),
      }))
      .sort((left, right) => {
        if (left.key === "root") return -1;
        if (right.key === "root") return 1;
        return left.key.localeCompare(right.key);
      });
  }, [filteredMapperProperties]);

  const mapperIncomingConnectionMappings = useMemo(() => {
    if (!activeMapperItem) {
      return [] as Array<{
        edgeId: string;
        fromNodeId: string;
        fromNodeLabel: string;
        sourceExpression: string;
        targetAttribute: string;
      }>;
    }

    const targetNodeId = activeMapperItem.node.id;
    const collected: Array<{
      edgeId: string;
      fromNodeId: string;
      fromNodeLabel: string;
      sourceExpression: string;
      targetAttribute: string;
    }> = [];

    edges.forEach((edge) => {
      const mappings = Array.isArray(edge.data?.mappings) ? edge.data.mappings : [];
      mappings
        .filter((mapping) => mapping.toNodeId === targetNodeId)
        .forEach((mapping) => {
          const fromNode = nodes.find((node) => node.id === mapping.fromNodeId);
          collected.push({
            edgeId: edge.id,
            fromNodeId: mapping.fromNodeId,
            fromNodeLabel:
              mapping.fromNodeLabel ?? fromNode?.data.label ?? mapping.fromNodeId,
            sourceExpression: mapping.sourceExpression,
            targetAttribute: mapping.targetAttribute,
          });
        });
    });

    return collected;
  }, [activeMapperItem, edges, nodes]);

  const mapperIncomingGrouped = useMemo(() => {
    const grouped = new Map<string, {
      fromNodeLabel: string;
      entries: Array<{
        edgeId: string;
        sourceExpression: string;
        targetAttribute: string;
      }>;
    }>();

    mapperIncomingConnectionMappings.forEach((mapping) => {
      if (!grouped.has(mapping.fromNodeId)) {
        grouped.set(mapping.fromNodeId, {
          fromNodeLabel: mapping.fromNodeLabel,
          entries: [],
        });
      }

      grouped.get(mapping.fromNodeId)!.entries.push({
        edgeId: mapping.edgeId,
        sourceExpression: mapping.sourceExpression,
        targetAttribute: mapping.targetAttribute,
      });
    });

    return Array.from(grouped.values());
  }, [mapperIncomingConnectionMappings]);

  const mapperInheritedFromContainer = useMemo(() => {
    if (!activeMapperItem?.node.parentNode) {
      return [] as Array<{
        containerLabel: string;
        attributeName: string;
        sourceExpression: string;
      }>;
    }

    const parentNode = nodes.find((node) => node.id === activeMapperItem.node.parentNode);
    if (!parentNode) return [];

    const parentResource = resources.find((resource) => resource.id === parentNode.data.resourceId);
    if (!parentResource) return [];

    const parentSchema = schemas.find((schema) => schema.id === parentResource.schemaId);
    const parentProps = getInspectorPropertiesForSchema(parentSchema);
    const configuredKeys = Object.keys(parentResource.config.attributes ?? {});
    const schemaKeys = parentProps.map((prop) => prop.name);
    const allKeys = Array.from(new Set([...schemaKeys, ...configuredKeys]))
      .filter(Boolean)
      .sort((left, right) => left.localeCompare(right));

    const prefix = parentResource.kind === "data" ? "data." : "";
    const baseRef = `${prefix}${parentResource.type}.${parentResource.name}`;

    return allKeys.map((attributeName) => ({
      containerLabel: parentNode.data.label,
      attributeName,
      sourceExpression: `${baseRef}.${attributeName}`,
    }));
  }, [activeMapperItem, nodes, resources, schemas]);


  useEffect(() => {
    if (onHeightChange) onHeightChange(open ? height : 25);
  }, [height, open]);

  useEffect(() => {
    if (!terminalRef.current) return;
    terminalDisposedRef.current = false;

    term.current = new Terminal({
      cursorBlink: true,
      theme: {
        background: "#111827",
      },
    });

    fitAddon.current = new FitAddon();
    term.current.loadAddon(fitAddon.current);

    term.current.open(terminalRef.current);
    setTimeout(() => {
      if (terminalDisposedRef.current) return;
      safeFitTerminal();
      term.current?.focus();
    }, 0);

    term.current.onData((data: string) => {
      if (terminalDisposedRef.current) return;
      invoke("write_to_pty", { input: data });
    });

    const unlisten = listen<string>("pty-output", (event) => {
      if (terminalDisposedRef.current || !term.current) return;
      try {
        term.current.write(event.payload);
      } catch {
        // ignore writes after dispose boundaries
      }
    });

    const onWindowResize = () => safeFitTerminal();
    window.addEventListener('resize', onWindowResize);

    return () => {
      terminalDisposedRef.current = true;
      unlisten.then((f) => f());
      window.removeEventListener('resize', onWindowResize);
      try {
        term.current?.dispose();
      } catch {
        // ignore dispose race conditions
      }
      term.current = null;
      fitAddon.current = null;
    };
  }, []);

  useEffect(() => {
    safeFitTerminal();
  }, [height]);

  useEffect(() => {
    if (activeTab === "terminal") {
      requestAnimationFrame(() => {
        safeFitTerminal();
        term.current?.focus();
      });
    }
  }, [activeTab]);

  useEffect(() => {
    if (!panelRef.current) return;

    const resizeObserver = new ResizeObserver(() => {
      safeFitTerminal();
    });

    resizeObserver.observe(panelRef.current);

    return () => {
      resizeObserver.disconnect();
    };
  }, []);



  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;

      const rect = panelRef.current.getBoundingClientRect();
      const newHeight = rect.bottom - e.clientY;

      const minHeight = 100;
      const maxHeight = 300;

      if (newHeight >= minHeight && newHeight <= maxHeight) {
        setHeight(newHeight);
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
      style={{ height: open ? height : 35 }}
      className={`relative bg-gray-100 border-l flex-none overflow-hidden
    ${isResizing ? "" : "transition-[height] duration-200"}`}
    >
      {open && (
        <div
          onMouseDown={(e) => {
            e.preventDefault();
            document.body.style.userSelect = "none";
            document.body.style.cursor = "row-resize";
            setIsResizing(true);
          }}
          className="absolute top-0 left-0 w-full h-1 cursor-row-resize bg-transparent hover:bg-gray-300"
        />
      )}

      <header className="h-10 border-b border-gray-200 bg-gray-50 px-2 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <button
            onClick={(e) => {
              e.stopPropagation();
              setOpen((o) => !o);
            }}
            className="px-2 py-1 bg-gray-200 rounded flex items-center justify-center"
            aria-expanded={open}
            aria-controls="bottom-panel-content"
            aria-label={open ? 'Close bottom panel' : 'Show bottom panel'}
            type="button"
          >
            <Icon
              icon="weui:more-filled"
              className={`transition-transform ${open ? 'rotate-180' : ''}`}
              width={14}
              height={14}
              aria-hidden="true"
            />
          </button>
          <strong className="text-sm text-gray-700">Bottom</strong>
        </div>

        <div className="flex gap-1">
          <button
            type="button"
            onClick={() => setActiveTab("terminal")}
            className={`px-2 py-1 rounded text-xs border ${
              activeTab === "terminal"
                ? "border-blue-500 text-blue-600 bg-white"
                : "border-gray-300 text-gray-500 hover:text-gray-700 bg-white"
            }`}
          >
            Terminal
          </button>
          <button
            type="button"
            onClick={() => setActiveTab("mapper")}
            className={`px-2 py-1 rounded text-xs border ${
              activeTab === "mapper"
                ? "border-blue-500 text-blue-600 bg-white"
                : "border-gray-300 text-gray-500 hover:text-gray-700 bg-white"
            }`}
          >
            Object Mapper
          </button>
        </div>
      </header>

      <div
        id="bottom-panel-content"
        className="h-[calc(100%-2.5rem)] w-full transition-opacity duration-200"
        style={{
          opacity: open ? 1 : 0,
          pointerEvents: open ? "auto" : "none",
        }}
      >
        <div
          className="h-full w-full"
          style={{ display: activeTab === "terminal" ? "block" : "none" }}
        >
          <div ref={terminalRef} className="h-full w-full" />
        </div>

        <div
          className="h-full w-full"
          style={{ display: activeTab === "mapper" ? "block" : "none" }}
        >
          <div className="grid h-full grid-cols-[260px_1fr] gap-2 p-2 overflow-hidden">
            <div className="rounded border border-gray-300 bg-white overflow-auto">
              <div className="sticky top-0 z-10 border-b border-gray-200 bg-white p-2">
                <input
                  value={resourceSearch}
                  onChange={(event) => setResourceSearch(event.target.value)}
                  placeholder="Search resources..."
                  className="w-full rounded border border-gray-300 px-2 py-1 text-xs"
                />
              </div>

              {filteredResourcesInCanvas.length === 0 ? (
                <div className="p-2 text-xs text-gray-500">No resources in canvas yet.</div>
              ) : (
                <div className="space-y-1 p-2">
                  {filteredResourcesInCanvas.map(({ resource, schema }) => (
                    <button
                      key={resource.id}
                      type="button"
                      onClick={() => setSelectedMapperResourceId(resource.id)}
                      className={`w-full rounded border px-2 py-1 text-left text-xs ${
                        activeMapperItem?.resource.id === resource.id
                          ? "border-blue-300 bg-blue-50"
                          : "border-gray-200 bg-white hover:bg-gray-50"
                      }`}
                    >
                      <div className="font-semibold break-all">{resource.name}</div>
                      <div className="text-[10px] text-gray-500 break-all">
                        {schema?.id ?? resource.schemaId} · {resource.type}
                      </div>
                    </button>
                  ))}
                </div>
              )}
            </div>

            <div className="rounded border border-gray-300 bg-white overflow-auto">
              {!activeMapperItem ? (
                <div className="p-2 text-xs text-gray-500">Select a resource to view attributes.</div>
              ) : (
                <div className="p-2 space-y-2">
                  <div className="rounded border border-gray-200 bg-gray-50 p-2 text-xs">
                    <div><span className="font-semibold">Resource:</span> {activeMapperItem.resource.name}</div>
                    <div><span className="font-semibold">Type:</span> {activeMapperItem.resource.type}</div>
                    <div><span className="font-semibold">Kind:</span> {activeMapperItem.resource.kind ?? "resource"}</div>
                  </div>

                  <div className="rounded border border-gray-200 bg-white p-2">
                    <div className="grid grid-cols-1 gap-2">
                      <input
                        value={attributeSearch}
                        onChange={(event) => setAttributeSearch(event.target.value)}
                        placeholder="Search attributes..."
                        className="w-full rounded border border-gray-300 px-2 py-1 text-xs"
                      />

                      <div className="flex flex-wrap gap-1">
                        <button
                          type="button"
                          onClick={() =>
                            setAttributeStateFilters((current) =>
                              current.includes("required")
                                ? current.filter((item) => item !== "required")
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
                                ? current.filter((item) => item !== "optional")
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
                                ? current.filter((item) => item !== "computed")
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
                                  <label key={typeOption} className="flex items-center gap-2 text-[11px] text-gray-700">
                                    <input
                                      type="checkbox"
                                      checked={attributeTypeFilters.includes(typeOption)}
                                      onChange={() => {
                                        setAttributeTypeFilters((current) =>
                                          current.includes(typeOption)
                                            ? current.filter((item) => item !== typeOption)
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

                        <div className="ml-auto flex gap-1">
                          <button
                            type="button"
                            onClick={() => setMapperSourceFilter("properties")}
                            className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                              mapperSourceFilter === "properties"
                                ? "border-blue-300 bg-blue-100 text-blue-700"
                                : "border-gray-300 bg-white text-gray-600"
                            }`}
                          >
                            Properties
                          </button>
                          <button
                            type="button"
                            onClick={() => setMapperSourceFilter("connections")}
                            className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                              mapperSourceFilter === "connections"
                                ? "border-blue-300 bg-blue-100 text-blue-700"
                                : "border-gray-300 bg-white text-gray-600"
                            }`}
                          >
                            Connections
                          </button>
                          <button
                            type="button"
                            onClick={() => setMapperSourceFilter("container")}
                            className={`rounded px-2 py-1 text-[11px] font-semibold border ${
                              mapperSourceFilter === "container"
                                ? "border-blue-300 bg-blue-100 text-blue-700"
                                : "border-gray-300 bg-white text-gray-600"
                            }`}
                          >
                            Container
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>

                  {mapperSourceFilter === "connections" && (
                    <div className="rounded border border-gray-200 bg-white p-2">
                      <div className="mb-1 w-full border-b border-gray-200 pb-1 flex items-center justify-between text-left">
                        <span className="text-[11px] font-semibold uppercase tracking-wide text-gray-700 break-all">
                          From connections
                        </span>
                      </div>

                      {mapperIncomingGrouped.length === 0 ? (
                        <div className="rounded border border-dashed border-gray-300 p-2 text-xs text-gray-500">
                          No incoming mapped attributes for this resource.
                        </div>
                      ) : (
                        <div className="space-y-2">
                          {mapperIncomingGrouped.map((group) => (
                            <div key={group.fromNodeLabel} className="rounded border border-gray-200 bg-gray-50 p-2">
                              <div className="mb-1 text-[11px] font-semibold text-gray-700">{group.fromNodeLabel}</div>
                              <div className="flex flex-wrap gap-1">
                                {group.entries.map((entry, index) => (
                                  <div
                                    key={`${entry.edgeId}-${entry.targetAttribute}-${index}`}
                                    className="rounded border border-blue-200 bg-blue-50 px-2 py-1 text-[10px] text-blue-800 break-all cursor-grab"
                                    draggable
                                    onDragStart={(event) => {
                                      event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, entry.sourceExpression);
                                      event.dataTransfer.setData("text/plain", entry.sourceExpression);
                                      event.dataTransfer.effectAllowed = "copy";
                                    }}
                                    title={`Mapped to ${entry.targetAttribute}`}
                                  >
                                    {entry.sourceExpression}
                                  </div>
                                ))}
                              </div>
                            </div>
                          ))}
                        </div>
                      )}
                    </div>
                  )}

                  {mapperSourceFilter === "container" && (
                    <div className="rounded border border-gray-200 bg-white p-2">
                      <div className="mb-1 w-full border-b border-gray-200 pb-1 flex items-center justify-between text-left">
                        <span className="text-[11px] font-semibold uppercase tracking-wide text-gray-700 break-all">
                          From container
                        </span>
                      </div>

                      {mapperInheritedFromContainer.length === 0 ? (
                        <div className="rounded border border-dashed border-gray-300 p-2 text-xs text-gray-500">
                          This resource is not inside a container or no inherited attributes are available.
                        </div>
                      ) : (
                        <div className="space-y-2">
                          <div className="text-[11px] font-semibold text-gray-700">
                            {mapperInheritedFromContainer[0]?.containerLabel}
                          </div>
                          <div className="flex flex-wrap gap-1">
                            {mapperInheritedFromContainer.map((item) => (
                              <div
                                key={item.sourceExpression}
                                className="rounded border border-emerald-200 bg-emerald-50 px-2 py-1 text-[10px] text-emerald-800 break-all cursor-grab"
                                draggable
                                onDragStart={(event) => {
                                  event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, item.sourceExpression);
                                  event.dataTransfer.setData("text/plain", item.sourceExpression);
                                  event.dataTransfer.effectAllowed = "copy";
                                }}
                              >
                                {item.sourceExpression}
                              </div>
                            ))}
                          </div>
                        </div>
                      )}
                    </div>
                  )}

                  {mapperSourceFilter === "properties" ? (
                    <div className="space-y-2">
                      {groupedMapperProperties.map((group) => (
                      <div key={group.key} className="rounded border border-gray-200 bg-white p-2">
                        <div className="mb-1 w-full border-b border-gray-200 pb-1 flex items-center justify-between text-left">
                          <span className="text-[11px] font-semibold uppercase tracking-wide text-gray-700 break-all">
                            {group.title}
                          </span>
                          <span className="text-[10px] text-gray-500">{group.properties.length}</span>
                        </div>

                        <div className="grid grid-cols-1 gap-2 md:grid-cols-2 xl:grid-cols-3">
                          {group.properties.map((property) => {
                            const resourcePrefix =
                              activeMapperItem.resource.kind === "data"
                                ? `data.${activeMapperItem.resource.type}`
                                : activeMapperItem.resource.type;
                            const refPrefix = `${resourcePrefix}.${activeMapperItem.resource.name}`;
                            const mapperValue = `${refPrefix}.${property.name}`;
                            const fieldName = property.name.split(".").pop() ?? property.name;

                            return (
                              <div key={property.name} className="rounded border border-gray-200 bg-gray-50 p-2">
                                <div className="mb-1 flex items-start justify-between gap-1">
                                  <div className="text-xs font-semibold break-all">{fieldName}</div>
                                  <div className="flex gap-1">
                                    <span className={`rounded px-1 py-0.5 text-[10px] ${property.required ? "bg-red-100 text-red-700" : "bg-slate-100 text-slate-700"}`}>
                                      {property.required ? "required" : "optional"}
                                    </span>
                                    {property.computed ? (
                                      <span className="rounded bg-amber-100 px-1 py-0.5 text-[10px] text-amber-700">computed</span>
                                    ) : null}
                                  </div>
                                </div>

                                <div className="mb-1 text-[10px] text-gray-500 break-all">{property.type}</div>

                                <div className="flex items-center gap-1">
                                  <div
                                    className="flex-1 rounded border border-dashed border-blue-300 bg-blue-50 px-2 py-1 text-[10px] text-blue-800 break-all cursor-grab"
                                    draggable
                                    onDragStart={(event) => {
                                      event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, mapperValue);
                                      event.dataTransfer.setData("text/plain", mapperValue);
                                      event.dataTransfer.effectAllowed = "copy";
                                    }}
                                    title="Drag into a field in the right panel"
                                  >
                                    {mapperValue}
                                  </div>
                                  <button
                                    type="button"
                                    onClick={async () => {
                                      try {
                                        await navigator.clipboard.writeText(mapperValue);
                                      } catch {
                                        // ignore clipboard errors silently
                                      }
                                    }}
                                    className="rounded border border-gray-300 px-2 py-1 text-[10px] hover:bg-gray-100"
                                  >
                                    Copy
                                  </button>
                                </div>
                              </div>
                            );
                          })}
                        </div>
                      </div>
                      ))}

                      {groupedMapperProperties.length === 0 ? (
                        <div className="rounded border border-dashed border-gray-300 p-2 text-xs text-gray-500">
                          No attributes match the current filters.
                        </div>
                      ) : null}
                    </div>
                  ) : null}
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </aside>
  );
}
