import { useState, useRef, useEffect, useMemo, useDeferredValue } from "react";
import { useTranslation } from "react-i18next";
import { Terminal } from "xterm";
import { FitAddon } from "xterm-addon-fit";
import "xterm/css/xterm.css";
import { invoke } from "@tauri-apps/api/core";
import { PanelToggleTab } from "./PanelToggleTab";
import { listen } from "@tauri-apps/api/event";
import { getCurrentWindow } from "@tauri-apps/api/window";
import type { Edge, Node } from "reactflow";
import type { CanvasEdgeData, CanvasTerraformNodeData } from "../canvas/types";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";
import type { BottomPanelLogEntry } from "../types/logs";

type BottomPanelProps = {
  onHeightChange?: (height: number) => void;
  nodes: Node<CanvasTerraformNodeData>[];
  edges: Edge<CanvasEdgeData>[];
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  mode?: "canvas" | "code";
  logs?: BottomPanelLogEntry[];
  openSignal?: number;
  preferredTab?: "terminal" | "logs";
  projectDir?: string;
  enabled?: boolean;
  viewId?: string;
  showPopoutButton?: boolean;
  suppressTerminal?: boolean;
  leftOffset?: number;
  terminalEnvVars?: Record<string, string>;
  isTerraformRunning?: boolean;
  hideMapper?: boolean;
};

type BottomPanelTab = "terminal" | "mapper" | "logs";

const OBJECT_MAPPER_REF_MIME = "application/x-lurastack-object-mapper-ref";
const BOTTOM_PANEL_CHANNEL = "lurastack-bottompanel-sync";
const BOTTOM_PANEL_MIN_HEIGHT = 100;
const BOTTOM_PANEL_MAX_HEIGHT = 300;
const BOTTOM_PANEL_HEADER_HEIGHT = 40;
const BOTTOM_PANEL_TERMINAL_VIEWPORT_HEIGHT =
  BOTTOM_PANEL_MAX_HEIGHT - BOTTOM_PANEL_HEADER_HEIGHT;

