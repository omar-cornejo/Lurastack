import { useCallback, useState } from "react";
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
  useEdgesState,
  useNodesState,
  type XYPosition,
  type Connection,
} from "reactflow";
import type { CanvasTerraformNodeData } from "../canvas/types";
import { createCanvasNodeFromUserAction } from "../commands/createCanvasNode";
import { createTerraformResourceFromSchema } from "../models/terraform/createTerraformResource";

type WorkspaceViewProps = {
  viewId: string;
};

export default function WorkspaceView({ viewId }: WorkspaceViewProps) {
  const [bottomHeight, setBottomHeight] = useState(288);
  const [nodes, setNodes, onNodesChange] = useNodesState<CanvasTerraformNodeData>([]);
  const [edges, setEdges, onEdgesChange] = useEdgesState([]);
  const [project, setProject] = useState<TerraformProject>({
    provider: "registry.terraform.io/hashicorp/aws",
    resources: [],
  });

  const onConnect = useCallback(
    (connection: Connection) => {
      setEdges((currentEdges) => addEdge(connection, currentEdges));
    },
    [setEdges],
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
    await writeTextFile(`project_${viewId}.tf`, hcl, {
      baseDir: BaseDirectory.AppData,
    });
  };

  const addResource = async (node: TerraformNodeSchema, dropPosition?: XYPosition) => {
    const newResource: TerraformResource = createTerraformResourceFromSchema(
      node,
      project.resources.length,
    );

    const updatedProject = {
      ...project,
      resources: [...project.resources, newResource],
    };

    setNodes((currentNodes) => [
      ...currentNodes,
      createCanvasNodeFromUserAction(node, currentNodes.length, dropPosition),
    ]);

    setProject(updatedProject);
    await saveProjectToHCL(updatedProject);
  };

  return (
    <div className="flex flex-col flex-1 overflow-hidden">
      <Header />

      <div className="flex flex-1 min-h-0 overflow-hidden">
        <LeftPanel bottomHeight={bottomHeight} addResource={addResource} />

        <main className="flex flex-1 min-h-0 overflow-hidden bg-white">
          <CenterPanel
            nodes={nodes}
            edges={edges}
            onNodesChange={onNodesChange}
            onEdgesChange={onEdgesChange}
            onConnect={onConnect}
            onDropNode={(node, position) => addResource(node, position)}
          />
        </main>

        <RightPanel />
      </div>

      <BottomPanel onHeightChange={setBottomHeight} />
    </div>
  );
}
