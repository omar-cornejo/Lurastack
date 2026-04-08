import { useState, useRef, useEffect } from "react";
import { Icon } from "@iconify/react";
import { ViewInfo } from "../types/views";

type GlobalBarProps = {
  views: ViewInfo[];
  activeViewId: string;
  hasProject: boolean;
  projectName: string | null;
  autosave: boolean;
  onSwitchView: (id: string) => void;
  onCreateView: () => void;
  onCloseView: (id: string) => void;
  onNewProject: () => void;
  onOpenProject: () => Promise<void>;
  onSaveProject: () => Promise<void>;
  onSaveProjectAs: () => Promise<void>;
  onExportHcl: () => void;
  onToggleAutosave: () => void;
};

type MenuEntry =
  | { kind?: "item"; label: string; action: () => void; disabled?: false; check?: boolean }
  | { kind?: "item"; label: string; disabled: true; action?: never; check?: boolean }
  | { kind: "separator" };

export default function GlobalBar({
  views,
  activeViewId,
  hasProject,
  projectName,
  autosave,
  onSwitchView,
  onCreateView,
  onCloseView,
  onNewProject,
  onOpenProject,
  onSaveProject,
  onSaveProjectAs,
  onExportHcl,
  onToggleAutosave,
}: GlobalBarProps) {
  const [openMenu, setOpenMenu] = useState<string | null>(null);
  const barRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (barRef.current && !barRef.current.contains(e.target as Node)) {
        setOpenMenu(null);
      }
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  const toggleMenu = (name: string) =>
    setOpenMenu((prev) => (prev === name ? null : name));
  const closeMenu = () => setOpenMenu(null);

  const menus: { name: string; entries: MenuEntry[] }[] = [
    {
      name: "File",
      entries: [
        {
          label: "New Project",
          action: () => { onNewProject(); closeMenu(); },
        },
        {
          label: "Open Project…",
          action: () => { void onOpenProject(); closeMenu(); },
        },
        { kind: "separator" },
        hasProject
          ? { label: "Save", action: () => { void onSaveProject(); closeMenu(); } }
          : { label: "Save", disabled: true },
        hasProject
          ? { label: "Save As…", action: () => { void onSaveProjectAs(); closeMenu(); } }
          : { label: "Save As…", disabled: true },
        { kind: "separator" },
        hasProject
          ? { label: "Export HCL", action: () => { onExportHcl(); closeMenu(); } }
          : { label: "Export HCL", disabled: true },
        { kind: "separator" },
        {
          label: "Autosave",
          check: autosave,
          action: () => { onToggleAutosave(); closeMenu(); },
        },
      ],
    },
    {
      name: "View",
      entries: [
        { label: "Zoom +", disabled: true },
        { label: "Zoom −", disabled: true },
        { label: "Fit to canvas", disabled: true },
      ],
    },
    {
      name: "Tools",
      entries: [
        { label: "Validate Terraform", disabled: true },
        { label: "Plan", disabled: true },
        { label: "Apply", disabled: true },
      ],
    },
  ];

  return (
    <div
      ref={barRef}
      className="flex items-stretch bg-gray-950 text-gray-300 text-xs select-none z-50 shrink-0"
      style={{ height: 26 }}
    >
      {/* Brand */}
      <div className="flex items-center px-3 text-white font-bold tracking-widest border-r border-gray-800 text-[11px] shrink-0">
        ddf
      </div>

      {/* Project name badge */}
      {projectName && (
        <div className="flex items-center px-3 text-[10px] text-gray-500 border-r border-gray-800 shrink-0 max-w-[200px] truncate gap-1.5">
          <Icon icon="mdi:layers-outline" className="text-blue-500 shrink-0" />
          <span className="truncate">{projectName}</span>
        </div>
      )}

      {/* Dropdown menus */}
      <div className="flex items-stretch shrink-0">
        {menus.map((menu) => (
          <div key={menu.name} className="relative">
            <button
              onClick={() => toggleMenu(menu.name)}
              className={`h-full px-3 hover:bg-gray-800 transition-colors ${
                openMenu === menu.name ? "bg-gray-800 text-white" : ""
              }`}
            >
              {menu.name}
            </button>

            {openMenu === menu.name && (
              <div className="absolute left-0 top-full mt-0 bg-gray-900 border border-gray-700 shadow-xl z-50 min-w-[190px] py-1">
                {menu.entries.map((entry, i) => {
                  if (entry.kind === "separator") {
                    return <div key={`sep-${i}`} className="my-1 border-t border-gray-800" />;
                  }
                  if (entry.disabled) {
                    return (
                      <div key={entry.label} className="px-4 py-1.5 text-gray-600 cursor-not-allowed">
                        {entry.label}
                      </div>
                    );
                  }
                  return (
                    <button
                      key={entry.label}
                      onClick={entry.action}
                      className="w-full text-left px-4 py-1.5 hover:bg-gray-700 hover:text-white transition-colors flex items-center justify-between"
                    >
                      <span>{entry.label}</span>
                      {entry.check !== undefined && (
                        <Icon
                          icon="mdi:check"
                          className={`text-[12px] ml-4 ${entry.check ? "text-blue-400" : "opacity-0"}`}
                        />
                      )}
                    </button>
                  );
                })}
              </div>
            )}
          </div>
        ))}
      </div>

      {/* Separator */}
      {hasProject && <div className="w-px bg-gray-800 mx-1 self-stretch shrink-0" />}

      {/* View tabs */}
      {hasProject && (
        <div className="flex items-stretch flex-1 overflow-x-auto min-w-0">
          {views.map((view) => {
            const isActive = view.id === activeViewId;
            return (
              <div
                key={view.id}
                onClick={() => onSwitchView(view.id)}
                className={`
                  group flex items-center gap-1.5 px-3 cursor-pointer border-r border-gray-800
                  transition-colors whitespace-nowrap shrink-0
                  ${isActive
                    ? "bg-gray-700 text-white border-b-2 border-b-blue-400"
                    : "hover:bg-gray-800 text-gray-400 hover:text-gray-200"}
                `}
                style={{ minWidth: 90, maxWidth: 180 }}
              >
                <Icon icon="mdi:layers-outline" className="text-[13px] shrink-0 opacity-60" />
                <span className="truncate text-[11px] flex-1">{view.name}</span>
                {views.length > 1 && (
                  <button
                    onClick={(e) => { e.stopPropagation(); onCloseView(view.id); }}
                    className="opacity-0 group-hover:opacity-100 hover:text-red-400 transition-opacity ml-1 shrink-0"
                  >
                    <Icon icon="mdi:close" className="text-[12px]" />
                  </button>
                )}
              </div>
            );
          })}

          <button
            onClick={onCreateView}
            title="New view"
            className="flex items-center px-2.5 hover:bg-gray-800 hover:text-white transition-colors text-gray-500 shrink-0"
          >
            <Icon icon="mdi:plus" className="text-[14px]" />
          </button>
        </div>
      )}

      {/* Autosave indicator */}
      {hasProject && autosave && (
        <div className="flex items-center px-3 text-[10px] text-gray-600 gap-1 shrink-0">
          <Icon icon="mdi:content-save-outline" className="text-[12px] text-green-600" />
          autosave
        </div>
      )}
    </div>
  );
}
