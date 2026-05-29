import { useEffect, useMemo, useState } from "react";
import { Icon } from "@iconify/react";
import {
  getRecentProjects,
  removeFromRecent,
  pickOpenPath,
  loadProjectFromPath,
  pickSavePath,
} from "../commands/projectManager";
import {
  loadTemplateIndex,
  pickTemplateDestination,
  createProjectFromTemplate,
} from "../commands/templateManager";
import type { RecentProject } from "../types/project";
import type { TemplateManifest, TemplateProvider } from "../types/templates";

type WelcomeScreenProps = {
  onProjectReady: (project: {
    name: string;
    filePath: string;
    isNew: boolean;
  }) => void;
};

type View = "recent" | "new" | "templates";

const PROVIDER_LOGO: Record<TemplateProvider, string> = {
  aws: "/icons/aws/AWS-Cloud-logo_32_Dark.svg",
  gcp: "/icons/gcp/GCP-Cloud-logo_32_Dark.svg",
  azure: "/icons/azure/Azure-Cloud-logo_32_Dark.svg",
};

const PROVIDERS: Array<{ id: TemplateProvider | "all"; label: string; logo?: string; icon?: string }> = [
  { id: "all", label: "All", icon: "mdi:apps" },
  { id: "aws", label: "AWS", logo: PROVIDER_LOGO.aws },
  { id: "azure", label: "Azure", logo: PROVIDER_LOGO.azure },
  { id: "gcp", label: "GCP", logo: PROVIDER_LOGO.gcp },
];

const PROVIDER_CHIP_COLORS: Record<string, { active: string; inactive: string }> = {
  all:   { active: "bg-slate-50 border-slate-400 text-slate-900 ring-1 ring-slate-300",          inactive: "bg-white border-slate-200 text-slate-600 hover:border-slate-300" },
  aws:   { active: "bg-orange-50 border-orange-400 text-orange-700 ring-1 ring-orange-200",      inactive: "bg-white border-slate-200 text-slate-600 hover:border-orange-300 hover:text-orange-600" },
  azure: { active: "bg-sky-50 border-sky-400 text-sky-700 ring-1 ring-sky-200",                  inactive: "bg-white border-slate-200 text-slate-600 hover:border-sky-300 hover:text-sky-600" },
  gcp:   { active: "bg-emerald-50 border-emerald-400 text-emerald-700 ring-1 ring-emerald-200",  inactive: "bg-white border-slate-200 text-slate-600 hover:border-emerald-300 hover:text-emerald-600" },
};

function formatDate(iso: string): string {
  try {
    return new Date(iso).toLocaleDateString(undefined, {
      year: "numeric",
      month: "short",
      day: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    });
  } catch {
    return iso;
  }
}

function toDirectoryPath(path: string | null): string | null {
  if (!path) return null;
  const normalized = path.replace(/\\/g, "/");
  const lastSlash = normalized.lastIndexOf("/");
  if (lastSlash <= 0) return path;
  return normalized.slice(0, lastSlash);
}

function providerLabel(provider: TemplateProvider): string {
  switch (provider) {
    case "aws": return "AWS";
    case "azure": return "Azure";
    case "gcp": return "GCP";
  }
}

function providerLogo(provider: TemplateProvider): string {
  return PROVIDER_LOGO[provider];
}

function providerAccent(provider: TemplateProvider): string {
  switch (provider) {
    case "aws":   return "text-orange-500";
    case "azure": return "text-sky-500";
    case "gcp":   return "text-emerald-500";
  }
}

function providerCardAccent(provider: TemplateProvider): {
  iconBg: string;
  hoverBorder: string;
  tagBg: string;
} {
  switch (provider) {
    case "aws":   return { iconBg: "bg-orange-50",  hoverBorder: "hover:border-orange-200",  tagBg: "bg-orange-50 text-orange-600 border-orange-100" };
    case "azure": return { iconBg: "bg-sky-50",     hoverBorder: "hover:border-sky-200",     tagBg: "bg-sky-50 text-sky-600 border-sky-100" };
    case "gcp":   return { iconBg: "bg-emerald-50", hoverBorder: "hover:border-emerald-200", tagBg: "bg-emerald-50 text-emerald-600 border-emerald-100" };
  }
}

