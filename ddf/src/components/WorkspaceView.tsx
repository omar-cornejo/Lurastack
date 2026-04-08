import { useCallback, useEffect, useRef, useState } from "react";
import Header from "./Header";
import { LeftPanel } from "./LeftPanel";
import CenterPanel from "./CenterPanel";
import { RightPanel } from "./RightPanel";
import BottomPanel from "./BottomPanel";
import CodePanel from "./CodePanel";
import { TerraformProject, TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/testNodes";
import { writeTextFile, BaseDirectory } from "@tauri-apps/plugin-fs";
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
} from "../canvas/types";
import {
  applyManualContainerResizeEffects,
  placeCanvasNodeFromUserAction,
  reparentCanvasNodeAfterDrag,
} from "../commands/placeCanvasNode";
import { createTerraformResourceFromSchema } from "../models/terraform/createTerraformResource";
import { warn } from "../commands/warn";
import { TEST_NODE_SCHEMAS } from "../models/testNodes";
import type { DdfCodeFile, DdfViewSnapshot } from "../types/project";
import type { BottomPanelLogEntry } from "../types/logs";
import { snapshotNodes, snapshotEdges, restoreNodes, restoreEdges } from "../commands/projectManager";

type WorkspaceViewProps = {
  viewId: string;
  viewName?: string;
  projectDir?: string;
  isVisible?: boolean;
  initialState?: DdfViewSnapshot;
  onStateChange?: (viewId: string, snapshot: DdfViewSnapshot) => void;
};

