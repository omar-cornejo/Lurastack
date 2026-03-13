import "./App.css";
import { useState } from "react";
import Header from "./components/Header";
import { LeftPanel } from "./components/LeftPanel";
import CenterPanel from "./components/CenterPanel";
import { RightPanel } from "./components/RightPanel";
import BottomPanel from "./components/BottomPanel";
import { TerraformProject, TerraformResource } from "./models/terraform";
import { writeTextFile, BaseDirectory } from "@tauri-apps/plugin-fs";

function App() {
  const [bottomHeight, setBottomHeight] = useState(288);
  const [project, setProject] = useState<TerraformProject>({
    provider: "registry.terraform.io/hashicorp/aws",
    resources: []
  });


  const terraformResourceToHCL = (r: TerraformResource) => {
    let attrs = "";
    for (const [k, v] of Object.entries(r.config.attributes)) {
      attrs += `  ${k} = "${v}"\n`;
    }

    // Por ahora solo atributos simples, puedes expandir con blocks más tarde
    return `resource "${r.type}" "${r.name}" {\n${attrs}}\n`;
  };

  const saveProjectToHCL = async (project: TerraformProject) => {
    let hcl = `terraform {\n  required_providers {\n    ${project.provider.split("/").pop()} = {}\n  }\n}\n\n`;
    project.resources.forEach(r => {
      hcl += terraformResourceToHCL(r) + "\n";
    });

    await writeTextFile("project.tf", hcl, { baseDir: BaseDirectory.AppData });
  };

  const addResource = async (type: string, icon: string) => {
    const newResource: TerraformResource = {
      id: crypto.randomUUID(),
      type,
      name: `${type}_example`,

      config: {
        attributes: {},
        blocks: {}
      },

      ui: {
        x: 100,
        y: 100,
        icon
      }
    };

    const updatedProject = { ...project, resources: [...project.resources, newResource] };
    setProject(updatedProject);
    await saveProjectToHCL(updatedProject);
  };


  return (
    <div className="h-screen flex flex-col overflow-hidden">
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

export default App;