export default function WelcomeScreen({ onProjectReady }: WelcomeScreenProps) {
  const [view, setView] = useState<View>("recent");
  const [recent, setRecent] = useState<RecentProject[]>([]);
  const [error, setError] = useState("");
  const [recentSearch, setRecentSearch] = useState("");

  const [newName, setNewName] = useState("");
  const [nameError, setNameError] = useState("");
  const [pickingDir, setPickingDir] = useState(false);
  const [chosenPath, setChosenPath] = useState<string | null>(null);

  const [templates, setTemplates] = useState<TemplateManifest[]>([]);
  const [providerFilter, setProviderFilter] = useState<TemplateProvider | "all">("all");
  const [selectedTemplate, setSelectedTemplate] = useState<TemplateManifest | null>(null);
  const [templateName, setTemplateName] = useState("");
  const [templateNameError, setTemplateNameError] = useState("");
  const [templatePath, setTemplatePath] = useState<string | null>(null);
  const [creatingFromTemplate, setCreatingFromTemplate] = useState(false);

  useEffect(() => {
    setRecent(getRecentProjects());
  }, []);

  useEffect(() => {
    if (view !== "templates") return;
    let cancelled = false;
    void loadTemplateIndex().then((list) => {
      if (!cancelled) setTemplates(list);
    });
    return () => { cancelled = true; };
  }, [view]);

  // Quick keyboard shortcuts: press N / T / O to jump to a section.
  // Disabled while typing in an input or while a modal is open.
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (selectedTemplate) return;
      if (e.metaKey || e.ctrlKey || e.altKey) return;
      const target = e.target as HTMLElement | null;
      const tag = target?.tagName;
      if (tag === "INPUT" || tag === "TEXTAREA" || target?.isContentEditable) return;

      const key = e.key.toLowerCase();
      if (key === "n") { e.preventDefault(); openNewForm(); }
      else if (key === "t") { e.preventDefault(); setView("templates"); setError(""); }
      else if (key === "o") { e.preventDefault(); void handleImport(); }
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedTemplate]);

  const filteredTemplates = useMemo(() => {
    if (providerFilter === "all") return templates;
    return templates.filter((t) => t.provider === providerFilter);
  }, [templates, providerFilter]);

  const filteredRecent = useMemo(() => {
    const q = recentSearch.trim().toLowerCase();
    if (!q) return recent;
    return recent.filter(
      (r) => r.name.toLowerCase().includes(q) || r.path.toLowerCase().includes(q)
    );
  }, [recent, recentSearch]);

  const handlePickSavePath = async () => {
    const trimmed = newName.trim();
    if (!trimmed) { setNameError("Project name is required"); return; }
    setPickingDir(true);
    try {
      const path = await pickSavePath(trimmed);
      if (path) setChosenPath(path);
    } catch (e) {
      setError(String(e));
    } finally {
      setPickingDir(false);
    }
  };

  const handleCreateProject = () => {
    const trimmed = newName.trim();
    if (!trimmed) { setNameError("Project name is required"); return; }
    if (!chosenPath) { setNameError("Choose a save location first"); return; }
    onProjectReady({ name: trimmed, filePath: chosenPath, isNew: true });
  };

  const openNewForm = () => {
    setView("new");
    setNewName("");
    setNameError("");
    setChosenPath(null);
    setError("");
    setRecentSearch("");
  };

  const handleClearAllRecent = () => {
    recent.forEach((entry) => removeFromRecent(entry.path));
    setRecent([]);
    setRecentSearch("");
  };

  const handleImport = async () => {
    setError("");
    try {
      const path = await pickOpenPath();
      if (!path) return;
      const project = await loadProjectFromPath(path);
      onProjectReady({ name: project.meta.name, filePath: path, isNew: false });
    } catch (e) {
      setError(`Could not open project: ${String(e)}`);
    }
  };

  const handleOpenRecent = async (entry: RecentProject) => {
    setError("");
    try {
      const project = await loadProjectFromPath(entry.path);
      onProjectReady({ name: project.meta.name, filePath: entry.path, isNew: false });
    } catch (e) {
      setError(`Could not load "${entry.name}": ${String(e)}`);
      removeFromRecent(entry.path);
      setRecent(getRecentProjects());
    }
  };

  const handleRemoveRecent = (e: React.MouseEvent, path: string) => {
    e.stopPropagation();
    removeFromRecent(path);
    setRecent(getRecentProjects());
  };

  const openTemplateModal = (template: TemplateManifest) => {
    setSelectedTemplate(template);
    setTemplateName(template.name.replace(/\s*—.*$/, ""));
    setTemplateNameError("");
    setTemplatePath(null);
  };

  const closeTemplateModal = () => {
    setSelectedTemplate(null);
    setTemplateName("");
    setTemplateNameError("");
    setTemplatePath(null);
  };

  const handlePickTemplatePath = async () => {
    const trimmed = templateName.trim();
    if (!trimmed) { setTemplateNameError("Project name is required"); return; }
    setPickingDir(true);
    try {
      const path = await pickTemplateDestination(trimmed);
      if (path) setTemplatePath(path);
    } catch (e) {
      setError(String(e));
    } finally {
      setPickingDir(false);
    }
  };

  const handleCreateFromTemplate = async () => {
    if (!selectedTemplate) return;
    const trimmed = templateName.trim();
    if (!trimmed) { setTemplateNameError("Project name is required"); return; }
    if (!templatePath) { setTemplateNameError("Choose a destination first"); return; }

    setCreatingFromTemplate(true);
    try {
      await createProjectFromTemplate(selectedTemplate.id, trimmed, templatePath);
      onProjectReady({ name: trimmed, filePath: templatePath, isNew: false });
    } catch (e) {
      setError(`Could not create project from template: ${String(e)}`);
    } finally {
      setCreatingFromTemplate(false);
    }
  };

  const selectedDirectoryPath = toDirectoryPath(chosenPath);
  const selectedTemplateDirectoryPath = toDirectoryPath(templatePath);

  return (
    <div className="flex w-full h-full bg-slate-100 overflow-hidden">

      {/* Left sidebar */}
      <div className="flex flex-col w-[220px] shrink-0 border-r border-slate-200 bg-white p-5">
        <div className="mb-7">
          <div className="text-[22px] font-bold tracking-[0.12em] text-slate-900 leading-tight">LuraStack</div>
          <div className="text-[10px] font-semibold uppercase tracking-widest text-slate-400 mt-0.5">
            Infrastructure Designer
          </div>
        </div>

        <div className="text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-2">Start</div>

        <div className="flex flex-col gap-1">
          <SideAction
            icon="mdi:folder-plus-outline"
            label="New Project"
            shortcut="N"
            onClick={openNewForm}
            active={view === "new"}
          />
          <SideAction
            icon="mdi:view-grid-outline"
            label="Templates"
            shortcut="T"
            description="Browse by provider"
            onClick={() => { setView("templates"); setError(""); }}
            active={view === "templates"}
          />
          <SideAction
            icon="mdi:folder-open-outline"
            label="Open Project"
            shortcut="O"
            description=".lura file"
            onClick={handleImport}
          />
          <SideAction
            icon="mdi:history"
            label="Recent"
            onClick={() => { setView("recent"); setError(""); }}
            active={view === "recent"}
          />
        </div>

        <div className="flex-1" />

        {error && (
          <div className="mb-3 p-2.5 rounded-lg bg-red-50 border border-red-200 text-[10px] text-red-600 leading-relaxed">
            {error}
          </div>
        )}

        <div className="pt-3 border-t border-slate-100">
          <div className="flex items-center gap-1.5">
            <Icon icon="mdi:layers-outline" className="text-slate-400 text-[13px] shrink-0" />
            <span className="text-[10px] text-slate-400 font-medium">LuraStack</span>
            <span className="ml-auto text-[10px] text-slate-300 tabular-nums">v0.1</span>
          </div>
        </div>
      </div>

      {/* Main content */}
      <div className="flex flex-col flex-1 min-w-0 p-8 overflow-y-auto">

        {/* New project form — full-width, two-column layout */}
        {view === "new" && (
          <div className="flex-1 min-h-0 flex flex-col">
            <div className="rounded-xl border border-slate-200 bg-white shadow-sm overflow-hidden">
              <div className="grid grid-cols-1 lg:grid-cols-[1.4fr_1fr]">
                {/* Form column */}
                <div className="p-7">
                  <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-1.5">
                    Project name
                  </label>
                  <input
                    autoFocus
                    type="text"
                    value={newName}
                    onChange={(e) => { setNewName(e.target.value); setNameError(""); }}
                    onKeyDown={(e) => {
                      if (e.key === "Escape") setView("recent");
                      if (e.key === "Enter" && chosenPath && newName.trim()) handleCreateProject();
                    }}
                    placeholder="My Infrastructure"
                    className={`w-full rounded-lg border ${
                      nameError ? "border-red-300" : "border-slate-200"
                    } bg-white px-3 py-2.5 text-sm text-slate-800 placeholder-slate-400 outline-none focus:border-slate-300 transition-colors`}
                  />
                  {nameError && <p className="text-[10px] text-red-500 mt-1">{nameError}</p>}

                  <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-1.5 mt-6">
                    Save location
                  </label>
                  <div className="flex gap-2 items-center">
                    <div className="flex-1 bg-slate-50 border border-slate-200 rounded-lg px-3 py-2.5 text-[11px] text-slate-600 truncate min-w-0">
                      {selectedDirectoryPath ?? (
                        <span className="text-slate-400 italic">No location chosen</span>
                      )}
                    </div>
                    <button
                      onClick={handlePickSavePath}
                      disabled={pickingDir}
                      className="shrink-0 flex items-center gap-1.5 px-3 py-2.5 text-[11px] rounded-lg border border-slate-200 hover:border-indigo-300 hover:bg-indigo-50 hover:text-indigo-600 text-slate-500 transition-colors disabled:opacity-40"
                    >
                      {pickingDir ? (
                        <Icon icon="mdi:loading" className="animate-spin text-sm" />
                      ) : (
                        <Icon icon="mdi:folder-search-outline" className="text-sm" />
                      )}
                      Browse…
                    </button>
                  </div>

                  <div className="flex gap-3 mt-8">
                    <button
                      onClick={() => setView("recent")}
                      className="px-5 py-2.5 text-xs rounded-lg border border-slate-200 hover:bg-slate-50 text-slate-600 transition-colors"
                    >
                      Cancel
                    </button>
                    <button
                      onClick={handleCreateProject}
                      disabled={!chosenPath || !newName.trim()}
                      className="flex-1 py-2.5 text-xs rounded-lg bg-blue-600 hover:bg-blue-500 disabled:opacity-40 text-white font-medium transition-colors"
                    >
                      Create Project
                    </button>
                  </div>
                </div>

                {/* Decorative / info column */}
                <div className="hidden lg:flex flex-col justify-center gap-4 border-l border-slate-100 bg-slate-50/60 p-7">
                  <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-indigo-50 ring-1 ring-indigo-100">
                    <Icon icon="mdi:folder-plus-outline" className="text-indigo-600 text-2xl" />
                  </div>
                  <div>
                    <h3 className="text-sm font-semibold text-slate-900">Start from scratch</h3>
                    <p className="text-[11px] text-slate-500 leading-relaxed mt-1">
                      Create an empty project and design your infrastructure visually on the canvas.
                      You can switch to a template anytime from the sidebar.
                    </p>
                  </div>
                  <div className="flex flex-col gap-2 mt-1">
                    {[
                      { icon: "mdi:vector-square", text: "Visual drag-and-drop canvas" },
                      { icon: "mdi:code-braces", text: "Generates Terraform HCL" },
                      { icon: "mdi:cloud-outline", text: "AWS · GCP · Azure" },
                    ].map((f) => (
                      <div key={f.text} className="flex items-center gap-2 text-[11px] text-slate-500">
                        <Icon icon={f.icon} className="text-slate-400 text-sm shrink-0" />
                        {f.text}
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Templates gallery */}
        {view === "templates" && (
          <TemplatesGallery
            templates={filteredTemplates}
            providerFilter={providerFilter}
            onChangeFilter={setProviderFilter}
            onPickTemplate={openTemplateModal}
          />
        )}

        {/* Recent projects — dedicated section */}
        {view === "recent" && (
          <div className="flex-1 min-h-0 flex flex-col">
            <div className="flex items-center gap-3 mb-4">
              <h2 className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest shrink-0">
                Recent
              </h2>
              <div className="flex-1 relative max-w-xs">
                <Icon
                  icon="mdi:magnify"
                  className="pointer-events-none absolute left-2.5 top-1/2 -translate-y-1/2 text-slate-400"
                  width={12}
                />
                <input
                  value={recentSearch}
                  onChange={(e) => setRecentSearch(e.target.value)}
                  placeholder="Filter projects…"
                  className="w-full rounded-lg border border-slate-200 bg-white py-1.5 pl-7 pr-3 text-[11px] text-slate-700 placeholder-slate-400 outline-none focus:border-slate-300 transition-colors"
                />
              </div>
              <div className="flex-1" />
              {recent.length > 0 && (
                <button
                  onClick={handleClearAllRecent}
                  className="shrink-0 text-[10px] text-slate-400 hover:text-red-500 transition-colors font-medium"
                >
                  Clear all
                </button>
              )}
            </div>

            {filteredRecent.length === 0 && (
              <div className="flex flex-col items-center justify-center flex-1 gap-4 py-12">
                <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-slate-200/60 border border-slate-200">
                  <Icon icon="mdi:folder-open-outline" className="text-4xl text-slate-400" />
                </div>
                <div className="text-center">
                  <p className="text-sm font-medium text-slate-600">
                    {recentSearch.trim() ? "No matching projects" : "No recent projects"}
                  </p>
                  <p className="text-xs text-slate-400 mt-1">
                    {recentSearch.trim()
                      ? `No projects match "${recentSearch}"`
                      : "Create a new project or open an existing one"}
                  </p>
                </div>
                {!recentSearch.trim() && (
                  <button
                    onClick={openNewForm}
                    className="flex items-center gap-1.5 text-xs text-indigo-600 hover:text-indigo-800 font-medium transition-colors"
                  >
                    <Icon icon="mdi:plus" className="text-sm" />
                    Create your first project
                  </button>
                )}
              </div>
            )}

            {filteredRecent.length > 0 && (
              <div
                className="grid gap-2 overflow-y-auto pr-1"
                style={{ gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))" }}
              >
                {filteredRecent.map((entry) => (
                  <RecentCard
                    key={entry.path}
                    entry={entry}
                    onClick={() => void handleOpenRecent(entry)}
                    onRemove={(e) => handleRemoveRecent(e, entry.path)}
                  />
                ))}
              </div>
            )}
          </div>
        )}
      </div>

      {/* Template creation modal */}
      {selectedTemplate && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50">
          <div className="w-full max-w-md mx-4 rounded-xl border border-slate-200 bg-white p-6 shadow-xl shadow-slate-200/60">
            <div className="flex items-start gap-3 mb-5">
              <div className="flex h-11 w-11 shrink-0 items-center justify-center overflow-hidden rounded-xl bg-slate-100 ring-1 ring-slate-200">
                <img
                  src={providerLogo(selectedTemplate.provider)}
                  alt={providerLabel(selectedTemplate.provider)}
                  className="h-full w-full object-cover"
                  draggable={false}
                />
              </div>
              <div className="flex-1 min-w-0">
                <div className="text-sm font-semibold text-slate-900 truncate">{selectedTemplate.name}</div>
                <div className="text-[11px] text-slate-500 mt-0.5">{selectedTemplate.description}</div>
              </div>
              <button
                onClick={closeTemplateModal}
                className="text-slate-400 hover:text-slate-700 transition-colors"
              >
                <Icon icon="mdi:close" className="text-base" />
              </button>
            </div>

            <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-1.5">
              Project name
            </label>
            <input
              autoFocus
              type="text"
              value={templateName}
              onChange={(e) => { setTemplateName(e.target.value); setTemplateNameError(""); }}
              onKeyDown={(e) => { if (e.key === "Escape") closeTemplateModal(); }}
              placeholder="My Infrastructure"
              className={`w-full rounded-lg border ${
                templateNameError ? "border-red-300" : "border-slate-200"
              } bg-white px-3 py-2 text-sm text-slate-800 placeholder-slate-400 outline-none focus:border-slate-300 transition-colors mb-1`}
            />
            {templateNameError && <p className="text-[10px] text-red-500 mb-3">{templateNameError}</p>}

            <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-1.5 mt-4">
              Destination
            </label>
            <div className="flex gap-2 items-center">
              <div className="flex-1 bg-slate-50 border border-slate-200 rounded-lg px-3 py-2 text-[11px] text-slate-600 truncate min-w-0">
                {selectedTemplateDirectoryPath ?? (
                  <span className="text-slate-400 italic">No location chosen</span>
                )}
              </div>
              <button
                onClick={handlePickTemplatePath}
                disabled={pickingDir}
                className="shrink-0 flex items-center gap-1.5 px-3 py-2 text-[11px] rounded-lg border border-slate-200 hover:border-indigo-300 hover:bg-indigo-50 hover:text-indigo-600 text-slate-500 transition-colors disabled:opacity-40"
              >
                {pickingDir ? (
                  <Icon icon="mdi:loading" className="animate-spin text-sm" />
                ) : (
                  <Icon icon="mdi:folder-search-outline" className="text-sm" />
                )}
                Browse…
              </button>
            </div>

            <div className="flex gap-3 mt-5">
              <button
                onClick={closeTemplateModal}
                className="flex-1 py-2 text-xs rounded-lg border border-slate-200 hover:bg-slate-50 text-slate-600 transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={() => void handleCreateFromTemplate()}
                disabled={!templatePath || !templateName.trim() || creatingFromTemplate}
                className="flex-1 py-2 text-xs rounded-lg bg-blue-600 hover:bg-blue-500 disabled:opacity-40 text-white font-medium transition-colors flex items-center justify-center gap-1.5"
              >
                {creatingFromTemplate && <Icon icon="mdi:loading" className="animate-spin text-sm" />}
                Create from template
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function SideAction({
  icon,
  label,
  description,
  onClick,
  active,
  shortcut,
}: {
  icon: string;
  label: string;
  description?: string;
  onClick: () => void;
  active?: boolean;
  shortcut?: string;
}) {
  return (
    <button
      onClick={onClick}
      className={`group flex items-center gap-2.5 px-3 py-2.5 rounded-lg text-left transition-colors w-full
        ${active
          ? "bg-slate-100 text-slate-900 border border-slate-200"
          : "hover:bg-slate-50 text-slate-600 hover:text-slate-900 border border-transparent"
        }`}
    >
      <Icon
        icon={icon}
        className={`text-[17px] shrink-0 transition-colors ${
          active ? "text-indigo-600" : "text-slate-400 group-hover:text-slate-600"
        }`}
      />
      <div className="flex-1 min-w-0">
        <div className="text-xs font-medium truncate">{label}</div>
        {description && (
          <div className="text-[10px] text-slate-400 mt-px">{description}</div>
        )}
      </div>
      {shortcut && (
        <kbd className="shrink-0 text-[10px] font-mono font-normal text-slate-400 bg-slate-100 border border-slate-200 rounded px-1.5 py-0.5 leading-none">
          {shortcut}
        </kbd>
      )}
    </button>
  );
}

function RecentCard({
  entry,
  onClick,
  onRemove,
}: {
  entry: RecentProject;
  onClick: () => void;
  onRemove: (e: React.MouseEvent) => void;
}) {
  return (
    <div
      role="button"
      tabIndex={0}
      onClick={onClick}
      onKeyDown={(event) => {
        if (event.key === "Enter" || event.key === " ") {
          event.preventDefault();
          onClick();
        }
      }}
      className="group w-full text-left flex items-center gap-3.5 px-4 py-3.5 rounded-xl bg-white border border-slate-200 hover:border-indigo-300/70 hover:shadow-sm hover:shadow-indigo-100/50 transition-all cursor-pointer"
    >
      <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-slate-100 ring-1 ring-slate-200">
        <Icon icon="mdi:layers-outline" className="text-indigo-500 text-lg" />
      </div>
      <div className="flex-1 min-w-0">
        <div className="text-[13px] text-slate-900 font-semibold truncate leading-snug">{entry.name}</div>
        <div className="text-[10px] text-slate-400 truncate mt-0.5">{entry.path}</div>
      </div>
      <div className="flex flex-col items-end gap-2 shrink-0">
        <span className="text-[10px] text-slate-400 tabular-nums">{formatDate(entry.updatedAt)}</span>
        <button
          type="button"
          onClick={onRemove}
          title="Remove from recent"
          className="opacity-0 group-hover:opacity-100 text-slate-300 hover:text-red-500 transition-all"
        >
          <Icon icon="mdi:close" className="text-xs" />
        </button>
      </div>
    </div>
  );
}

function TemplatesGallery({
  templates,
  providerFilter,
  onChangeFilter,
  onPickTemplate,
}: {
  templates: TemplateManifest[];
  providerFilter: TemplateProvider | "all";
  onChangeFilter: (p: TemplateProvider | "all") => void;
  onPickTemplate: (t: TemplateManifest) => void;
}) {
  return (
    <div className="flex-1 min-h-0 flex flex-col">
      <div className="flex items-center gap-3 mb-4">
        <h2 className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest shrink-0">
          Templates
        </h2>
        <div className="h-px flex-1 bg-slate-200" />
        <span className="text-[10px] text-slate-400 tabular-nums">
          {templates.length} template{templates.length !== 1 ? "s" : ""}
        </span>
      </div>

      <div className="flex gap-1.5 mb-5 flex-wrap">
        {PROVIDERS.map((p) => {
          const active = providerFilter === p.id;
          const colors = PROVIDER_CHIP_COLORS[p.id];
          return (
            <button
              key={p.id}
              onClick={() => onChangeFilter(p.id)}
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-[11px] font-medium border transition-colors
                ${active ? colors.active : colors.inactive}`}
            >
              {p.logo ? (
                <img
                  src={p.logo}
                  alt=""
                  draggable={false}
                  className="h-4 w-4 object-contain"
                />
              ) : (
                <Icon icon={p.icon!} className="text-[13px]" />
              )}
              {p.label}
            </button>
          );
        })}
      </div>

      {templates.length === 0 ? (
        <div className="flex flex-col items-center justify-center flex-1 gap-4 py-12">
          <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-slate-200/60 border border-slate-200">
            <Icon icon="mdi:view-grid-outline" className="text-4xl text-slate-400" />
          </div>
          <p className="text-sm font-medium text-slate-500">No templates for this filter</p>
        </div>
      ) : (
        <div
          className="grid gap-3 overflow-y-auto pr-1"
          style={{ gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))" }}
        >
          {templates.map((t) => (
            <TemplateCard key={t.id} template={t} onClick={() => onPickTemplate(t)} />
          ))}
        </div>
      )}
    </div>
  );
}

function TemplateCard({
  template,
  onClick,
}: {
  template: TemplateManifest;
  onClick: () => void;
}) {
  const accent = providerCardAccent(template.provider);
  return (
    <button
      onClick={onClick}
      className={`text-left flex flex-col gap-3 p-4 rounded-xl bg-white border border-slate-200 ${accent.hoverBorder} hover:shadow-sm transition-all`}
    >
      <div className="flex items-start gap-3">
        <div className="flex h-10 w-10 shrink-0 items-center justify-center overflow-hidden rounded-lg bg-slate-100 ring-1 ring-slate-200">
          <img
            src={providerLogo(template.provider)}
            alt={providerLabel(template.provider)}
            className="h-full w-full object-cover"
            draggable={false}
          />
        </div>
        <div className="flex-1 min-w-0 pt-0.5">
          <div className="text-[13px] text-slate-900 font-semibold truncate leading-snug">{template.name}</div>
          <div className={`text-[10px] font-semibold uppercase tracking-widest mt-px ${providerAccent(template.provider)}`}>
            {providerLabel(template.provider)}
          </div>
        </div>
      </div>
      <p className="text-[11px] text-slate-500 leading-relaxed line-clamp-2">
        {template.description}
      </p>
      <div className="flex items-center gap-1.5 mt-auto flex-wrap">
        <span className={`text-[10px] px-1.5 py-0.5 rounded border font-medium ${accent.tagBg}`}>
          {template.resourceCount} resources
        </span>
        {template.tags.slice(0, 2).map((tag) => (
          <span
            key={tag}
            className="text-[10px] px-1.5 py-0.5 rounded bg-slate-100 text-slate-500 border border-slate-200"
          >
            {tag}
          </span>
        ))}
      </div>
    </button>
  );
}