export default function WorkspaceView({
  viewId,
  viewName = "View",
  projectDir,
  isVisible = true,
  initialState,
  onStateChange,
}: WorkspaceViewProps) {
  const TERRAFORM_REF_PATTERN = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;
  const [activeSection, setActiveSection] = useState<"canvas" | "code">("canvas");
  const [cloudProvider, setCloudProvider] = useState<"aws">("aws");
  const [providerRegion] = useState("eu-west-1");

  const [bottomHeight, setBottomHeight] = useState(288);
  const [nodes, setNodes] = useNodesState<CanvasTerraformNodeData>(
    initialState ? restoreNodes(initialState.nodes) : [],
  );
  const [edges, setEdges, onEdgesChange] = useEdgesState<CanvasEdgeData>(
    initialState ? restoreEdges(initialState.edges) : [],
  );
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
  const [codeBottomOpenSignal, setCodeBottomOpenSignal] = useState(0);
  const hclPersistenceDisabledRef = useRef(false);

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
    [setEdges],
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
          resources: currentProject.resources.map((resource) =>
            resource.id === targetResourceId
              ? {
                  ...resource,
                  config: {
                    ...resource.config,
                    attributes: {
                      ...resource.config.attributes,
                      [payload.targetAttribute]: payload.sourceExpression,
                    },
                  },
                }
              : resource,
          ),
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

  const onNodesChange = useCallback(
    (changes: NodeChange[]) => {
      setNodes((currentNodes) => {
        const nextNodes = applyNodeChanges(changes, currentNodes);
        const resizedNodeIds = changes
          .filter((change) => change.type === "dimensions")
          .map((change) => change.id);

        if (!resizedNodeIds.length) {
          return nextNodes;
        }

        return applyManualContainerResizeEffects(
          currentNodes,
          nextNodes,
          resizedNodeIds,
        );
      });
    },
    [setNodes],
  );

  const terraformResourceToHCL = (r: TerraformResource) => {
    const blockKind = r.kind ?? "resource";
    let attrs = "";
    for (const [k, v] of Object.entries(r.config.attributes)) {
      if (typeof v === "string" && TERRAFORM_REF_PATTERN.test(v.trim())) {
        attrs += `  ${k} = ${v.trim()}\n`;
      } else {
        attrs += `  ${k} = "${v}"\n`;
      }
    }
    return `${blockKind} "${r.type}" "${r.name}" {\n${attrs}}\n`;
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
      hcl += terraformResourceToHCL(r) + "\n";
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
    },
    [buildSubtreeSnapshot],
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
        dropPosition,
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
    ? TEST_NODE_SCHEMAS.find((schema) => schema.id === selectedNode.data.schemaId)
    : undefined;

  const selectedResource = selectedNode
    ? project.resources.find((resource) => resource.id === selectedNode.data.resourceId)
    : undefined;

  const selectNode = useCallback((nodeId?: string) => {
    setSelectedNodeId(nodeId);
    setNodes((currentNodes) =>
      currentNodes.map((node) => ({
        ...node,
        selected: nodeId ? node.id === nodeId : false,
      })),
    );
  }, [setNodes]);

  const updateSelectedResource = useCallback(
    (updater: (resource: TerraformResource) => TerraformResource) => {
      if (!selectedResource) return;

      const updatedSelectedResource = updater(selectedResource);

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

      if (updatedSelectedResource.name !== selectedResource.name) {
        setNodes((currentNodes) =>
          currentNodes.map((node) =>
            node.data.resourceId === updatedSelectedResource.id
              ? {
                  ...node,
                  data: {
                    ...node.data,
                    label: updatedSelectedResource.name,
                  },
                }
              : node,
          ),
        );
      }
    },
    [selectedResource, setNodes],
  );

  const updateResourceAttributeById = useCallback(
    (resourceId: string, attribute: string, value: unknown) => {
      setProject((currentProject) => {
        const updatedProject = {
          ...currentProject,
          resources: currentProject.resources.map((resource) =>
            resource.id === resourceId
              ? {
                  ...resource,
                  config: {
                    ...resource.config,
                    attributes: {
                      ...resource.config.attributes,
                      [attribute]: value,
                    },
                  },
                }
              : resource,
          ),
        };
        void saveProjectToHCL(updatedProject);
        return updatedProject;
      });
    },
    [],
  );

  const appendCodeValidationLogs = useCallback((entries: BottomPanelLogEntry[]) => {
    if (!entries.length) return;
    setCodeLogs((current) => [...entries, ...current].slice(0, 200));
    setCodeBottomOpenSignal((current) => current + 1);
  }, []);

  return (
    <div className="flex flex-col flex-1 overflow-hidden">
      <Header
        onClearCanvas={clearCanvas}
        activeSection={activeSection}
        onSectionChange={setActiveSection}
      />

      <div className="relative flex flex-1 min-h-0 overflow-hidden">
        <div
          className="absolute inset-0 flex flex-col min-h-0"
          style={{
            visibility: activeSection === "canvas" ? "visible" : "hidden",
            pointerEvents: activeSection === "canvas" ? "auto" : "none",
          }}
        >
          <div className="flex flex-1 min-h-0 overflow-hidden">
            <LeftPanel
              bottomHeight={bottomHeight}
              addResource={addResource}
              cloudProvider={cloudProvider}
              onCloudProviderChange={setCloudProvider}
            />

            <main className="flex flex-1 min-h-0 overflow-hidden bg-white">
              <CenterPanel
                nodes={nodes}
                edges={edges}
                resources={project.resources}
                schemas={TEST_NODE_SCHEMAS}
                onNodesChange={onNodesChange}
                onEdgesChange={onEdgesChange}
                onConnect={onConnect}
                onDropNode={(node, position, options) => addResource(node, position, options)}
                onNodeDragFinalize={onNodeDragFinalize}
                onNodeDragStart={onNodeDragStart}
                onNodeDragStop={onNodeDragStop}
                onNodeSelected={selectNode}
                onDeleteEdge={(edgeId) =>
                  setEdges((currentEdges) =>
                    currentEdges.filter((edge) => edge.id !== edgeId),
                  )
                }
                onApplyEdgeMapping={applyEdgeMapping}
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
            />
          </div>

          <BottomPanel
            onHeightChange={setBottomHeight}
            nodes={nodes}
            edges={edges}
            resources={project.resources}
            schemas={TEST_NODE_SCHEMAS}
            mode="canvas"
            logs={codeLogs}
            projectDir={projectDir}
            enabled={isVisible && activeSection === "canvas"}
          />
        </div>

        <div
          className="absolute inset-0 min-h-0"
          style={{
            visibility: activeSection === "code" ? "visible" : "hidden",
            pointerEvents: activeSection === "code" ? "auto" : "none",
          }}
        >
          <main className="flex h-full min-h-0 w-full flex-col overflow-hidden bg-white">
            <div className="min-h-0 flex-1">
              <CodePanel
                resources={project.resources}
                schemas={TEST_NODE_SCHEMAS}
                cloudProvider={cloudProvider}
                region={providerRegion}
                projectDir={projectDir}
                initialCustomFiles={codeFiles}
                onCustomFilesChange={setCodeFiles}
                onUpdateAttribute={updateResourceAttributeById}
                onValidationLogs={appendCodeValidationLogs}
                onOpenLogsPanel={() => setCodeBottomOpenSignal((current) => current + 1)}
              />
            </div>

            <BottomPanel
              nodes={nodes}
              edges={edges}
              resources={project.resources}
              schemas={TEST_NODE_SCHEMAS}
              mode="code"
              logs={codeLogs}
              openSignal={codeBottomOpenSignal}
              preferredTab="logs"
              projectDir={projectDir}
              enabled={isVisible && activeSection === "code"}
            />
          </main>
        </div>
      </div>
    </div>
  );
}
