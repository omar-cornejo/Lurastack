import { useCallback, useEffect, useRef, useState } from "react";
import { useUndoRedo } from "../hooks/useUndoRedo";
import Header from "./Header";
import { LeftPanel } from "./LeftPanel";
import CenterPanel from "./CenterPanel";
import { RightPanel } from "./RightPanel";
import BottomPanel from "./BottomPanel";
import CodePanel from "./CodePanel";
import AwsCredentialsModal from "./AwsCredentialsModal";
import { TerraformProject, TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import { writeTextFile, BaseDirectory } from "@tauri-apps/plugin-fs";
import { invoke } from "@tauri-apps/api/core";
import { listen } from "@tauri-apps/api/event";
import { getCurrentWindow } from "@tauri-apps/api/window";
import {
  addEdge,
  applyNodeChanges,
  useEdgesState,
  useNodesState,
  type NodeChange,
  type Node,
  type NodeDragHandler,
  type XYPosition,
  type Connection,
  type Edge,
} from "reactflow";
import type {
  CanvasEdgeData,
  CanvasEdgeMapping,
  CanvasTerraformNodeData,
  PlanAction,
  ResourcePlanChange,
} from "../canvas/types";
import {
  applyZoneContainerMemberships,
  applyManualContainerResizeEffects,
  placeCanvasNodeFromUserAction,
  reparentCanvasNodeAfterDrag,
} from "../commands/placeCanvasNode";
import { createTerraformResourceFromSchema } from "../models/terraform/createTerraformResource";
import { warn } from "../commands/warn";
import { NODE_SCHEMAS } from "../models/nodeRegistry";
import {
  isSubnetIconPath,
  resolveTerraformIcon,
  SUBNET_PRIVATE_ICON_PATH,
} from "../models/iconRegistry";
import {
  CONTAINER_SCHEMA_IDS,
  DEFAULT_CONTAINER_SIZE,
  DEFAULT_RESOURCE_NODE_SIZE,
} from "../commands/createCanvasNode";
import type { DdfCodeFile, DdfViewSnapshot } from "../types/project";
import type { BottomPanelLogEntry } from "../types/logs";
import { snapshotNodes, snapshotEdges, restoreNodes, restoreEdges } from "../commands/projectManager";
import { useAwsCredentials } from "../hooks/useAwsCredentials";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";
import { sileo } from "sileo";

const BOTTOM_PANEL_CHANNEL = "ddf-bottompanel-sync";
const POPOUT_HEARTBEAT_TTL_MS = 900;
const POPOUT_HEARTBEAT_CHECK_MS = 250;

type WorkspaceViewProps = {
  viewId: string;
  viewName?: string;
  projectDir?: string;
  isVisible?: boolean;
  initialState?: DdfViewSnapshot;
  onStateChange?: (viewId: string, snapshot: DdfViewSnapshot) => void;
};

type HclBlockNode = {
  attributes: Record<string, unknown>;
  blocks: Record<string, HclBlockNode>;
};

const isPlainObject = (value: unknown): value is Record<string, unknown> =>
  typeof value === "object" && value !== null && !Array.isArray(value);

const isMeaningfulValue = (value: unknown): boolean => {
  if (value === undefined || value === null) return false;
  if (typeof value === "string") return value.trim().length > 0;
  if (Array.isArray(value)) return value.length > 0;
  if (isPlainObject(value)) return Object.keys(value).length > 0;
  return true;
};

const isObjectCollectionType = (rawType: unknown): boolean => {
  if (!Array.isArray(rawType) || rawType.length < 2) return false;
  const [container, inner] = rawType as [unknown, unknown];
  if (container !== "set" && container !== "list") return false;
  return Array.isArray(inner) && inner[0] === "object";
};

// Converts flat dotted keys for set(object(...)) / list(object(...)) schema properties
// into array-of-objects format, so the store stays canonical for the info tab UI.
// e.g. { "route.carrier_gateway_id": "sd", "route.cidr_block": "10.0.0.0/8" }
//   → { route: [{ carrier_gateway_id: "sd", cidr_block: "10.0.0.0/8" }] }
// parsedBlockAttributes: the raw attributes from the CodePanel parser — used to detect
// when an object-collection block was completely removed (no dotted keys present) so
// the array entry can be cleared from the store.
const normalizeDottedKeysToArrayFormat = (
  attributes: Record<string, unknown>,
  schema: import("../models/nodeRegistry").TerraformNodeSchema | undefined,
  parsedBlockAttributes?: Record<string, unknown>,
): Record<string, unknown> => {
  if (!schema) return attributes;

  const properties = getInspectorPropertiesForSchema(schema);
  const objectCollectionProps = new Map<string, unknown>(
    properties
      .filter((p) => isObjectCollectionType(p.rawType))
      .map((p) => [p.name, p.rawType]),
  );

  if (!objectCollectionProps.size) return attributes;

  const result: Record<string, unknown> = {};
  const blockAccumulators = new Map<string, Array<Record<string, unknown>>>();

  Object.entries(attributes).forEach(([key, value]) => {
    const dotIdx = key.indexOf(".");
    if (dotIdx === -1) {
      result[key] = value;
      return;
    }
    const blockName = key.slice(0, dotIdx);
    const fieldName = key.slice(dotIdx + 1);
    if (!objectCollectionProps.has(blockName)) {
      result[key] = value;
      return;
    }
    if (!blockAccumulators.has(blockName)) {
      blockAccumulators.set(blockName, [{}]);
    }
    const entries = blockAccumulators.get(blockName)!;
    entries[0]![fieldName] = value;
  });

  blockAccumulators.forEach((entries, blockName) => {
    result[blockName] = entries;
  });

  // If parsedBlockAttributes is provided, remove array-format keys for object-collection
  // properties that had no dotted keys in the parsed HCL (user deleted the whole block).
  if (parsedBlockAttributes) {
    objectCollectionProps.forEach((_, blockName) => {
      const hasDottedKey = Object.keys(parsedBlockAttributes).some(
        (k) => k === `${blockName}.` || k.startsWith(`${blockName}.`),
      );
      if (!hasDottedKey && Object.prototype.hasOwnProperty.call(result, blockName)) {
        delete result[blockName];
      }
    });
  }

  return result;
};

type CanvasViewportBounds = {
  minX: number;
  maxX: number;
  minY: number;
  maxY: number;
};

export default function WorkspaceView({
  viewId,
  viewName = "View",
  projectDir,
  isVisible = true,
  initialState,
  onStateChange,
}: WorkspaceViewProps) {
  const TERRAFORM_REF_PATTERN = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+(?:\.[a-zA-Z0-9_]+)+$/;
  const [activeSection, setActiveSection] = useState<"canvas" | "code" | "diff" | "cloud">("canvas");
  const [cloudProvider, setCloudProvider] = useState<"aws">("aws");
  const [providerRegion] = useState("eu-south-2");

  const [nodes, setNodes] = useNodesState<CanvasTerraformNodeData>(
    initialState ? restoreNodes(initialState.nodes) : [],
  );
  const [edges, setEdges, onEdgesChange] = useEdgesState<CanvasEdgeData>(
    initialState ? restoreEdges(initialState.edges) : [],
  );
  const nodesRef = useRef(nodes);
  const edgesRef = useRef(edges);
  const projectRef = useRef<TerraformProject>({ provider: "registry.terraform.io/hashicorp/aws", resources: [] });
  const activeSectionRef = useRef(activeSection);
  const activeDragNodeIdRef = useRef<string | null>(null);
  const dragSubtreeSnapshotRef = useRef<
    Map<string, { parentNode?: string; position: { x: number; y: number } }> | null
  >(null);
  const [project, setProject] = useState<TerraformProject>({
    provider: "registry.terraform.io/hashicorp/aws",
    resources: initialState?.resources ?? [],
  });
  const [codeFiles, setCodeFiles] = useState<DdfCodeFile[]>(initialState?.codeFiles ?? []);
  const [selectedNodeId, setSelectedNodeId] = useState<string | undefined>(undefined);
  const [codeLogs, setCodeLogs] = useState<BottomPanelLogEntry[]>([]);
  const [bottomOpenSignal, setBottomOpenSignal] = useState(0);
  const [bottomPreferredTab, setBottomPreferredTab] = useState<"terminal" | "logs">("terminal");
  const [terminalPoppedOut, setTerminalPoppedOut] = useState(false);
  const [isDeploying, setIsDeploying] = useState(false);
  const [pendingDeployConfirmation, setPendingDeployConfirmation] = useState<
    "terraform_apply" | "terraform_destroy" | null
  >(null);
  const [showAwsConfig, setShowAwsConfig] = useState(false);
  const [rightPanelOverlayOffset, setRightPanelOverlayOffset] = useState(0);
  const [isRightPanelOverlayResizing, setIsRightPanelOverlayResizing] = useState(false);
  const [leftPanelWidth, setLeftPanelWidth] = useState(0);
  const [canvasViewportBounds, setCanvasViewportBounds] = useState<CanvasViewportBounds | null>(null);
  const hclPersistenceDisabledRef = useRef(false);
  const bottomPanelChannelRef = useRef<BroadcastChannel | null>(null);
  const lastPopoutHeartbeatRef = useRef<number>(0);
  const { credentials: awsCredentials, save: saveAwsCredentials, isConfigured: awsConfigured } = useAwsCredentials();
  const [planChanges, setPlanChanges] = useState<Map<string, ResourcePlanChange>>(new Map());
  const planBufferRef = useRef("");
  const planCurrentAddressRef = useRef<string | null>(null);
  const [cloudState, setCloudState] = useState<Map<string, Record<string, unknown>>>(new Map());
  const [cloudStateAvailable, setCloudStateAvailable] = useState(false);
  const [cloudStateLoading, setCloudStateLoading] = useState(false);

  const { pushSnapshot, undo, redo } = useUndoRedo();

  // Keep refs in sync with current state so keyboard handler always reads latest
  nodesRef.current = nodes;
  edgesRef.current = edges;
  projectRef.current = project;
  activeSectionRef.current = activeSection;

  const getCurrentSnapshot = useCallback(
    () => ({ nodes: nodesRef.current, edges: edgesRef.current, project: projectRef.current }),
    [],
  );

  const restoreSnapshot = useCallback(
    (snapshot: { nodes: typeof nodes; edges: typeof edges; project: TerraformProject }) => {
      setNodes(snapshot.nodes);
      setEdges(snapshot.edges);
      setProject(snapshot.project);
      void saveProjectToHCL(snapshot.project);
    },
    [setNodes, setEdges],
  );

  // Keyboard undo/redo — skip when focus is inside a text input to avoid fighting native browser undo
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (activeSectionRef.current === "diff") return;
      const ctrl = e.ctrlKey || e.metaKey;
      if (!ctrl) return;
      const target = e.target as HTMLElement;
      const isEditing =
        target.tagName === "INPUT" ||
        target.tagName === "TEXTAREA" ||
        target.isContentEditable;
      if (isEditing) return;
      if (e.key === "z" && !e.shiftKey) {
        e.preventDefault();
        undo(getCurrentSnapshot(), restoreSnapshot);
      } else if (e.key === "y" || (e.key === "z" && e.shiftKey)) {
        e.preventDefault();
        redo(getCurrentSnapshot(), restoreSnapshot);
      }
    };
    window.addEventListener("keydown", handleKeyDown);
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [undo, redo, getCurrentSnapshot, restoreSnapshot]);

  const broadcastBottomPanelState = useCallback(() => {
    if (!bottomPanelChannelRef.current) return;
    bottomPanelChannelRef.current.postMessage({
      type: "state-sync",
      viewId,
      payload: {
        nodes,
        edges,
        resources: project.resources,
        logs: codeLogs,
        projectDir,
        updatedAt: Date.now(),
      },
    });
  }, [codeLogs, edges, nodes, project.resources, projectDir, viewId]);

  useEffect(() => {
    broadcastBottomPanelState();
  }, [broadcastBottomPanelState]);

  // Parse terraform plan output to extract per-resource and per-attribute actions
  useEffect(() => {
    const hasTauri = typeof window !== "undefined" &&
      !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;
    if (!hasTauri) return;
    const headerRe = /^\s{2}#\s+(\S+)\s+(?:will be (created|destroyed|updated in-place)|must be replaced)/;
    const attrRe   = /^      ([+~-])\s+(\w+)/;
    const blockEndRe = /^\s{0,4}\}/;
    const currentWindowLabel = getCurrentWindow().label;

    const unlisten = listen<{ window_label: string; output: string }>(
      "terraform-output",
      (event) => {
        if (event.payload.window_label !== currentWindowLabel) return;
        planBufferRef.current += event.payload.output;
        const lines = planBufferRef.current.split("\n");
        planBufferRef.current = lines.pop() ?? "";

        const resourceUpdates: Array<[string, PlanAction]> = [];
        const attrUpdates: Array<[string, string, PlanAction]> = [];

        for (const line of lines) {
          const headerMatch = headerRe.exec(line);
          if (headerMatch) {
            planCurrentAddressRef.current = headerMatch[1];
            const verb = headerMatch[2];
            const action: PlanAction = verb === "created" ? "create" : verb === "destroyed" ? "destroy" : "change";
            resourceUpdates.push([headerMatch[1], action]);
            continue;
          }
          if (blockEndRe.test(line)) {
            planCurrentAddressRef.current = null;
            continue;
          }
          if (planCurrentAddressRef.current) {
            const attrMatch = attrRe.exec(line);
            if (attrMatch) {
              const symbol = attrMatch[1];
              const attrName = attrMatch[2];
              const action: PlanAction = symbol === "+" ? "create" : symbol === "-" ? "destroy" : "change";
              attrUpdates.push([planCurrentAddressRef.current, attrName, action]);
            }
          }
        }

        if (resourceUpdates.length > 0 || attrUpdates.length > 0) {
          setPlanChanges((prev) => {
            const next = new Map(prev);
            for (const [addr, action] of resourceUpdates) {
              next.set(addr, { action, attrActions: new Map() });
            }
            for (const [addr, attrName, action] of attrUpdates) {
              const existing = next.get(addr);
              if (existing) {
                const attrActions = new Map(existing.attrActions ?? []);
                attrActions.set(attrName, action);
                next.set(addr, { ...existing, attrActions });
              }
            }
            return next;
          });
        }
      },
    );
    return () => { void unlisten.then((fn) => fn()); };
  }, []);

  // Sync planAction into node data when planChanges or activeSection changes
  useEffect(() => {
    setNodes((currentNodes) =>
      currentNodes.map((node) => {
        const resource = project.resources.find((r) => r.id === node.data.resourceId);
        const action = resource && activeSection === "diff"
          ? planChanges.get(`${resource.type}.${resource.name}`)?.action
          : undefined;
        if (node.data.planAction === action) return node;
        return { ...node, data: { ...node.data, planAction: action } };
      }),
    );
  }, [planChanges, activeSection, project.resources, setNodes]);

  // Sync cloudPresence into node data when cloudState or activeSection changes
  useEffect(() => {
    setNodes((currentNodes) =>
      currentNodes.map((node) => {
        const resource = project.resources.find((r) => r.id === node.data.resourceId);
        const presence: "present" | "missing" | undefined = (resource && activeSection === "cloud")
          ? (cloudState.has(`${resource.type}.${resource.name}`) ? "present" : "missing")
          : undefined;
        if (node.data.cloudPresence === presence) return node;
        return { ...node, data: { ...node.data, cloudPresence: presence } };
      }),
    );
  }, [cloudState, activeSection, project.resources, setNodes]);

  useEffect(() => {
    if (typeof BroadcastChannel === "undefined") return;

    const channel = new BroadcastChannel(BOTTOM_PANEL_CHANNEL);
    bottomPanelChannelRef.current = channel;

    const evaluatePopoutState = () => {
      const isHeartbeatFresh =
        lastPopoutHeartbeatRef.current > 0 &&
        Date.now() - lastPopoutHeartbeatRef.current <= POPOUT_HEARTBEAT_TTL_MS;
      setTerminalPoppedOut(isHeartbeatFresh);
    };

    channel.onmessage = (event: MessageEvent) => {
      const message = event.data as
        | {
            type?: string;
            viewId?: string;
            timestamp?: number;
          }
        | undefined;

      if (!message || message.viewId !== viewId) return;

      if (message.type === "popout-open" || message.type === "heartbeat") {
        lastPopoutHeartbeatRef.current = message.timestamp ?? Date.now();
        evaluatePopoutState();
        return;
      }

      if (message.type === "popout-close") {
        lastPopoutHeartbeatRef.current = 0;
        setTerminalPoppedOut(false);
        return;
      }

      if (message.type === "state-request") {
        broadcastBottomPanelState();
      }
    };

    const interval = window.setInterval(evaluatePopoutState, POPOUT_HEARTBEAT_CHECK_MS);

    broadcastBottomPanelState();

    return () => {
      window.clearInterval(interval);
      channel.close();
      bottomPanelChannelRef.current = null;
    };
  }, [broadcastBottomPanelState, viewId]);

  // Report state changes for project save / autosave
  useEffect(() => {
    if (!onStateChange) return;
    const timeout = setTimeout(() => {
      onStateChange(viewId, {
        id: viewId,
        name: viewName,
        resources: project.resources,
        nodes: snapshotNodes(nodes),
        edges: snapshotEdges(edges),
        codeFiles,
      });
    }, 800);
    return () => clearTimeout(timeout);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [nodes, edges, project.resources, codeFiles]);

  const buildSubtreeSnapshot = useCallback(
    (rootId: string) => {
      const nodeById = new Map(nodes.map((node) => [node.id, node]));
      const snapshot = new Map<
        string,
        { parentNode?: string; position: { x: number; y: number } }
      >();

      const stack = [rootId];
      while (stack.length > 0) {
        const currentId = stack.pop();
        if (!currentId) continue;

        const node = nodeById.get(currentId);
        if (!node) continue;

        snapshot.set(currentId, {
          parentNode: node.parentNode,
          position: { ...node.position },
        });

        nodes.forEach((candidate) => {
          if (candidate.parentNode === currentId) {
            stack.push(candidate.id);
          }
        });
      }

      return snapshot;
    },
    [nodes],
  );

  const restoreSubtreeFromSnapshot = useCallback(
    (
      currentNodes: Node<CanvasTerraformNodeData>[],
      snapshot: Map<string, { parentNode?: string; position: { x: number; y: number } }>,
      draggedRootId: string,
    ) =>
      currentNodes.map((node) => {
        if (node.id === draggedRootId) return node;

        const saved = snapshot.get(node.id);
        if (!saved) return node;

        if (
          node.parentNode === saved.parentNode &&
          node.position.x === saved.position.x &&
          node.position.y === saved.position.y
        ) {
          return node;
        }

        return {
          ...node,
          parentNode: saved.parentNode,
          position: { ...saved.position },
        };
      }),
    [],
  );

  const onConnect = useCallback(
    (connection: Connection) => {
      pushSnapshot(getCurrentSnapshot());
      setEdges((currentEdges) =>
        addEdge(
          {
            ...connection,
            type: "mappingEdge",
            data: { mappings: [] },
          },
          currentEdges,
        ),
      );
    },
    [setEdges, pushSnapshot, getCurrentSnapshot],
  );

  const applyEdgeMapping = useCallback(
    (payload: {
      edgeId: string;
      fromNodeId: string;
      toNodeId: string;
      sourceExpression: string;
      targetAttribute: string;
    }) => {
      const targetNode = nodes.find((node) => node.id === payload.toNodeId);
      if (!targetNode) return;
      const targetResourceId = targetNode.data.resourceId;

      setProject((currentProject) => {
        const updatedProject = {
          ...currentProject,
          resources: currentProject.resources.map((resource) => {
            if (resource.id !== targetResourceId) return resource;

            const currentAttrs = { ...resource.config.attributes };
            const parts = payload.targetAttribute.split(".");

            if (parts.length >= 2) {
              const blockKey = parts[0];
              const childPath = parts.slice(1).join(".");
              const existing = currentAttrs[blockKey];

              if (Array.isArray(existing) && existing.length > 0 && existing.every((it) => it && typeof it === "object" && !Array.isArray(it))) {
                const items = existing.map((item, idx) =>
                  idx === 0
                    ? { ...(item as Record<string, unknown>), [childPath]: payload.sourceExpression }
                    : item,
                );
                currentAttrs[blockKey] = items;
                delete currentAttrs[payload.targetAttribute];
              } else if (existing && typeof existing === "object" && !Array.isArray(existing)) {
                currentAttrs[blockKey] = {
                  ...(existing as Record<string, unknown>),
                  [childPath]: payload.sourceExpression,
                };
                delete currentAttrs[payload.targetAttribute];
              } else {
                currentAttrs[blockKey] = [{ [childPath]: payload.sourceExpression }];
                delete currentAttrs[payload.targetAttribute];
              }
            } else {
              currentAttrs[payload.targetAttribute] = payload.sourceExpression;
            }

            return {
              ...resource,
              config: { ...resource.config, attributes: currentAttrs },
            };
          }),
        };
        void saveProjectToHCL(updatedProject);
        return updatedProject;
      });

      setEdges((currentEdges) =>
        currentEdges.map((edge) => {
          if (edge.id !== payload.edgeId) return edge;
          const previousMappings = Array.isArray(edge.data?.mappings)
            ? (edge.data.mappings as CanvasEdgeMapping[])
            : [];

          const nextMappings = [
            ...previousMappings.filter(
              (mapping) =>
                !(mapping.toNodeId === payload.toNodeId &&
                  mapping.targetAttribute === payload.targetAttribute),
            ),
            {
              fromNodeId: payload.fromNodeId,
              toNodeId: payload.toNodeId,
              fromNodeLabel:
                nodes.find((node) => node.id === payload.fromNodeId)?.data.label ??
                payload.fromNodeId,
              toNodeLabel:
                nodes.find((node) => node.id === payload.toNodeId)?.data.label ??
                payload.toNodeId,
              sourceExpression: payload.sourceExpression,
              targetAttribute: payload.targetAttribute,
            },
          ];

          return {
            ...edge,
            type: "mappingEdge",
            data: {
              ...(edge.data ?? {}),
              mappings: nextMappings,
            },
          } as Edge<CanvasEdgeData>;
        }),
      );
    },
    [nodes, setEdges],
  );

  useEffect(() => {
    const handler = (event: Event) => {
      const { edgeId, toNodeId, targetAttribute, sourceExpression } =
        (event as CustomEvent<{
          edgeId: string;
          fromNodeId: string;
          toNodeId: string;
          targetAttribute: string;
          sourceExpression: string;
        }>).detail;
      // fromNodeId not needed for removal — kept in event detail for future use

      setEdges((currentEdges) =>
        currentEdges.map((edge) => {
          if (edge.id !== edgeId) return edge;
          const prev = Array.isArray(edge.data?.mappings) ? edge.data.mappings : [];
          const next = prev.filter(
            (m) => !(m.toNodeId === toNodeId && m.targetAttribute === targetAttribute),
          );
          return { ...edge, data: { ...(edge.data ?? {}), mappings: next } } as typeof edge;
        }),
      );

      const targetNode = nodes.find((n) => n.id === toNodeId);
      if (!targetNode) return;
      const targetResourceId = targetNode.data.resourceId;

      setProject((currentProject) => {
        const updatedProject = {
          ...currentProject,
          resources: currentProject.resources.map((resource) => {
            if (resource.id !== targetResourceId) return resource;
            const attrs = { ...resource.config.attributes };

            if (attrs[targetAttribute] === sourceExpression) {
              delete attrs[targetAttribute];
            }

            const parts = targetAttribute.split(".");
            if (parts.length >= 2) {
              const blockKey = parts[0];
              const childPath = parts.slice(1).join(".");
              const existing = attrs[blockKey];

              const isMeaningful = (v: unknown): boolean => {
                if (v === null || v === undefined) return false;
                if (typeof v === "string") return v.trim() !== "";
                if (Array.isArray(v)) return v.some(isMeaningful);
                if (typeof v === "object") return Object.values(v).some(isMeaningful);
                return true;
              };

              if (Array.isArray(existing)) {
                const cleaned = existing
                  .map((item) => {
                    if (!item || typeof item !== "object" || Array.isArray(item)) return item;
                    const obj = { ...(item as Record<string, unknown>) };
                    if (obj[childPath] === sourceExpression) delete obj[childPath];
                    return obj;
                  })
                  .filter((item) => {
                    if (!item || typeof item !== "object" || Array.isArray(item)) return true;
                    return Object.values(item).some(isMeaningful);
                  });

                if (cleaned.length === 0) {
                  delete attrs[blockKey];
                } else {
                  attrs[blockKey] = cleaned;
                }
              } else if (existing && typeof existing === "object" && !Array.isArray(existing)) {
                const obj = { ...(existing as Record<string, unknown>) };
                if (obj[childPath] === sourceExpression) delete obj[childPath];
                if (!Object.values(obj).some(isMeaningful)) {
                  delete attrs[blockKey];
                } else {
                  attrs[blockKey] = obj;
                }
              }
            }

            return { ...resource, config: { ...resource.config, attributes: attrs } };
          }),
        };
        void saveProjectToHCL(updatedProject);
        return updatedProject;
      });

    };

    window.addEventListener("ddf-remove-edge-mapping", handler);
    return () => window.removeEventListener("ddf-remove-edge-mapping", handler);
  }, [nodes, setEdges]);

  const onNodesChange = useCallback(
    (changes: NodeChange[]) => {
      const hasRemove = changes.some((c) => c.type === "remove");
      if (hasRemove) pushSnapshot(getCurrentSnapshot());

      setNodes((currentNodes) => {
        const nextNodes = applyNodeChanges(changes, currentNodes);
        const resizedNodeIds = changes
          .filter((change) => change.type === "dimensions")
          .map((change) => change.id);

        if (!resizedNodeIds.length) {
          return applyZoneContainerMemberships(nextNodes);
        }

        return applyZoneContainerMemberships(applyManualContainerResizeEffects(
          currentNodes,
          nextNodes,
          resizedNodeIds,
        ));
      });
    },
    [setNodes, pushSnapshot, getCurrentSnapshot],
  );

  const terraformResourceToHCL = (r: TerraformResource): string | null => {
    const toHclLiteral = (value: unknown): string => {
      if (Array.isArray(value)) {
        if (value.length === 0) return "[]";
        return `[${value.map((item) => toHclLiteral(item)).join(", ")}]`;
      }

      if (isPlainObject(value)) {
        const entries = Object.entries(value).filter(([, item]) => isMeaningfulValue(item));
        if (!entries.length) return "{}";
        return `{ ${entries.map(([k, v]) => `${k} = ${toHclLiteral(v)}`).join(", ")} }`;
      }

      if (typeof value === "boolean" || typeof value === "number") {
        return String(value);
      }

      if (typeof value === "string") {
        const trimmed = value.trim();
        if (!trimmed) return '""';

        if (
          TERRAFORM_REF_PATTERN.test(trimmed) ||
          trimmed.startsWith("var.") ||
          trimmed === "true" ||
          trimmed === "false" ||
          /^-?\d+(\.\d+)?$/.test(trimmed) ||
          (trimmed.startsWith('"') && trimmed.endsWith('"')) ||
          (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
          (trimmed.startsWith("{") && trimmed.endsWith("}"))
        ) {
          return trimmed;
        }

        return `"${value.replace(/"/g, '\\"')}"`;
      }

      if (value === null || value === undefined) return '""';
      return `"${String(value).replace(/"/g, '\\"')}"`;
    };

    const root: HclBlockNode = { attributes: {}, blocks: {} };
    Object.entries(r.config.attributes ?? {}).forEach(([rawKey, rawValue]) => {
      if (rawValue === undefined || rawValue === null) return;
      if (typeof rawValue === "string" && rawValue.trim() === "") return;

      const pathParts = rawKey.split(".").filter(Boolean);
      if (!pathParts.length) return;

      if (pathParts.length === 1) {
        root.attributes[pathParts[0]] = rawValue;
        return;
      }

      let cursor = root;
      for (const blockName of pathParts.slice(0, -1)) {
        if (!cursor.blocks[blockName]) {
          cursor.blocks[blockName] = { attributes: {}, blocks: {} };
        }
        cursor = cursor.blocks[blockName];
      }

      const attrName = pathParts[pathParts.length - 1];
      cursor.attributes[attrName] = rawValue;
    });

    const renderAssignment = (key: string, value: unknown, indent: string): string => {
      if (key === "protocol" && typeof value === "number" && value === -1) {
        return `${indent}${key} = "-1"\n`;
      }
      return `${indent}${key} = ${toHclLiteral(value)}\n`;
    };

    const renderObjectBlock = (blockName: string, value: Record<string, unknown>, indent: string): string => {
      const entries = Object.entries(value).filter(([, item]) => isMeaningfulValue(item));
      if (!entries.length) return "";

      let lines = `${indent}${blockName} {\n`;
      entries.forEach(([key, item]) => {
        lines += renderAssignment(key, item, `${indent}  `);
      });
      lines += `${indent}}\n`;
      return lines;
    };

    const renderNode = (node: HclBlockNode, indent: string): string => {
      let lines = "";

      Object.entries(node.attributes).forEach(([key, value]) => {
        if (!isMeaningfulValue(value)) return;

        if (Array.isArray(value) && value.every((item) => isPlainObject(item))) {
          value.forEach((item) => {
            lines += renderObjectBlock(key, item, indent);
          });
          return;
        }

        lines += renderAssignment(key, value, indent);
      });

      Object.entries(node.blocks).forEach(([blockName, blockNode]) => {
        lines += `${indent}${blockName} {\n`;
        lines += renderNode(blockNode, `${indent}  `);
        lines += `${indent}}\n`;
      });

      return lines;
    };

    const blockKind = r.kind ?? "resource";
    const body = renderNode(root, "  ");
    if (!body.trim()) return null;
    return `${blockKind} "${r.type}" "${r.name}" {\n${body}}\n`;
  };

  const buildGlobalHcl = useCallback((proj: TerraformProject) => {
    let hcl = `terraform {\n`;
    hcl += `  required_providers {\n`;
    hcl += `    ${cloudProvider} = {\n`;
    hcl += `      source  = "hashicorp/${cloudProvider}"\n`;
    hcl += `      version = "~> 5.0"\n`;
    hcl += `    }\n`;
    hcl += `  }\n`;
    hcl += `}\n\n`;
    hcl += `provider "${cloudProvider}" {\n`;
    hcl += `  region = "${providerRegion}"\n`;
    hcl += `}\n\n`;

    proj.resources.forEach((r) => {
      const block = terraformResourceToHCL(r);
      if (!block) return;
      hcl += block + "\n";
    });

    return hcl;
  }, [cloudProvider, providerRegion]);

  const saveProjectToHCL = async (proj: TerraformProject) => {
    if (hclPersistenceDisabledRef.current) return;

    const isTauriRuntime =
      typeof window !== "undefined" &&
      !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

    if (!isTauriRuntime) return;

    const hcl = buildGlobalHcl(proj);
    try {
      if (projectDir) {
        await writeTextFile(`${projectDir}/main.tf`, hcl);
      } else {
        await writeTextFile("main.tf", hcl, { baseDir: BaseDirectory.AppData });
      }
    } catch (error) {
      const errorMessage = String(error);
      if (errorMessage.includes("not allowed")) {
        hclPersistenceDisabledRef.current = true;
      }
      warn(
        "No se pudo guardar el archivo HCL (revisa permisos Tauri fs).",
        "TAURI_FS_PERSIST",
      );
      console.warn("Failed to persist HCL file via Tauri fs plugin:", error);
    }
  };

  useEffect(() => {
    const nodeResourceIds = new Set(nodes.map((node) => node.data.resourceId));
    setProject((currentProject) => {
      const nextResources = currentProject.resources.filter((resource) =>
        nodeResourceIds.has(resource.id),
      );

      if (nextResources.length === currentProject.resources.length) {
        return currentProject;
      }

      const nextProject = { ...currentProject, resources: nextResources };
      void saveProjectToHCL(nextProject);
      return nextProject;
    });
  }, [nodes]);

  const onNodeDragStart: NodeDragHandler = useCallback(
    (_event, draggedNode) => {
      activeDragNodeIdRef.current = draggedNode.id;
      dragSubtreeSnapshotRef.current = buildSubtreeSnapshot(draggedNode.id);
      pushSnapshot(getCurrentSnapshot());
    },
    [buildSubtreeSnapshot, pushSnapshot, getCurrentSnapshot],
  );

  const onNodeDragFinalize = useCallback(
    (draggedNodeId: string, targetContainerId?: string) => {
      if (activeDragNodeIdRef.current !== draggedNodeId) {
        return;
      }

      const subtreeSnapshot = dragSubtreeSnapshotRef.current;
      activeDragNodeIdRef.current = null;
      dragSubtreeSnapshotRef.current = null;

      setNodes((currentNodes) => {
        const stabilizedNodes = subtreeSnapshot
          ? restoreSubtreeFromSnapshot(currentNodes, subtreeSnapshot, draggedNodeId)
          : currentNodes;

        return reparentCanvasNodeAfterDrag(
          stabilizedNodes,
          draggedNodeId,
          targetContainerId,
        );
      });
    },
    [restoreSubtreeFromSnapshot, setNodes],
  );

  const onNodeDragStop: NodeDragHandler = useCallback(
    () => {},
    [],
  );

  const generateNextResourceName = useCallback(
    (schema: TerraformNodeSchema) => {
      const base = schema.id.replace(/[^a-zA-Z0-9_]/g, "_").toLowerCase();
      const prefix = `${base}_`;
      const used = project.resources
        .map((resource) => resource.name)
        .filter((name) => name.startsWith(prefix))
        .map((name) => Number(name.slice(prefix.length)))
        .filter((value) => Number.isInteger(value) && value > 0);

      const next = used.length ? Math.max(...used) + 1 : 1;
      return `${base}_${next}`;
    },
    [project.resources],
  );

  const addResource = async (
    node: TerraformNodeSchema,
    dropPosition?: XYPosition,
    options?: { targetContainerId?: string },
  ) => {
    const resolveRandomPositionInViewport = () => {
      if (!canvasViewportBounds) return undefined;

      const isContainer = CONTAINER_SCHEMA_IDS.has(node.id);
      const nodeSize = isContainer ? DEFAULT_CONTAINER_SIZE : DEFAULT_RESOURCE_NODE_SIZE;
      const basePadding = 48;
      const viewportWidth = Math.max(1, canvasViewportBounds.maxX - canvasViewportBounds.minX);
      const viewportHeight = Math.max(1, canvasViewportBounds.maxY - canvasViewportBounds.minY);
      const dynamicXPadding = Math.max(basePadding, viewportWidth * 0.2);
      const dynamicYPadding = Math.max(basePadding, viewportHeight * 0.2);

      const minX = canvasViewportBounds.minX + dynamicXPadding;
      const maxX = canvasViewportBounds.maxX - nodeSize.width - dynamicXPadding;
      const minY = canvasViewportBounds.minY + dynamicYPadding;
      const maxY = canvasViewportBounds.maxY - nodeSize.height - dynamicYPadding;

      const centerX = (canvasViewportBounds.minX + canvasViewportBounds.maxX - nodeSize.width) / 2;
      const centerY = (canvasViewportBounds.minY + canvasViewportBounds.maxY - nodeSize.height) / 2;

      const x = maxX > minX
        ? minX + Math.random() * (maxX - minX)
        : centerX;
      const y = maxY > minY
        ? minY + Math.random() * (maxY - minY)
        : centerY;

      return { x, y };
    };

    const resolvedDropPosition = dropPosition ?? resolveRandomPositionInViewport();

    pushSnapshot(getCurrentSnapshot());

    const resourceName = generateNextResourceName(node);
    const newResource: TerraformResource = createTerraformResourceFromSchema(
      node,
      resourceName,
    );

    const updatedProject = {
      ...project,
      resources: [...project.resources, newResource],
    };

    setNodes((currentNodes) =>
      placeCanvasNodeFromUserAction(
        currentNodes,
        node,
        currentNodes.length,
        resolvedDropPosition,
        options?.targetContainerId,
        newResource.id,
        newResource.name,
      ),
    );

    setProject(updatedProject);
    await saveProjectToHCL(updatedProject);
  };

  const clearCanvas = async () => {
    setNodes([]);
    setEdges([]);
    setSelectedNodeId(undefined);

    const updatedProject: TerraformProject = {
      ...project,
      resources: [],
    };

    setProject(updatedProject);
    await saveProjectToHCL(updatedProject);
  };

  const selectedNode = selectedNodeId
    ? nodes.find((node) => node.id === selectedNodeId)
    : undefined;

  const selectedSchema = selectedNode
    ? NODE_SCHEMAS.find((schema) => schema.id === selectedNode.data.schemaId)
    : undefined;

  const selectedResource = selectedNode
    ? project.resources.find((resource) => resource.id === selectedNode.data.resourceId)
    : undefined;

  const getResourceIcon = useCallback(
    (resource: TerraformResource) => {
      if (resource.type === "aws_subnet") {
        if (isSubnetIconPath(resource.ui.icon)) {
          return resource.ui.icon;
        }
        return SUBNET_PRIVATE_ICON_PATH;
      }

      return resolveTerraformIcon(resource.type, resource.config.attributes);
    },
    [],
  );

  const selectNode = useCallback((nodeId?: string) => {
    setSelectedNodeId((current) => (current === nodeId ? current : nodeId));
    setNodes((currentNodes) => {
      let changed = false;

      const nextNodes = currentNodes.map((node) => {
        const shouldBeSelected = !!nodeId && node.id === nodeId;
        const isSelected = node.selected === true;

        if (isSelected === shouldBeSelected) {
          return node;
        }

        changed = true;
        return {
          ...node,
          selected: shouldBeSelected,
        };
      });

      return changed ? nextNodes : currentNodes;
    });
  }, [setNodes]);

  const updateSelectedResource = useCallback(
    (updater: (resource: TerraformResource) => TerraformResource) => {
      if (!selectedResource || activeSection === "diff" || activeSection === "cloud") return;

      const nextResource = updater(selectedResource);
      const updatedSelectedResource: TerraformResource = {
        ...nextResource,
        ui: {
          ...nextResource.ui,
          icon: getResourceIcon(nextResource),
        },
      };

      setProject((currentProject) => {
        const updatedResources = currentProject.resources.map((resource) =>
          resource.id === selectedResource.id ? updatedSelectedResource : resource,
        );
        const updatedProject = {
          ...currentProject,
          resources: updatedResources,
        };
        void saveProjectToHCL(updatedProject);
        return updatedProject;
      });

      setNodes((currentNodes) =>
        currentNodes.map((node) => {
          if (node.data.resourceId !== updatedSelectedResource.id) {
            return node;
          }

          const nextLabel = updatedSelectedResource.name;
          const nextIcon = getResourceIcon(updatedSelectedResource);

          if (node.data.label === nextLabel && node.data.icon === nextIcon) {
            return node;
          }

          return {
            ...node,
            data: {
              ...node.data,
              label: nextLabel,
              icon: nextIcon,
            },
          };
        }),
      );
    },
    [activeSection, getResourceIcon, selectedResource, setNodes],
  );

  const syncResourcesFromMainTfBlocks = useCallback(
    (blocks: Array<{
      kind: "resource" | "data";
      type: string;
      name: string;
      attributes: Record<string, unknown>;
    }>) => {
      if (!blocks.length) return;

      // Build a lookup map keyed by "type.name" so edits in CodePanel find the
      // correct resource regardless of declaration order in the HCL file.
      const blockByKey = new Map(
        blocks.map((block) => [`${block.type}.${block.name}`, block]),
      );

      const visualUpdates: Array<{ resourceId: string; label: string; icon: string }> = [];

      setProject((currentProject) => {
        let changed = false;

        const updatedResources = currentProject.resources.map((resource) => {
          const block = blockByKey.get(`${resource.type}.${resource.name}`);
          if (!block) return resource;

          const resourceSchema = NODE_SCHEMAS.find((s) => s.id === resource.schemaId);
          const nextAttributes = { ...resource.config.attributes };

          // Apply every key the parsed HCL block knows about (flat + nested via dotted keys).
          // Empty-string means the line was cleared — delete the attribute.
          Object.keys(block.attributes).forEach((key) => {
            const parsed = block.attributes[key];
            if (parsed === "" || parsed === null || parsed === undefined) {
              delete nextAttributes[key];
            } else {
              nextAttributes[key] = parsed;
            }
          });

          // Remove keys that were rendered in the CodePanel HCL (meaningful value) but are
          // now absent from the parse — the user deleted or cleared them.
          // Only touch keys with meaningful values so computed/null attributes in the store
          // are never accidentally wiped.
          Object.keys(resource.config.attributes).forEach((key) => {
            if (
              isMeaningfulValue(resource.config.attributes[key]) &&
              !Object.prototype.hasOwnProperty.call(block.attributes, key)
            ) {
              delete nextAttributes[key];
            }
          });

          // Convert dotted keys for set(object(...))/list(object(...)) schema attributes
          // into the canonical array-of-objects format the info tab UI expects.
          // Also removes array-format keys whose blocks were entirely removed from the HCL.
          const normalizedAttributes = normalizeDottedKeysToArrayFormat(
            nextAttributes,
            resourceSchema,
            block.attributes,
          );

          const nextKind = block.kind;
          const nextType = block.type || resource.type;
          const nextName = block.name || resource.name;
          const nextIcon =
            nextType === "aws_subnet"
              ? (isSubnetIconPath(resource.ui.icon)
                  ? resource.ui.icon
                  : SUBNET_PRIVATE_ICON_PATH)
              : resolveTerraformIcon(nextType, normalizedAttributes);

          const attributesChanged =
            JSON.stringify(resource.config.attributes) !== JSON.stringify(normalizedAttributes);
          const identityChanged =
            resource.kind !== nextKind ||
            resource.type !== nextType ||
            resource.name !== nextName;
          const iconChanged = resource.ui.icon !== nextIcon;

          if (!attributesChanged && !identityChanged && !iconChanged) {
            return resource;
          }

          changed = true;

          visualUpdates.push({
            resourceId: resource.id,
            label: nextName,
            icon: nextIcon,
          });

          return {
            ...resource,
            kind: nextKind,
            type: nextType,
            name: nextName,
            ui: {
              ...resource.ui,
              icon: nextIcon,
            },
            config: {
              ...resource.config,
              attributes: normalizedAttributes,
            },
          };
        });

        if (!changed) return currentProject;

        const updatedProject = {
          ...currentProject,
          resources: updatedResources,
        };
        void saveProjectToHCL(updatedProject);
        return updatedProject;
      });

      if (visualUpdates.length) {
        const visualByResourceId = new Map(
          visualUpdates.map((entry) => [entry.resourceId, entry]),
        );

        setNodes((currentNodes) =>
          currentNodes.map((node) => {
            const nextVisual = visualByResourceId.get(node.data.resourceId);
            if (!nextVisual) return node;
            if (
              node.data.label === nextVisual.label &&
              node.data.icon === nextVisual.icon
            ) {
              return node;
            }
            return {
              ...node,
              data: {
                ...node.data,
                label: nextVisual.label,
                icon: nextVisual.icon,
              },
            };
          }),
        );
      }
    },
    [setNodes],
  );

  useEffect(() => {
    setNodes((currentNodes) => {
      const resourcesById = new Map(project.resources.map((resource) => [resource.id, resource]));
      let changed = false;

      const nextNodes = currentNodes.map((node) => {
        const resource = resourcesById.get(node.data.resourceId);
        if (!resource) return node;

        const expectedIcon = getResourceIcon(resource);
        if (node.data.icon === expectedIcon) return node;

        changed = true;
        return {
          ...node,
          data: {
            ...node.data,
            icon: expectedIcon,
          },
        };
      });

      return changed ? nextNodes : currentNodes;
    });
  }, [getResourceIcon, project.resources, setNodes]);

  const appendCodeValidationLogs = useCallback((entries: BottomPanelLogEntry[]) => {
    if (!entries.length) return;
    setCodeLogs((current) => [...entries, ...current].slice(0, 200));
    setBottomPreferredTab("logs");
    setBottomOpenSignal((s) => s + 1);
  }, []);

  const isTauriRuntime =
    typeof window !== "undefined" &&
    !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

  const refreshCloudState = useCallback(async () => {
    if (!projectDir || !isTauriRuntime) return;
    setCloudStateLoading(true);
    try {
      const result = await invoke<{
        hasState: boolean;
        resources: Array<{
          address: string;
          type: string;
          name: string;
          mode: string;
          values: Record<string, unknown> | null;
        }>;
      }>("terraform_show", {
        projectDir,
        files: [],
        awsCredentials: {
          accessKeyId: awsCredentials.accessKeyId,
          secretAccessKey: awsCredentials.secretAccessKey,
          sessionToken: awsCredentials.sessionToken,
          region: awsCredentials.region,
        },
      });
      const next = new Map<string, Record<string, unknown>>();
      result.resources.forEach((resource) => {
        const key = `${resource.type}.${resource.name}`;
        next.set(key, resource.values ?? {});
      });
      setCloudState(next);
      setCloudStateAvailable(result.hasState);
    } catch (error) {
      console.error("terraform_show error:", error);
      setCloudState(new Map());
      setCloudStateAvailable(false);
    } finally {
      setCloudStateLoading(false);
    }
  }, [projectDir, isTauriRuntime, awsCredentials]);

  useEffect(() => {
    if (activeSection !== "diff" && activeSection !== "cloud") return;
    void refreshCloudState();
  }, [activeSection, refreshCloudState]);

  const runTerraformAction = useCallback(
    async (
      action: "terraform_plan" | "terraform_plan_destroy" | "terraform_apply" | "terraform_destroy",
    ) => {
      if (!projectDir || !isTauriRuntime) return;
      setPlanChanges(new Map());
      setIsDeploying(true);
      if (action === "terraform_apply") {
        setPendingDeployConfirmation("terraform_apply");
      } else if (action === "terraform_destroy") {
        setPendingDeployConfirmation("terraform_destroy");
      }
      setBottomPreferredTab("terminal");
      setBottomOpenSignal((s) => s + 1);
      try {
        const ok = await invoke<boolean>(action, {
          projectDir,
          files: [],
          awsCredentials: {
            accessKeyId: awsCredentials.accessKeyId,
            secretAccessKey: awsCredentials.secretAccessKey,
            sessionToken: awsCredentials.sessionToken,
            region: awsCredentials.region,
          },
        });
        const successMessages: Record<string, { title: string; description: string }> = {
          terraform_plan: { title: "Plan completado", description: "Revisa los cambios en el panel diff." },
          terraform_plan_destroy: { title: "Plan destroy completado", description: "Revisa los cambios en el panel diff." },
          terraform_apply: { title: "Apply completado", description: "La infraestructura se ha aplicado correctamente." },
          terraform_destroy: { title: "Destroy completado", description: "La infraestructura se ha destruido correctamente." },
        };
        const failureMessages: Record<string, { title: string; description: string }> = {
          terraform_plan: { title: "Plan ha fallado", description: "Ha salido mal, revisa los logs en el terminal." },
          terraform_plan_destroy: { title: "Plan destroy ha fallado", description: "Ha salido mal, revisa los logs en el terminal." },
          terraform_apply: { title: "Apply ha fallado", description: "Ha salido mal, revisa los logs en el terminal." },
          terraform_destroy: { title: "Destroy ha fallado", description: "Ha salido mal, revisa los logs en el terminal." },
        };
        if (ok) {
          const msg = successMessages[action];
          if (msg) sileo.success({ title: msg.title, description: msg.description });
        } else {
          const msg = failureMessages[action];
          if (msg) sileo.error({ title: msg.title, description: msg.description });
        }
        if (action === "terraform_apply" || action === "terraform_destroy") {
          void refreshCloudState();
        }
      } catch (error) {
        console.error(`${action} error:`, error);
        sileo.error({ title: "Error en la operación", description: "Ha salido mal, revisa los logs en el terminal." });
      } finally {
        setIsDeploying(false);
        setPendingDeployConfirmation(null);
      }
    },
    [projectDir, isTauriRuntime, awsCredentials, refreshCloudState],
  );

  const confirmTerraformAction = useCallback(
    async (confirmed: boolean) => {
      if (!isTauriRuntime) return;
      try {
        await invoke("terraform_confirm", { input: confirmed ? "yes" : "no" });
      } catch (error) {
        console.error("terraform_confirm error:", error);
      }
    },
    [isTauriRuntime],
  );

  const triggerDeployAction = useCallback(
    (action: "terraform_apply" | "terraform_destroy") => {
      setActiveSection("diff");
      void runTerraformAction(action);
    },
    [runTerraformAction],
  );

  return (
    <div className="flex flex-col flex-1 overflow-hidden">
      {showAwsConfig && (
        <AwsCredentialsModal
          initial={awsCredentials}
          onSave={saveAwsCredentials}
          onClose={() => setShowAwsConfig(false)}
        />
      )}
      <Header
        onClearCanvas={clearCanvas}
        activeSection={activeSection}
        onSectionChange={setActiveSection}
        awsConfigured={awsConfigured}
        onOpenAwsConfig={() => setShowAwsConfig(true)}
        onPlan={() => { setActiveSection("diff"); void runTerraformAction("terraform_plan"); }}
        onApply={() => triggerDeployAction("terraform_apply")}
        onDestroy={() => triggerDeployAction("terraform_destroy")}
        isApplyConfirming={pendingDeployConfirmation === "terraform_apply"}
        isDestroyConfirming={pendingDeployConfirmation === "terraform_destroy"}
        onConfirmApply={() => void confirmTerraformAction(true)}
        onCancelApply={() => void confirmTerraformAction(false)}
        onConfirmDestroy={() => void confirmTerraformAction(true)}
        onCancelDestroy={() => void confirmTerraformAction(false)}
        isDeploying={isDeploying}
      />

      <div className="relative flex flex-1 min-h-0 overflow-hidden">
        {activeSection !== "code" && (
          <div className="relative flex flex-1 min-h-0 overflow-hidden">
            <LeftPanel
              addResource={addResource}
              cloudProvider={cloudProvider}
              onCloudProviderChange={setCloudProvider}
              onWidthChange={setLeftPanelWidth}
            />

            <main className="flex flex-1 min-h-0 overflow-hidden bg-white">
              <CenterPanel
                autoFitKey={`${projectDir ?? "no-project"}:${viewId}`}
                readOnly={activeSection === "diff" || activeSection === "cloud"}
                leftOverlayOffset={leftPanelWidth}
                nodes={nodes}
                edges={edges}
                resources={project.resources}
                schemas={NODE_SCHEMAS}
                onNodesChange={onNodesChange}
                onEdgesChange={onEdgesChange}
                onConnect={onConnect}
                onDropNode={(node, position, options) => addResource(node, position, options)}
                onNodeDragFinalize={onNodeDragFinalize}
                onNodeDragStart={onNodeDragStart}
                onNodeDragStop={onNodeDragStop}
                onNodeSelected={selectNode}
                onDeleteEdge={(edgeId) => {
                  pushSnapshot(getCurrentSnapshot());
                  setEdges((currentEdges) =>
                    currentEdges.filter((edge) => edge.id !== edgeId),
                  );
                }}
                onApplyEdgeMapping={applyEdgeMapping}
                onViewportBoundsChange={activeSection === "canvas" ? setCanvasViewportBounds : undefined}
                rightOverlayOffset={rightPanelOverlayOffset}
                isRightOverlayResizing={isRightPanelOverlayResizing}
              />
            </main>

            <RightPanel
              nodes={nodes}
              resources={project.resources}
              selectedNodeId={selectedNodeId}
              selectedNode={selectedNode}
              selectedSchema={selectedSchema}
              selectedResource={selectedResource}
              onSelectNode={selectNode}
              onUpdateSelectedResource={updateSelectedResource}
              onOverlayWidthChange={setRightPanelOverlayOffset}
              onOverlayResizingChange={setIsRightPanelOverlayResizing}
              diffMode={activeSection === "diff"}
              cloudMode={activeSection === "cloud"}
              planChanges={planChanges}
              cloudState={cloudState}
              cloudStateAvailable={cloudStateAvailable}
              cloudStateLoading={cloudStateLoading}
              onRefreshCloudState={refreshCloudState}
            />
          </div>
        )}

        {activeSection === "code" && (
          <div className="min-h-0 flex-1">
          <main className="flex h-full min-h-0 w-full flex-col overflow-hidden bg-white">
            <div className="min-h-0 flex-1">
              <CodePanel
                resources={project.resources}
                schemas={NODE_SCHEMAS}
                cloudProvider={cloudProvider}
                region={providerRegion}
                projectDir={projectDir}
                initialCustomFiles={codeFiles}
                onCustomFilesChange={setCodeFiles}
                onMainTfBlocksChange={syncResourcesFromMainTfBlocks}
                onValidationLogs={appendCodeValidationLogs}
                onOpenLogsPanel={() => { setBottomPreferredTab("logs"); setBottomOpenSignal((s) => s + 1); }}
              />
            </div>
          </main>
          </div>
        )}
      </div>

      {!terminalPoppedOut ? (
        <BottomPanel
          nodes={nodes}
          edges={edges}
          resources={project.resources}
          schemas={NODE_SCHEMAS}
          mode={activeSection === "code" ? "code" : "canvas"}
          logs={codeLogs}
          projectDir={projectDir}
          viewId={viewId}
          suppressTerminal={terminalPoppedOut}
          enabled={isVisible}
          openSignal={bottomOpenSignal}
          preferredTab={bottomPreferredTab}
          leftOffset={activeSection === "canvas" || activeSection === "diff" || activeSection === "cloud" ? leftPanelWidth : 0}
        />
      ) : null}
    </div>
  );
}
