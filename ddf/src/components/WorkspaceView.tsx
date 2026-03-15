import { useCallback, useRef, useState } from "react";
import Header from "./Header";
import { LeftPanel } from "./LeftPanel";
import CenterPanel from "./CenterPanel";
import { RightPanel } from "./RightPanel";
import BottomPanel from "./BottomPanel";
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
} from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";
import {
  applyManualContainerResizeEffects,
  placeCanvasNodeFromUserAction,
  reparentCanvasNodeAfterDrag,
} from "../commands/placeCanvasNode";
import { createTerraformResourceFromSchema } from "../models/terraform/createTerraformResource";
import { warn } from "../commands/warn";
import { TEST_NODE_SCHEMAS } from "../models/testNodes";

type WorkspaceViewProps = {
  viewId: string;
};

export default function WorkspaceView({ viewId }: WorkspaceViewProps) {
  const [bottomHeight, setBottomHeight] = useState(288);
  const [nodes, setNodes] = useNodesState<CanvasTerraformNodeData>([]);
  const [edges, setEdges, onEdgesChange] = useEdgesState([]);
  const activeDragNodeIdRef = useRef<string | null>(null);
  const dragSubtreeSnapshotRef = useRef<
    Map<string, { parentNode?: string; position: { x: number; y: number } }> | null
  >(null);
  const [project, setProject] = useState<TerraformProject>({
    provider: "registry.terraform.io/hashicorp/aws",
    resources: [],
  });
  const [selectedNodeId, setSelectedNodeId] = useState<string | undefined>(undefined);

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
      setEdges((currentEdges) => addEdge(connection, currentEdges));
    },
    [setEdges],
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
    if (r.hclTemplate?.trim()) {
      return `${r.hclTemplate.trim()}\n`;
    }

    const blockKind = r.kind ?? "resource";
    let attrs = "";
    for (const [k, v] of Object.entries(r.config.attributes)) {
      attrs += `  ${k} = "${v}"\n`;
    }
    return `${blockKind} "${r.type}" "${r.name}" {\n${attrs}}\n`;
  };

  const saveProjectToHCL = async (proj: TerraformProject) => {
    let hcl = `terraform {\n  required_providers {\n    ${proj.provider.split("/").pop()} = {}\n  }\n}\n\n`;
    proj.resources.forEach((r) => {
      hcl += terraformResourceToHCL(r) + "\n";
    });
    try {
      await writeTextFile(`project_${viewId}.tf`, hcl, {
        baseDir: BaseDirectory.AppData,
      });
    } catch (error) {
      warn(
        "No se pudo guardar el archivo HCL en AppData (revisa permisos Tauri fs).",
        "TAURI_FS_PERSIST",
      );
      console.warn("Failed to persist HCL file via Tauri fs plugin:", error);
    }
  };

  const onNodeDragStart: NodeDragHandler = useCallback(
    (_event, draggedNode, nodes) => {
      if (nodes.length > 1) {
        activeDragNodeIdRef.current = null;
        dragSubtreeSnapshotRef.current = null;
        return;
      }

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

  return (
    <div className="flex flex-col flex-1 overflow-hidden">
      <Header onClearCanvas={clearCanvas} />

      <div className="flex flex-1 min-h-0 overflow-hidden">
        <LeftPanel bottomHeight={bottomHeight} addResource={addResource} />

        <main className="flex flex-1 min-h-0 overflow-hidden bg-white">
          <CenterPanel
            nodes={nodes}
            edges={edges}
            onNodesChange={onNodesChange}
            onEdgesChange={onEdgesChange}
            onConnect={onConnect}
            onDropNode={(node, position, options) => addResource(node, position, options)}
            onNodeDragFinalize={onNodeDragFinalize}
            onNodeDragStart={onNodeDragStart}
            onNodeDragStop={onNodeDragStop}
            onNodeSelected={selectNode}
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
        resources={project.resources}
        schemas={TEST_NODE_SCHEMAS}
      />
    </div>
  );
}