export default function BottomPanel({
  onHeightChange,
  nodes,
  edges,
  resources,
  schemas,
  mode = "canvas",
  logs = [],
  openSignal = 0,
  preferredTab,
  projectDir,
  enabled = true,
  viewId,
  showPopoutButton = true,
  suppressTerminal = false,
  leftOffset = 0,
  terminalEnvVars,
  isTerraformRunning = false,
  hideMapper = false,
}: BottomPanelProps) {
  const { t } = useTranslation();
  const showMapperTab = (mode === "canvas" || mode === "code") && !hideMapper;
  const [open, setOpen] = useState(true);
  const [height, setHeight] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const [activeTab, setActiveTab] = useState<BottomPanelTab>(mode === "code" ? "logs" : "terminal");
  const [selectedMapperResourceId, setSelectedMapperResourceId] = useState<string | undefined>(undefined);
  const [resourceSearch, setResourceSearch] = useState("");
  const [attributeSearch, setAttributeSearch] = useState("");
  const [attributeStateFilters, setAttributeStateFilters] = useState<
    Array<"required" | "optional" | "computed">
  >([]);
  const [attributeTypeFilters, setAttributeTypeFilters] = useState<string[]>([]);
  const [mapperSourceFilter, setMapperSourceFilter] = useState<"properties" | "connections" | "container" | "zones">("properties");
  const [showTypeMenu, setShowTypeMenu] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const terminalRef = useRef<HTMLDivElement>(null);
  const term = useRef<Terminal | null>(null);
  const fitAddon = useRef<FitAddon | null>(null);
  const terminalDisposedRef = useRef(false);
  const terminalReadyRef = useRef(false);
  const fitFrameRef = useRef<number | null>(null);
  const heightNotifyFrameRef = useRef<number | null>(null);
  const lastReportedPanelHeightRef = useRef<number | null>(null);
  const handledOpenSignalRef = useRef<number>(openSignal);
  const isTerraformRunningRef = useRef<boolean>(isTerraformRunning);
  // Buffers characters typed while an in-app terraform process is running, so a
  // complete line can be forwarded to terraform's stdin on Enter.
  const terraformInputBufferRef = useRef<string>("");
  useEffect(() => {
    isTerraformRunningRef.current = isTerraformRunning;
    // Reset any half-typed input when a terraform process starts/stops.
    terraformInputBufferRef.current = "";
  }, [isTerraformRunning]);

  useEffect(() => {
    if (!showMapperTab && activeTab === "mapper") {
      setActiveTab(suppressTerminal ? "logs" : "terminal");
    }
  }, [showMapperTab, activeTab, suppressTerminal]);

  const envVarsKey = useMemo(() => {
    if (!terminalEnvVars) return "";
    return Object.keys(terminalEnvVars)
      .sort()
      .map((k) => `${k}=${terminalEnvVars[k]}`)
      .join("\n");
  }, [terminalEnvVars]);

  const sortedLogs = useMemo(
    () => [...logs].sort((left, right) => right.timestamp.localeCompare(left.timestamp)),
    [logs],
  );

  useEffect(() => {
    if (suppressTerminal && activeTab === "terminal") {
      setActiveTab("logs");
    }
  }, [activeTab, suppressTerminal]);

  useEffect(() => {
    if (openSignal === handledOpenSignalRef.current) return;
    handledOpenSignalRef.current = openSignal;
    setOpen(true);
    if (preferredTab) {
      setActiveTab(preferredTab);
    }
  }, [openSignal, preferredTab]);

  const cancelScheduledFit = () => {
    if (fitFrameRef.current !== null) {
      cancelAnimationFrame(fitFrameRef.current);
      fitFrameRef.current = null;
    }
  };

  const scheduleSafeFitTerminal = () => {
    cancelScheduledFit();
    fitFrameRef.current = requestAnimationFrame(() => {
      fitFrameRef.current = null;
      safeFitTerminal();
    });
  };

  const isTauriRuntime =
    typeof window !== "undefined" &&
    !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

  const safeFitTerminal = () => {
    if (terminalDisposedRef.current || !term.current || !fitAddon.current || !terminalRef.current) return;
    if (terminalRef.current.clientWidth <= 0 || terminalRef.current.clientHeight <= 0) return;
    if (!open || activeTab !== "terminal") return;
    try {
      fitAddon.current.fit();
      term.current.scrollToBottom();
    } catch {
      // ignore transient fit errors when terminal is mounting/unmounting
    }
  };

  const openDetachedTerminalWindow = async () => {
    if (!isTauriRuntime) return;
    try {
      if (typeof window !== "undefined" && typeof BroadcastChannel !== "undefined" && viewId) {
        const channel = new BroadcastChannel(BOTTOM_PANEL_CHANNEL);
        channel.postMessage({ type: "popout-open", viewId, timestamp: Date.now() });
        channel.close();
      }
      await invoke("open_detached_terminal_window", { cwd: projectDir ?? "", viewId: viewId ?? null });
    } catch (error) {
      console.error("Failed to open detached terminal window:", error);
    }
  };

  const persistMapperDragValue = (value: string) => {
    if (typeof window === "undefined" || typeof BroadcastChannel === "undefined") return;
    try {
      const channel = new BroadcastChannel(BOTTOM_PANEL_CHANNEL);
      channel.postMessage({ type: "mapper-drag", value });
      channel.close();
    } catch {
      // ignore broadcast errors
    }
  };

  // During drag, React defers BottomPanel node updates so expensive memos don't recompute every frame.
  const deferredNodes = useDeferredValue(nodes);

  const resourcesInCanvas = useMemo(() => {
    const byResourceId = new Map(resources.map((resource) => [resource.id, resource]));
    const collected: Array<{
      node: Node<CanvasTerraformNodeData>;
      resource: TerraformResource;
      schema?: TerraformNodeSchema;
    }> = [];
    deferredNodes.forEach((node) => {
      const resource = byResourceId.get(node.data.resourceId);
      if (!resource) return;
      const schema = schemas.find((candidate) => candidate.id === resource.schemaId);
      collected.push({ node, resource, schema });
    });
    return collected.sort((left, right) => left.resource.name.localeCompare(right.resource.name));
  }, [deferredNodes, resources, schemas]);

  const selectedMapperItem = useMemo(() => {
    if (!selectedMapperResourceId) return resourcesInCanvas[0];
    return resourcesInCanvas.find((entry) => entry.resource.id === selectedMapperResourceId) ?? resourcesInCanvas[0];
  }, [resourcesInCanvas, selectedMapperResourceId]);

  const selectedMapperProperties = useMemo(
    () => getInspectorPropertiesForSchema(selectedMapperItem?.schema),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [selectedMapperItem?.schema],
  );

  const filteredResourcesInCanvas = useMemo(() => {
    const search = resourceSearch.trim().toLowerCase();
    if (!search) return resourcesInCanvas;
    return resourcesInCanvas.filter(({ resource, schema }) => {
      const haystack = [resource.name, resource.type, resource.schemaId ?? "", schema?.id ?? ""]
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
      const matchesSearch =
        !search ||
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
      if (!sectionMap.has(section)) sectionMap.set(section, []);
      sectionMap.get(section)!.push(property);
    });
    return Array.from(sectionMap.entries())
      .map(([key, properties]) => ({
        key,
        title: key === "root" ? t("bottompanel.mapper.mainSection") : key,
        properties: properties.sort((left, right) => left.name.localeCompare(right.name)),
      }))
      .sort((left, right) => {
        if (left.key === "root") return -1;
        if (right.key === "root") return 1;
        return left.key.localeCompare(right.key);
      });
  }, [filteredMapperProperties, t]);

  const mapperIncomingConnectionMappings = useMemo(() => {
    if (!activeMapperItem) return [] as Array<{ edgeId: string; fromNodeId: string; fromNodeLabel: string; sourceExpression: string; targetAttribute: string }>;
    const targetNodeId = activeMapperItem.node.id;
    const collected: Array<{ edgeId: string; fromNodeId: string; fromNodeLabel: string; sourceExpression: string; targetAttribute: string }> = [];
    edges.forEach((edge) => {
      const mappings = Array.isArray(edge.data?.mappings) ? edge.data.mappings : [];
      mappings
        .filter((mapping) => mapping.toNodeId === targetNodeId)
        .forEach((mapping) => {
          const fromNode = deferredNodes.find((node) => node.id === mapping.fromNodeId);
          collected.push({
            edgeId: edge.id,
            fromNodeId: mapping.fromNodeId,
            fromNodeLabel: mapping.fromNodeLabel ?? fromNode?.data.label ?? mapping.fromNodeId,
            sourceExpression: mapping.sourceExpression,
            targetAttribute: mapping.targetAttribute,
          });
        });
    });
    return collected;
  }, [activeMapperItem, edges, deferredNodes]);

  const mapperIncomingGrouped = useMemo(() => {
    const grouped = new Map<string, { fromNodeLabel: string; entries: Array<{ edgeId: string; sourceExpression: string; targetAttribute: string }> }>();
    mapperIncomingConnectionMappings.forEach((mapping) => {
      if (!grouped.has(mapping.fromNodeId)) {
        grouped.set(mapping.fromNodeId, { fromNodeLabel: mapping.fromNodeLabel, entries: [] });
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
    if (!activeMapperItem?.node.parentNode) return [] as Array<{ containerId: string; containerLabel: string; entries: Array<{ attributeName: string; sourceExpression: string }> }>;
    const nodeById = new Map(deferredNodes.map((n) => [n.id, n]));
    const result: Array<{ containerId: string; containerLabel: string; entries: Array<{ attributeName: string; sourceExpression: string }> }> = [];
    let currentParentId: string | undefined = activeMapperItem.node.parentNode;
    while (currentParentId) {
      const parentNode = nodeById.get(currentParentId);
      if (!parentNode) break;
      const parentResource = resources.find((r) => r.id === parentNode.data.resourceId);
      if (parentResource) {
        const parentSchema = schemas.find((s) => s.id === parentResource.schemaId);
        const parentProps = getInspectorPropertiesForSchema(parentSchema);
        const configuredKeys = Object.keys(parentResource.config.attributes ?? {});
        const schemaKeys = parentProps.map((p) => p.name);
        const allKeys = Array.from(new Set([...schemaKeys, ...configuredKeys])).filter(Boolean).sort((a, b) => a.localeCompare(b));
        const prefix = parentResource.kind === "data" ? "data." : "";
        const baseRef = `${prefix}${parentResource.type}.${parentResource.name}`;
        result.push({
          containerId: parentNode.id,
          containerLabel: parentNode.data.label,
          entries: allKeys.map((attributeName) => ({ attributeName, sourceExpression: `${baseRef}.${attributeName}` })),
        });
      }
      currentParentId = parentNode.parentNode;
    }
    return result;
  }, [activeMapperItem, deferredNodes, resources, schemas]);

  const mapperInheritedFromZones = useMemo(() => {
    if (!activeMapperItem) return [] as Array<{ zoneId: string; zoneLabel: string; entries: Array<{ attributeName: string; sourceExpression: string }> }>;
    const zoneIds = activeMapperItem.node.data.zoneContainerIds ?? [];
    if (!zoneIds.length) return [];
    return zoneIds
      .map((zoneId) => {
        const zoneNode = deferredNodes.find((node) => node.id === zoneId);
        if (!zoneNode) return undefined;
        const zoneResource = resources.find((resource) => resource.id === zoneNode.data.resourceId);
        if (!zoneResource) return undefined;
        const zoneSchema = schemas.find((schema) => schema.id === zoneResource.schemaId);
        const zoneProps = getInspectorPropertiesForSchema(zoneSchema);
        const configuredKeys = Object.keys(zoneResource.config.attributes ?? {});
        const schemaKeys = zoneProps.map((prop) => prop.name);
        const allKeys = Array.from(new Set([...schemaKeys, ...configuredKeys])).filter(Boolean).sort((left, right) => left.localeCompare(right));
        const prefix = zoneResource.kind === "data" ? "data." : "";
        const baseRef = `${prefix}${zoneResource.type}.${zoneResource.name}`;
        return { zoneId, zoneLabel: zoneNode.data.label, entries: allKeys.map((attributeName) => ({ attributeName, sourceExpression: `${baseRef}.${attributeName}` })) };
      })
      .filter((entry): entry is { zoneId: string; zoneLabel: string; entries: Array<{ attributeName: string; sourceExpression: string }> } => !!entry && entry.entries.length > 0);
  }, [activeMapperItem, deferredNodes, resources, schemas]);

  useEffect(() => {
    if (!onHeightChange || !panelRef.current) return;
    const reportPanelHeight = () => {
      if (!panelRef.current) return;
      const measuredHeight = Math.round(panelRef.current.getBoundingClientRect().height);
      if (lastReportedPanelHeightRef.current === measuredHeight) return;
      lastReportedPanelHeightRef.current = measuredHeight;
      onHeightChange(measuredHeight);
    };
    const scheduleReportPanelHeight = () => {
      if (heightNotifyFrameRef.current !== null) return;
      heightNotifyFrameRef.current = requestAnimationFrame(() => {
        heightNotifyFrameRef.current = null;
        reportPanelHeight();
      });
    };
    scheduleReportPanelHeight();
    const observer = new ResizeObserver(() => scheduleReportPanelHeight());
    observer.observe(panelRef.current);
    return () => {
      observer.disconnect();
      if (heightNotifyFrameRef.current !== null) {
        cancelAnimationFrame(heightNotifyFrameRef.current);
        heightNotifyFrameRef.current = null;
      }
    };
  }, [onHeightChange]);

  useEffect(() => {
    if (!enabled || suppressTerminal) return;
    if (!terminalRef.current) return;
    terminalDisposedRef.current = false;
    terminalReadyRef.current = false;
    try {
      term.current = new Terminal({ cursorBlink: true, theme: { background: "#111827" } });
      fitAddon.current = new FitAddon();
      term.current.loadAddon(fitAddon.current);
      term.current.open(terminalRef.current);
    } catch {
      // xterm can fail to initialize its renderer in environments without a
      // real layout (e.g. headless). Abort the terminal mount rather than
      // letting the error tear down the whole workspace.
      term.current = null;
      fitAddon.current = null;
      return;
    }
    setTimeout(() => {
      if (terminalDisposedRef.current) return;
      scheduleSafeFitTerminal();
      term.current?.focus();
      terminalReadyRef.current = true;
    }, 0);
    if (isTauriRuntime) {
      void invoke("init_terminal_session", {
        cwd: projectDir ?? "",
        env: { vars: terminalEnvVars ?? {} },
      }).catch(() => {});
    }
    const currentWindowLabel = getCurrentWindow().label;
    const onDataDisposable = term.current.onData((data: string) => {
      if (terminalDisposedRef.current) return;
      // While an in-app terraform process is running, the PTY shell can't reach
      // it, so terminal input must target the terraform process directly instead
      // of being written to the shell (where e.g. "yes" would run as a command).
      if (isTerraformRunningRef.current) {
        // Ctrl+C cancels the terraform process.
        if (data === "\x03") {
          terraformInputBufferRef.current = "";
          void invoke("terraform_cancel").catch(() => {});
          try { term.current?.write("\r\n\x1b[33m^C → terraform_cancel\x1b[0m\r\n"); } catch {}
          return;
        }
        // `data` can be a single keystroke or a multi-char paste, possibly with
        // embedded newlines. Process char-by-char: buffer printable text (with
        // local echo, since terraform's stdin is a pipe, not a TTY) and forward
        // each completed line to terraform's stdin on Enter.
        for (const char of data) {
          if (char === "\r" || char === "\n") {
            const line = terraformInputBufferRef.current;
            terraformInputBufferRef.current = "";
            try { term.current?.write("\r\n"); } catch {}
            void invoke("terraform_confirm", { input: line }).catch(() => {});
          } else if (char === "\x7f" || char === "\b") {
            if (terraformInputBufferRef.current.length > 0) {
              terraformInputBufferRef.current = terraformInputBufferRef.current.slice(0, -1);
              try { term.current?.write("\b \b"); } catch {}
            }
          } else if (char >= " ") {
            // Skip other control sequences (arrows, etc.).
            terraformInputBufferRef.current += char;
            try { term.current?.write(char); } catch {}
          }
        }
        return;
      }
      void invoke("write_to_pty", { input: data });
    });
    const unlisten = listen<{ window_label: string; output: string }>("pty-output", (event) => {
      if (terminalDisposedRef.current || !term.current) return;
      if (!terminalReadyRef.current) return;
      if (event.payload.window_label !== currentWindowLabel) return;
      try { term.current.write(event.payload.output); } catch {}
    }).catch(() => () => {});
    const onWindowResize = () => scheduleSafeFitTerminal();
    window.addEventListener("resize", onWindowResize);
    return () => {
      terminalDisposedRef.current = true;
      terminalReadyRef.current = false;
      cancelScheduledFit();
      window.removeEventListener("resize", onWindowResize);
      if (isTauriRuntime) void invoke("close_terminal_session").catch(() => {});
      onDataDisposable.dispose();
      void unlisten.then((f) => f());
      try { term.current?.dispose(); } catch {}
      term.current = null;
      fitAddon.current = null;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [enabled, isTauriRuntime, projectDir, suppressTerminal, envVarsKey]);

  useEffect(() => {
    if (isResizing) return;
    scheduleSafeFitTerminal();
  }, [height, open, activeTab, isResizing]);

  useEffect(() => {
    if (!isTauriRuntime || suppressTerminal) return;
    const currentWindowLabel = getCurrentWindow().label;
    const unlisten = listen<{ window_label: string; output: string }>("terraform-output", (event) => {
      if (event.payload.window_label !== currentWindowLabel) return;
      setOpen(true);
      setActiveTab("terminal");
      if (!terminalReadyRef.current || terminalDisposedRef.current || !term.current) return;
      try { term.current.write(event.payload.output); } catch {}
    }).catch(() => () => {});
    return () => { void unlisten.then((f) => f()); };
  }, [isTauriRuntime, suppressTerminal]);

  useEffect(() => {
    if (activeTab === "terminal") {
      requestAnimationFrame(() => {
        scheduleSafeFitTerminal();
        term.current?.scrollToBottom();
        term.current?.focus();
      });
    }
  }, [activeTab]);

  useEffect(() => {
    if (!terminalRef.current) return;
    const resizeObserver = new ResizeObserver(() => {
      if (isResizing) return;
      scheduleSafeFitTerminal();
    });
    resizeObserver.observe(terminalRef.current);
    return () => { resizeObserver.disconnect(); cancelScheduledFit(); };
  }, [isResizing]);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;
      const rect = panelRef.current.getBoundingClientRect();
      const newHeight = rect.bottom - e.clientY;
      if (newHeight >= BOTTOM_PANEL_MIN_HEIGHT && newHeight <= BOTTOM_PANEL_MAX_HEIGHT) {
        setHeight(newHeight);
        if (activeTab === "terminal") term.current?.scrollToBottom();
      }
    };
    const handleMouseUp = () => {
      document.body.style.userSelect = "";
      document.body.style.cursor = "";
      setIsResizing(false);
      requestAnimationFrame(() => { scheduleSafeFitTerminal(); term.current?.scrollToBottom(); });
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

  const tabBtn = (tab: BottomPanelTab, label: string, disabled = false) => (
    <button
      type="button"
      onClick={() => !disabled && setActiveTab(tab)}
      disabled={disabled}
      className={`relative px-3 h-full text-xs font-medium transition-colors ${
        activeTab === tab
          ? "text-slate-100 after:absolute after:bottom-0 after:left-0 after:right-0 after:h-[2px] after:bg-sky-400 after:rounded-t"
          : disabled
            ? "text-slate-600 cursor-not-allowed"
            : "text-slate-400 hover:text-slate-200"
      }`}
      title={disabled ? t("bottompanel.terminalDetachedTitle") : undefined}
    >
      {label}
      {tab === "logs" && logs.length > 0 && (
        <span className="ml-1.5 rounded-full bg-slate-700 px-1.5 py-0.5 text-[10px] text-slate-300">
          {logs.length}
        </span>
      )}
    </button>
  );

  return (
    <aside
      ref={panelRef}
      style={{ height: open ? height : 0 }}
      className={`relative border-t border-slate-700 bg-[#1e1e1e] flex-none ${isResizing ? "" : "transition-[height] duration-200 ease-out"}`}
      onTransitionEnd={(event) => {
        if (event.propertyName !== "height") return;
        scheduleSafeFitTerminal();
        term.current?.scrollToBottom();
      }}
    >
      <PanelToggleTab
        open={open}
        onClick={(e) => { e.stopPropagation(); setOpen((o) => !o); }}
        edge="top"
        ariaControls="bottom-panel-content"
        ariaLabel={open ? t("bottompanel.aria.close") : t("bottompanel.aria.show")}
        style={{ left: leftOffset + 16, transition: "left 0.2s ease-out" }}
      />

      <div className="overflow-hidden flex flex-col h-full w-full">
        {open && (
          <div
            onMouseDown={(e) => {
              e.preventDefault();
              e.stopPropagation();
              document.body.style.userSelect = "none";
              document.body.style.cursor = "row-resize";
              setIsResizing(true);
            }}
            className="absolute top-0 left-0 w-full h-1 cursor-row-resize bg-transparent hover:bg-sky-500/30 transition-colors"
          />
        )}

        <header className="h-10 shrink-0 border-b border-slate-700 bg-[#252526] flex items-center justify-between px-2">
          <div className="flex h-full items-center gap-0.5">
            {!suppressTerminal && tabBtn("terminal", t("bottompanel.tab.terminal"))}
            {showMapperTab && tabBtn("mapper", t("bottompanel.tab.mapper"))}
            {tabBtn("logs", t("bottompanel.tab.logs"))}
            {suppressTerminal && tabBtn("terminal", t("bottompanel.tab.terminal"), true)}
          </div>

          {showPopoutButton && (
            <button
              type="button"
              onClick={() => void openDetachedTerminalWindow()}
              className="rounded px-2 py-1 text-[11px] text-slate-400 hover:bg-slate-700 hover:text-slate-200 transition-colors"
              title={t("bottompanel.popoutTitle")}
            >
              {t("bottompanel.popout")} ↗
            </button>
          )}
        </header>

        <div id="bottom-panel-content" className="relative flex-1 min-h-0 overflow-hidden">

          <div
            className="absolute inset-0 overflow-hidden"
            style={{ display: activeTab === "terminal" ? "block" : "none" }}
          >
            <div
              className="absolute top-0 left-0 right-0"
              style={{ height: `${BOTTOM_PANEL_TERMINAL_VIEWPORT_HEIGHT}px` }}
            >
              {suppressTerminal ? (
                <div className="h-full w-full bg-[#111827] text-slate-400 flex items-center justify-center text-xs">
                  {t("bottompanel.terminalDetachedMessage")}
                </div>
              ) : (
                <div ref={terminalRef} className="h-full w-full" />
              )}
            </div>
          </div>

          <div
            className="absolute inset-0 overflow-hidden bg-white"
            style={{ display: activeTab === "mapper" ? "flex" : "none", willChange: "transform" }}
          >
            <div className="flex h-full w-full gap-0 overflow-hidden">

              <div className="w-56 shrink-0 border-r border-gray-200 bg-gray-50 flex flex-col overflow-hidden">
                <div className="border-b border-gray-200 p-2">
                  <input
                    value={resourceSearch}
                    onChange={(e) => setResourceSearch(e.target.value)}
                    placeholder={t("bottompanel.mapper.searchResources")}
                    className="w-full rounded border border-gray-200 bg-white px-2 py-1 text-xs text-gray-700 placeholder:text-gray-400 outline-none focus:ring-1 focus:ring-sky-400/60 focus:border-sky-300"
                  />
                </div>

                <div className="flex-1 overflow-auto p-1.5 space-y-0.5">
                  {filteredResourcesInCanvas.length === 0 ? (
                    <div className="px-2 py-3 text-xs text-gray-400">{t("bottompanel.mapper.noResources")}</div>
                  ) : (
                    filteredResourcesInCanvas.map(({ resource }) => {
                      const isActive = activeMapperItem?.resource.id === resource.id;
                      return (
                        <div
                          key={resource.id}
                          role="button"
                          tabIndex={0}
                          onClick={() => setSelectedMapperResourceId(resource.id)}
                          onKeyDown={(e) => { if (e.key === "Enter" || e.key === " ") setSelectedMapperResourceId(resource.id); }}
                          className={`w-full cursor-pointer rounded px-2 py-1.5 text-xs font-medium text-gray-900 select-none ${
                            isActive ? "bg-sky-100 text-sky-800" : "bg-gray-50"
                          }`}
                        >
                          <div className="truncate">{resource.name}</div>
                        </div>
                      );
                    })
                  )}
                </div>
              </div>

              <div className="flex-1 min-w-0 flex flex-col overflow-hidden bg-gray-50">
                {!activeMapperItem ? (
                  <div className="flex h-full items-center justify-center text-xs text-gray-400">
                    {t("bottompanel.mapper.selectResource")}
                  </div>
                ) : (
                  <>
                    <div className="shrink-0 border-b border-gray-200 bg-white">
                      <div className="flex items-center gap-3 px-3 py-1.5">
                        <div className="flex items-center gap-1.5 min-w-0">
                          <span className="rounded bg-sky-100 px-1.5 py-0.5 text-[10px] font-semibold text-sky-700 shrink-0">
                            {activeMapperItem.resource.kind ?? "resource"}
                          </span>
                          <span className="text-xs font-bold text-gray-900 truncate">
                            {activeMapperItem.resource.name}
                          </span>
                          <span className="text-[10px] text-gray-400 truncate hidden sm:block">
                            · {activeMapperItem.resource.type}
                          </span>
                        </div>
                        <div className="ml-auto flex rounded-md bg-gray-100 p-0.5 gap-0.5">
                          {(["properties", "connections", "container", "zones"] as const).map((src) => (
                            <button
                              key={src}
                              type="button"
                              onClick={() => setMapperSourceFilter(src)}
                              className={`rounded px-2 py-0.5 text-[11px] font-medium transition-colors ${
                                mapperSourceFilter === src
                                  ? "bg-white text-gray-900 shadow-sm"
                                  : "text-gray-500 hover:text-gray-700"
                              }`}
                            >
                              {t(`bottompanel.mapper.source.${src}`)}
                            </button>
                          ))}
                        </div>
                      </div>

                      {mapperSourceFilter === "properties" && (
                        <div className="border-t border-gray-100 px-3 py-1.5 flex items-center gap-1 flex-wrap">
                          <input
                            value={attributeSearch}
                            onChange={(e) => setAttributeSearch(e.target.value)}
                            placeholder={t("bottompanel.mapper.filter")}
                            className="w-24 rounded border border-gray-200 bg-gray-50 px-2 py-0.5 text-[11px] text-gray-700 placeholder:text-gray-400 outline-none focus:ring-1 focus:ring-sky-400/60"
                          />
                          {(["required", "optional", "computed"] as const).map((state) => {
                            const active = attributeStateFilters.includes(state);
                            const colors = {
                              required: active ? "bg-red-50 text-red-600 ring-red-200" : "text-gray-500 hover:text-gray-700",
                              optional: active ? "bg-gray-100 text-gray-700 ring-gray-300" : "text-gray-500 hover:text-gray-700",
                              computed: active ? "bg-amber-50 text-amber-600 ring-amber-200" : "text-gray-500 hover:text-gray-700",
                            }[state];
                            return (
                              <button
                                key={state}
                                type="button"
                                onClick={() =>
                                  setAttributeStateFilters((cur) =>
                                    cur.includes(state) ? cur.filter((i) => i !== state) : [...cur, state],
                                  )
                                }
                                className={`rounded px-2 py-0.5 text-[11px] font-medium transition-colors ring-1 ring-transparent ${colors}`}
                              >
                                {t(`bottompanel.mapper.state.${state}`)}
                              </button>
                            );
                          })}

                          <div className="relative">
                            <button
                              type="button"
                              onClick={() => setShowTypeMenu((c) => !c)}
                              className={`rounded px-2 py-0.5 text-[11px] font-medium transition-colors ring-1 ring-transparent ${
                                attributeTypeFilters.length > 0
                                  ? "bg-sky-50 text-sky-700 ring-sky-200"
                                  : "text-gray-500 hover:text-gray-700"
                              }`}
                            >
                              {t("bottompanel.mapper.type")}{attributeTypeFilters.length > 0 ? ` (${attributeTypeFilters.length})` : ""}
                            </button>
                            {showTypeMenu && (
                              <div className="absolute right-0 top-full z-30 mt-1 w-40 rounded border border-gray-200 bg-white p-2 shadow-lg">
                                <div className="mb-1.5 flex items-center justify-between">
                                  <span className="text-[10px] font-semibold uppercase tracking-wide text-gray-400">{t("bottompanel.mapper.types")}</span>
                                  <button
                                    type="button"
                                    onClick={() => setAttributeTypeFilters([])}
                                    className="text-[10px] text-sky-600 hover:text-sky-500"
                                  >
                                    {t("bottompanel.mapper.clear")}
                                  </button>
                                </div>
                                <div className="max-h-40 space-y-1 overflow-auto">
                                  {availableTypeOptions.map((typeOption) => (
                                    <label
                                      key={typeOption}
                                      className="flex cursor-pointer items-center gap-2 rounded px-1 py-0.5 text-[11px] text-gray-700 hover:bg-gray-50"
                                    >
                                      <input
                                        type="checkbox"
                                        checked={attributeTypeFilters.includes(typeOption)}
                                        onChange={() =>
                                          setAttributeTypeFilters((cur) =>
                                            cur.includes(typeOption)
                                              ? cur.filter((i) => i !== typeOption)
                                              : [...cur, typeOption],
                                          )
                                        }
                                        className="accent-sky-500"
                                      />
                                      {typeOption}
                                    </label>
                                  ))}
                                </div>
                              </div>
                            )}
                          </div>
                        </div>
                      )}
                    </div>

                    <div className="flex-1 min-h-0 overflow-auto p-2">

                      {mapperSourceFilter === "properties" && (
                        <div className="space-y-2">
                          {groupedMapperProperties.length === 0 ? (
                            <div className="rounded border border-dashed border-gray-300 p-3 text-center text-xs text-gray-400">
                              {t("bottompanel.mapper.noAttributesMatch")}
                            </div>
                          ) : (
                            groupedMapperProperties.map((group) => (
                              <div key={group.key}>
                                <div className="mb-1 flex items-center gap-2 select-none">
                                  <span className="text-xs font-semibold text-gray-500 antialiased shrink-0">
                                    {group.title}
                                  </span>
                                  <div className="flex-1 border-t border-gray-200" />
                                  <span className="text-[10px] text-gray-400 antialiased shrink-0">{group.properties.length}</span>
                                </div>

                                <div className="grid grid-cols-1 gap-1.5 md:grid-cols-2 xl:grid-cols-3">
                                  {group.properties.map((property) => {
                                    const resourcePrefix =
                                      activeMapperItem.resource.kind === "data"
                                        ? `data.${activeMapperItem.resource.type}`
                                        : activeMapperItem.resource.type;
                                    const refPrefix = `${resourcePrefix}.${activeMapperItem.resource.name}`;
                                    const mapperValue = `${refPrefix}.${property.name}`;
                                    const fieldName = property.name.split(".").pop() ?? property.name;

                                    return (
                                      <div
                                        key={property.name}
                                        className="group rounded border border-gray-200 bg-white p-2 shadow-sm hover:shadow transition-shadow"
                                      >
                                        <div className="mb-1 flex items-center gap-1 min-w-0">
                                          <span className="flex-1 truncate text-[11px] font-semibold text-gray-900" title={property.name}>
                                            {fieldName}
                                          </span>
                                          <span className={`shrink-0 rounded px-1 py-0.5 text-[9px] font-semibold uppercase ${property.required ? "bg-red-50 text-red-600" : "bg-gray-100 text-gray-500"}`}>
                                            {property.required ? t("bottompanel.mapper.badge.required") : t("bottompanel.mapper.badge.optional")}
                                          </span>
                                          {property.computed && (
                                            <span className="shrink-0 rounded bg-amber-50 px-1 py-0.5 text-[9px] font-semibold uppercase text-amber-600">
                                              {t("bottompanel.mapper.badge.computed")}
                                            </span>
                                          )}
                                        </div>

                                        <div className="mb-1.5 truncate text-[10px] text-gray-400 font-mono" title={property.type}>
                                          {property.type}
                                        </div>

                                        <div className="flex items-center gap-1">
                                          <div
                                            className="flex-1 min-w-0 flex items-center gap-1 rounded border border-dashed border-sky-300 bg-sky-50 px-1.5 py-1 text-[10px] text-sky-700 cursor-grab hover:border-sky-400 hover:bg-sky-100 transition-colors"
                                            draggable
                                            onDragStart={(event) => {
                                              persistMapperDragValue(mapperValue);
                                              event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, mapperValue);
                                              event.dataTransfer.setData("text/plain", mapperValue);
                                              event.dataTransfer.effectAllowed = "copy";
                                            }}
                                            title={t("bottompanel.mapper.dragHint", { value: mapperValue })}
                                          >
                                            <span className="shrink-0 text-sky-400 select-none">⠿</span>
                                            <span className="truncate font-mono">{mapperValue}</span>
                                          </div>
                                          <button
                                            type="button"
                                            onClick={async () => {
                                              try { await navigator.clipboard.writeText(mapperValue); } catch {}
                                            }}
                                            className="shrink-0 rounded border border-gray-200 px-1.5 py-1 text-[10px] text-gray-400 hover:bg-gray-100 hover:text-gray-700 transition-colors"
                                            title={t("bottompanel.mapper.copyReference")}
                                          >
                                            ⎘
                                          </button>
                                        </div>
                                      </div>
                                    );
                                  })}
                                </div>
                              </div>
                            ))
                          )}
                        </div>
                      )}

                      {mapperSourceFilter === "connections" && (
                        <div>
                          {mapperIncomingGrouped.length === 0 ? (
                            <div className="rounded border border-dashed border-gray-300 p-3 text-center text-xs text-gray-400">
                              {t("bottompanel.mapper.noIncoming")}
                            </div>
                          ) : (
                            <div className="space-y-2">
                              {mapperIncomingGrouped.map((group) => (
                                <div key={group.fromNodeLabel} className="rounded border border-gray-200 bg-white p-2 shadow-sm">
                                  <div className="mb-1.5 text-[11px] font-semibold text-gray-700">{group.fromNodeLabel}</div>
                                  <div className="flex flex-wrap gap-1">
                                    {group.entries.map((entry, index) => (
                                      <div
                                        key={`${entry.edgeId}-${entry.targetAttribute}-${index}`}
                                        className="rounded border border-sky-200 bg-sky-50 px-2 py-1 text-[10px] text-sky-700 font-mono cursor-grab hover:border-sky-300 hover:bg-sky-100 transition-colors"
                                        draggable
                                        onDragStart={(event) => {
                                          persistMapperDragValue(entry.sourceExpression);
                                          event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, entry.sourceExpression);
                                          event.dataTransfer.setData("text/plain", entry.sourceExpression);
                                          event.dataTransfer.effectAllowed = "copy";
                                        }}
                                        title={`→ ${entry.targetAttribute}`}
                                      >
                                        ⠿ {entry.sourceExpression}
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
                        <div>
                          {mapperInheritedFromContainer.length === 0 ? (
                            <div className="rounded border border-dashed border-gray-300 p-3 text-center text-xs text-gray-400">
                              {t("bottompanel.mapper.noContainer")}
                            </div>
                          ) : (
                            <div className="space-y-2">
                              {mapperInheritedFromContainer.map((container) => (
                                <div key={container.containerId} className="rounded border border-gray-200 bg-white p-2 shadow-sm">
                                  <div className="mb-1.5 text-[11px] font-semibold text-gray-700">{container.containerLabel}</div>
                                  <div className="flex flex-wrap gap-1">
                                    {container.entries.map((item) => (
                                      <div
                                        key={item.sourceExpression}
                                        className="rounded border border-emerald-200 bg-emerald-50 px-2 py-1 text-[10px] text-emerald-700 font-mono cursor-grab hover:border-emerald-300 hover:bg-emerald-100 transition-colors"
                                        draggable
                                        onDragStart={(event) => {
                                          persistMapperDragValue(item.sourceExpression);
                                          event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, item.sourceExpression);
                                          event.dataTransfer.setData("text/plain", item.sourceExpression);
                                          event.dataTransfer.effectAllowed = "copy";
                                        }}
                                      >
                                        ⠿ {item.sourceExpression}
                                      </div>
                                    ))}
                                  </div>
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      )}

                      {mapperSourceFilter === "zones" && (
                        <div>
                          {mapperInheritedFromZones.length === 0 ? (
                            <div className="rounded border border-dashed border-gray-300 p-3 text-center text-xs text-gray-400">
                              {t("bottompanel.mapper.noZones")}
                            </div>
                          ) : (
                            <div className="space-y-2">
                              {mapperInheritedFromZones.map((zone) => (
                                <div key={zone.zoneId} className="rounded border border-gray-200 bg-white p-2 shadow-sm">
                                  <div className="mb-1.5 text-[11px] font-semibold text-gray-700">{zone.zoneLabel}</div>
                                  <div className="flex flex-wrap gap-1">
                                    {zone.entries.map((item) => (
                                      <div
                                        key={item.sourceExpression}
                                        className="rounded border border-violet-200 bg-violet-50 px-2 py-1 text-[10px] text-violet-700 font-mono cursor-grab hover:border-violet-300 hover:bg-violet-100 transition-colors"
                                        draggable
                                        onDragStart={(event) => {
                                          persistMapperDragValue(item.sourceExpression);
                                          event.dataTransfer.setData(OBJECT_MAPPER_REF_MIME, item.sourceExpression);
                                          event.dataTransfer.setData("text/plain", item.sourceExpression);
                                          event.dataTransfer.effectAllowed = "copy";
                                        }}
                                      >
                                        ⠿ {item.sourceExpression}
                                      </div>
                                    ))}
                                  </div>
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      )}

                    </div>
                  </>
                )}
              </div>
            </div>
          </div>

          <div
            className="absolute inset-0 overflow-auto bg-white p-2"
            style={{ display: activeTab === "logs" ? "block" : "none" }}
          >
            {sortedLogs.length === 0 ? (
              <div className="rounded border border-dashed border-gray-200 p-3 text-center text-xs text-gray-400">
                {t("bottompanel.logs.empty")}
              </div>
            ) : (
              <div className="space-y-1.5">
                {sortedLogs.map((log) => {
                  const levelStyles = {
                    error:   { bar: "bg-red-500",     title: "text-red-600",     row: "bg-red-50 border-red-200" },
                    warning: { bar: "bg-amber-500",   title: "text-amber-600",   row: "bg-amber-50 border-amber-200" },
                    success: { bar: "bg-emerald-500", title: "text-emerald-600", row: "bg-emerald-50 border-emerald-200" },
                    info:    { bar: "bg-slate-400",   title: "text-slate-600",   row: "bg-gray-50 border-gray-200" },
                  }[log.level] ?? { bar: "bg-slate-400", title: "text-slate-600", row: "bg-gray-50 border-gray-200" };

                  return (
                    <div key={log.id} className={`flex gap-0 rounded border overflow-hidden ${levelStyles.row}`}>
                      <div className={`w-1 shrink-0 ${levelStyles.bar}`} />
                      <div className="flex-1 min-w-0 px-2.5 py-1.5">
                        <div className="flex items-center justify-between gap-2 mb-0.5">
                          <span className={`text-[10px] font-bold uppercase tracking-wide ${levelStyles.title}`}>
                            {log.level}
                          </span>
                          <span className="text-[10px] text-gray-400 shrink-0">
                            {new Date(log.timestamp).toLocaleTimeString()}
                          </span>
                        </div>
                        <div className="text-xs font-semibold text-gray-900">{log.title}</div>
                        {(log.fileName || typeof log.line === "number") && (
                          <div className="mt-0.5 text-[10px] text-gray-400 font-mono">
                            {log.fileName ?? "terraform"}{typeof log.line === "number" ? `:${log.line}` : ""}
                          </div>
                        )}
                        <div className="mt-0.5 whitespace-pre-wrap text-[11px] text-gray-600">{log.message}</div>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>

        </div>
      </div>
    </aside>
  );
}
