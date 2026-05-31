import { useState, useRef, useEffect } from "react";
import { Icon } from "@iconify/react";
import { useTranslation } from "react-i18next";
import { ViewInfo } from "../types/views";
import LanguageSwitcher from "./LanguageSwitcher";

type GlobalBarProps = {
  views: ViewInfo[];
  activeViewId: string;
  hasProject: boolean;
  projectName: string | null;
  autosave: boolean;
  onSwitchView: (id: string) => void;
  onCreateView: () => void;
  onCloseView: (id: string) => void;
  onRenameView: (id: string, nextName: string) => void;
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

type MenuDef = { id: string; label: string; entries: MenuEntry[] };

export default function GlobalBar({
  views,
  activeViewId,
  hasProject,
  projectName,
  autosave,
  onSwitchView,
  onCreateView,
  onCloseView,
  onRenameView,
  onNewProject,
  onOpenProject,
  onSaveProject,
  onSaveProjectAs,
  onExportHcl,
  onToggleAutosave,
}: GlobalBarProps) {
  const { t } = useTranslation();
  const [openMenu, setOpenMenu] = useState<string | null>(null);
  const [editingViewId, setEditingViewId] = useState<string | null>(null);
  const [editingViewName, setEditingViewName] = useState("");
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

  const startEditingView = (view: ViewInfo) => {
    setEditingViewId(view.id);
    setEditingViewName(view.name);
  };

  const commitViewRename = (view: ViewInfo) => {
    const trimmed = editingViewName.trim();
    setEditingViewId(null);
    setEditingViewName("");
    if (!trimmed || trimmed === view.name) return;
    onRenameView(view.id, trimmed);
  };

  const cancelViewRename = () => {
    setEditingViewId(null);
    setEditingViewName("");
  };

  const menus: MenuDef[] = [
    {
      id: "File",
      label: t("globalbar.menu.file"),
      entries: [
        {
          label: t("globalbar.item.newProject"),
          action: () => { onNewProject(); closeMenu(); },
        },
        {
          label: t("globalbar.item.openProject"),
          action: () => { void onOpenProject(); closeMenu(); },
        },
        { kind: "separator" },
        hasProject
          ? { label: t("globalbar.item.save"), action: () => { void onSaveProject(); closeMenu(); } }
          : { label: t("globalbar.item.save"), disabled: true },
        hasProject
          ? { label: t("globalbar.item.saveAs"), action: () => { void onSaveProjectAs(); closeMenu(); } }
          : { label: t("globalbar.item.saveAs"), disabled: true },
        { kind: "separator" },
        hasProject
          ? { label: t("globalbar.item.exportHcl"), action: () => { onExportHcl(); closeMenu(); } }
          : { label: t("globalbar.item.exportHcl"), disabled: true },
        { kind: "separator" },
        {
          label: t("globalbar.item.autosave"),
          check: autosave,
          action: () => { onToggleAutosave(); closeMenu(); },
        },
      ],
    },
    {
      id: "View",
      label: t("globalbar.menu.view"),
      entries: [
        { label: t("globalbar.item.zoomIn"), disabled: true },
        { label: t("globalbar.item.zoomOut"), disabled: true },
        { label: t("globalbar.item.fitToCanvas"), disabled: true },
      ],
    },
    {
      id: "Tools",
      label: t("globalbar.menu.tools"),
      entries: [
        { label: t("globalbar.item.validateTerraform"), disabled: true },
        { label: "Plan", disabled: true },
        { label: "Apply", disabled: true },
      ],
    },
  ];

  return (
    <div
      ref={barRef}
      className="flex items-stretch bg-slate-950 text-slate-300 text-xs select-none z-50 shrink-0 border-b border-slate-800"
      style={{ height: 30 }}
    >
      <div className="flex items-center px-3.5 text-white font-bold tracking-widest border-r border-slate-800 text-xs shrink-0">
        LuraStack
      </div>

      {projectName && (
        <div className="flex items-center px-3 text-[11px] text-slate-400 border-r border-slate-800 shrink-0 max-w-[200px] truncate gap-1.5">
          <Icon icon="mdi:layers-outline" className="text-blue-400 shrink-0" />
          <span className="truncate">{projectName}</span>
        </div>
      )}

      <div className="flex items-stretch shrink-0">
        {menus.map((menu) => (
          <div key={menu.id} className="relative">
            <button
              onClick={() => toggleMenu(menu.id)}
              className={`h-full px-3.5 text-[12px] hover:bg-slate-800 transition-colors ${
                openMenu === menu.id ? "bg-slate-800 text-white" : ""
              }`}
            >
              {menu.label}
            </button>

            {openMenu === menu.id && (
              <div className="absolute left-0 top-full mt-0 bg-slate-900 border border-slate-700 rounded-b-lg shadow-xl z-50 min-w-[200px] py-1.5 text-[13px]">
                {menu.entries.map((entry, i) => {
                  if (entry.kind === "separator") {
                    return <div key={`sep-${i}`} className="my-1 border-t border-slate-800" />;
                  }
                  if (entry.disabled) {
                    return (
                      <div key={entry.label} className="px-4 py-1.5 text-slate-600 cursor-not-allowed">
                        {entry.label}
                      </div>
                    );
                  }
                  return (
                    <button
                      key={entry.label}
                      onClick={entry.action}
                      className="w-full text-left px-4 py-1.5 hover:bg-slate-700 hover:text-white transition-colors flex items-center justify-between"
                    >
                      <span>{entry.label}</span>
                      {entry.check !== undefined && (
                        <Icon
                          icon="mdi:check"
                          className={`text-[13px] ml-4 ${entry.check ? "text-blue-400" : "opacity-0"}`}
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

      {hasProject && <div className="w-px bg-slate-800 mx-1 self-stretch shrink-0" />}

      {hasProject && (
        <div className="flex items-stretch flex-1 overflow-x-auto min-w-0">
          {views.map((view) => {
            const isActive = view.id === activeViewId;
            return (
              <div
                key={view.id}
                onClick={() => onSwitchView(view.id)}
                className={`
                  group flex items-center gap-1.5 px-3.5 cursor-pointer border-r border-slate-800
                  transition-colors whitespace-nowrap shrink-0
                  ${isActive
                    ? "bg-slate-800 text-white border-b-2 border-b-blue-400"
                    : "hover:bg-slate-800/60 text-slate-400 hover:text-slate-200"}
                `}
                style={{ minWidth: 96, maxWidth: 190 }}
              >
                <Icon icon="mdi:layers-outline" className="text-[14px] shrink-0 opacity-60" />
                {editingViewId === view.id ? (
                  <input
                    autoFocus
                    value={editingViewName}
                    onChange={(event) => setEditingViewName(event.target.value)}
                    onClick={(event) => event.stopPropagation()}
                    onBlur={() => commitViewRename(view)}
                    onKeyDown={(event) => {
                      if (event.key === "Enter") {
                        event.preventDefault();
                        commitViewRename(view);
                      }
                      if (event.key === "Escape") {
                        event.preventDefault();
                        cancelViewRename();
                      }
                    }}
                    className="min-w-0 flex-1 rounded border border-blue-500 bg-slate-900 px-1.5 py-0.5 text-[12px] text-white outline-none"
                  />
                ) : (
                  <span
                    className="truncate text-[12px] flex-1"
                    onClick={(event) => {
                      event.stopPropagation();
                      startEditingView(view);
                    }}
                    title={t("globalbar.clickToRename")}
                  >
                    {view.name}
                  </span>
                )}
                {views.length > 1 && (
                  <button
                    onClick={(e) => { e.stopPropagation(); onCloseView(view.id); }}
                    className="opacity-0 group-hover:opacity-100 hover:text-red-400 transition-opacity ml-1 shrink-0"
                  >
                    <Icon icon="mdi:close" className="text-[13px]" />
                  </button>
                )}
              </div>
            );
          })}

          <button
            onClick={onCreateView}
            title={t("globalbar.newView")}
            className="flex items-center px-3 hover:bg-slate-800 hover:text-white transition-colors text-slate-500 shrink-0"
          >
            <Icon icon="mdi:plus" className="text-[15px]" />
          </button>
        </div>
      )}

      {hasProject && autosave && (
        <div className="flex items-center px-3 text-[11px] text-slate-500 gap-1.5 shrink-0">
          <Icon icon="mdi:content-save-outline" className="text-[13px] text-emerald-500" />
          {t("globalbar.autosave")}
        </div>
      )}

      <div className="ml-auto flex items-stretch shrink-0">
        <LanguageSwitcher variant="dark" />
      </div>
    </div>
  );
}
