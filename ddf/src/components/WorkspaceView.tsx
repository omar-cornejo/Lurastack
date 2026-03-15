import { useState } from "react";
import Header from "./Header";
import { LeftPanel } from "./LeftPanel";
import CenterPanel from "./CenterPanel";
import { RightPanel } from "./RightPanel";
import BottomPanel from "./BottomPanel";
import { TerraformProject, TerraformResource } from "../models/terraform";
import { writeTextFile, BaseDirectory } from "@tauri-apps/plugin-fs";

type WorkspaceViewProps = {
  viewId: string;
};

export default function WorkspaceView({ viewId }: WorkspaceViewProps) {
  const [bottomHeight, setBottomHeight] = useState(288);
  const [project, setProject] = useState<TerraformProject>({
    provider: "registry.terraform.io/hashicorp/aws",
    resources: [],
  });

  const terraformResourceToHCL = (r: TerraformResource) => {
    let attrs = "";
    for (const [k, v] of Object.entries(r.config.attributes)) {
      attrs += `  ${k} = "${v}"\n`;
    }
    return `resource "${r.type}" "${r.name}" {\n${attrs}}\n`;
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

  const addResource = async (type: string, icon: string) => {
    const newResource: TerraformResource = {
      id: crypto.randomUUID(),
      type,
      name: `${type}_example`,
      config: { attributes: {}, blocks: {} },
      ui: { x: 100, y: 100, icon },
    };
    const updatedProject = {
      ...project,
      resources: [...project.resources, newResource],
    };
    setProject(updatedProject);
    await saveProjectToHCL(updatedProject);
  };

  return (
    <div className="flex flex-col flex-1 overflow-hidden">
      <Header />

      <div className="flex flex-1 overflow-hidden">
        <LeftPanel bottomHeight={bottomHeight} addResource={addResource} />

        <main className="flex-1 overflow-auto bg-white">
          <CenterPanel />
        </main>

        <RightPanel />
      </div>

      <BottomPanel onHeightChange={setBottomHeight} />
    </div>
  );
}
