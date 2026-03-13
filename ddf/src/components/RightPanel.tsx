import { useState, useRef, useEffect } from "react";
import { Icon } from "@iconify/react";

type RightPanelTab = "info" | "hcl";

export const RightPanel = () => {
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const [activeTab, setActiveTab] = useState<RightPanelTab>("info");
  const panelRef = useRef<HTMLDivElement>(null);

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
          <strong className="text-sm text-gray-800">Derecha</strong>
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
          {activeTab === "info" && (
            <div className="space-y-2 text-sm text-gray-800">
              <p>Contenido del panel derecho.</p>
              <p className="text-gray-500 text-xs">
                Aquí puedes mostrar información contextual del recurso
                seleccionado, documentación, etc.
              </p>
            </div>
          )}

          {activeTab === "hcl" && (
            <div className="h-full flex flex-col">
              <p className="mb-2 text-sm font-medium text-gray-800">
                Ejemplo de configuración Terraform (HCL)
              </p>
              <div className="flex-1 rounded border border-gray-200 bg-[#0b1120] text-[#e5e7eb] text-xs font-mono p-2 overflow-auto">
                <pre>
{`terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "mi-bucket-ejemplo"

  tags = {
    Project = "ddf"
    Env     = "dev"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-1234567890"
  instance_type = "t3.micro"

  tags = {
    Name = "web-ddf"
  }
}`}
                </pre>
              </div>
            </div>
          )}
        </div>
      )}
    </aside>
  );
};
