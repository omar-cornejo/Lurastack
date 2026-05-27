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

const PROVIDERS: Array<{ id: TemplateProvider | "all"; label: string; icon: string }> = [
  { id: "all", label: "Todos", icon: "mdi:apps" },
  { id: "aws", label: "AWS", icon: "mdi:aws" },
  { id: "azure", label: "Azure", icon: "mdi:microsoft-azure" },
  { id: "gcp", label: "GCP", icon: "mdi:google-cloud" },
];

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

function providerIcon(provider: TemplateProvider): string {
  switch (provider) {
    case "aws": return "mdi:aws";
    case "azure": return "mdi:microsoft-azure";
    case "gcp": return "mdi:google-cloud";
  }
}

function providerAccent(provider: TemplateProvider): string {
  switch (provider) {
    case "aws": return "text-orange-400";
    case "azure": return "text-sky-400";
    case "gcp": return "text-emerald-400";
  }
}

export default function WelcomeScreen({ onProjectReady }: WelcomeScreenProps) {
  const [view, setView] = useState<View>("recent");
  const [recent, setRecent] = useState<RecentProject[]>([]);
  const [error, setError] = useState("");

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

  const filteredTemplates = useMemo(() => {
    if (providerFilter === "all") return templates;
    return templates.filter((t) => t.provider === providerFilter);
  }, [templates, providerFilter]);

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
    setTemplateName(template.name.replace(/\s*—.*$/, "")); // strip "— ..." suffix as default
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
    <div className="flex w-full h-full bg-gray-950 overflow-hidden">

      <div className="flex flex-col w-64 shrink-0 border-r border-gray-800 bg-gray-950 p-6">
        <div className="mb-8">
          <div className="text-4xl font-bold tracking-[0.2em] text-white">LuraStack</div>
        </div>

        <div className="flex flex-col gap-2">
          <SideAction
            icon="mdi:folder-plus-outline"
            label="New Project"
            onClick={openNewForm}
            active={view === "new"}
          />
          <SideAction
            icon="mdi:view-grid-outline"
            label="Templates"
            description="Galería por proveedor"
            onClick={() => { setView("templates"); setError(""); }}
            active={view === "templates"}
          />
          <SideAction
            icon="mdi:folder-open-outline"
            label="Import Project"
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
          <div className="mt-4 p-2.5 rounded bg-red-950 border border-red-800 text-[10px] text-red-400 leading-relaxed">
            {error}
          </div>
        )}
      </div>

      <div className="flex flex-col flex-1 min-w-0 p-8 overflow-hidden">

        {view === "new" && (
          <div className="mb-8 p-6 rounded-lg border border-gray-800 bg-gray-900 max-w-xl">
            <div className="flex items-center justify-between mb-5">
              <h2 className="text-sm font-semibold text-white">New Project</h2>
              <button
                onClick={() => setView("recent")}
                className="text-gray-600 hover:text-gray-300 transition-colors"
              >
                <Icon icon="mdi:close" className="text-base" />
              </button>
            </div>

            <label className="block text-[10px] text-gray-500 mb-1 uppercase tracking-wide">
              Project name
            </label>
            <input
              autoFocus
              type="text"
              value={newName}
              onChange={(e) => { setNewName(e.target.value); setNameError(""); }}
              onKeyDown={(e) => { if (e.key === "Escape") setView("recent"); }}
              placeholder="My Infrastructure"
              className={`w-full bg-gray-800 border ${
                nameError ? "border-red-500" : "border-gray-700"
              } rounded px-3 py-2 text-sm text-white placeholder-gray-600 outline-none focus:border-blue-500 transition-colors mb-1`}
            />
            {nameError && <p className="text-[10px] text-red-400 mb-3">{nameError}</p>}

            <label className="block text-[10px] text-gray-500 mb-1 mt-4 uppercase tracking-wide">
              Save location
            </label>
            <div className="flex gap-2 items-center">
              <div className="flex-1 bg-gray-800 border border-gray-700 rounded px-3 py-2 text-[11px] text-gray-400 truncate min-w-0">
                {selectedDirectoryPath ?? (
                  <span className="text-gray-600 italic">No location chosen</span>
                )}
              </div>
              <button
                onClick={handlePickSavePath}
                disabled={pickingDir}
                className="shrink-0 flex items-center gap-1.5 px-3 py-2 text-[11px] rounded border border-gray-600 hover:border-blue-500 hover:text-white text-gray-400 transition-colors disabled:opacity-40"
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
                onClick={() => setView("recent")}
                className="flex-1 py-2 text-xs rounded border border-gray-700 hover:bg-gray-800 text-gray-400 transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleCreateProject}
                disabled={!chosenPath || !newName.trim()}
                className="flex-1 py-2 text-xs rounded bg-blue-600 hover:bg-blue-500 disabled:opacity-40 text-white font-medium transition-colors"
              >
                Create Project
              </button>
            </div>
          </div>
        )}

        {view === "templates" && (
          <TemplatesGallery
            templates={filteredTemplates}
            providerFilter={providerFilter}
            onChangeFilter={setProviderFilter}
            onPickTemplate={openTemplateModal}
          />
        )}

        {view === "recent" && (
          <div className="flex-1 min-h-0 flex flex-col">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-[11px] font-semibold text-gray-500 uppercase tracking-widest">
                Recent Projects
              </h2>
              {recent.length > 0 && (
                <span className="text-[10px] text-gray-700">
                  {recent.length} project{recent.length !== 1 ? "s" : ""}
                </span>
              )}
            </div>

            {recent.length === 0 && (
              <div className="flex flex-col items-center justify-center flex-1 gap-4 text-gray-700">
                <Icon icon="mdi:folder-outline" className="text-5xl opacity-30" />
                <p className="text-xs">No recent projects</p>
                <button
                  onClick={openNewForm}
                  className="text-xs text-blue-500 hover:text-blue-400 transition-colors"
                >
                  Create your first project →
                </button>
              </div>
            )}

            {recent.length > 0 && (
              <div
                className="grid grid-cols-1 gap-1.5 overflow-y-auto pr-1"
                style={{ gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))" }}
              >
                {recent.map((entry) => (
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

      {selectedTemplate && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/70">
          <div className="w-full max-w-md mx-4 rounded-lg border border-gray-800 bg-gray-900 p-6">
            <div className="flex items-start gap-3 mb-5">
              <Icon
                icon={selectedTemplate.icon ?? providerIcon(selectedTemplate.provider)}
                className={`text-3xl shrink-0 ${providerAccent(selectedTemplate.provider)}`}
              />
              <div className="flex-1 min-w-0">
                <div className="text-sm font-semibold text-white truncate">{selectedTemplate.name}</div>
                <div className="text-[11px] text-gray-500 mt-0.5">{selectedTemplate.description}</div>
              </div>
              <button
                onClick={closeTemplateModal}
                className="text-gray-600 hover:text-gray-300 transition-colors"
              >
                <Icon icon="mdi:close" className="text-base" />
              </button>
            </div>

            <label className="block text-[10px] text-gray-500 mb-1 uppercase tracking-wide">
              Project name
            </label>
            <input
              autoFocus
              type="text"
              value={templateName}
              onChange={(e) => { setTemplateName(e.target.value); setTemplateNameError(""); }}
              onKeyDown={(e) => { if (e.key === "Escape") closeTemplateModal(); }}
              placeholder="My Infrastructure"
              className={`w-full bg-gray-800 border ${
                templateNameError ? "border-red-500" : "border-gray-700"
              } rounded px-3 py-2 text-sm text-white placeholder-gray-600 outline-none focus:border-blue-500 transition-colors mb-1`}
            />
            {templateNameError && <p className="text-[10px] text-red-400 mb-3">{templateNameError}</p>}

            <label className="block text-[10px] text-gray-500 mb-1 mt-4 uppercase tracking-wide">
              Destination
            </label>
            <div className="flex gap-2 items-center">
              <div className="flex-1 bg-gray-800 border border-gray-700 rounded px-3 py-2 text-[11px] text-gray-400 truncate min-w-0">
                {selectedTemplateDirectoryPath ?? (
                  <span className="text-gray-600 italic">No location chosen</span>
                )}
              </div>
              <button
                onClick={handlePickTemplatePath}
                disabled={pickingDir}
                className="shrink-0 flex items-center gap-1.5 px-3 py-2 text-[11px] rounded border border-gray-600 hover:border-blue-500 hover:text-white text-gray-400 transition-colors disabled:opacity-40"
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
                className="flex-1 py-2 text-xs rounded border border-gray-700 hover:bg-gray-800 text-gray-400 transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={() => void handleCreateFromTemplate()}
                disabled={!templatePath || !templateName.trim() || creatingFromTemplate}
                className="flex-1 py-2 text-xs rounded bg-blue-600 hover:bg-blue-500 disabled:opacity-40 text-white font-medium transition-colors flex items-center justify-center gap-1.5"
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
}: {
  icon: string;
  label: string;
  description?: string;
  onClick: () => void;
  active?: boolean;
}) {
  return (
    <button
      onClick={onClick}
      className={`flex items-center gap-3 px-3 py-2.5 rounded-md text-left transition-colors w-full
        ${active
          ? "bg-gray-800 text-white border border-gray-700"
          : "hover:bg-gray-900 text-gray-400 hover:text-gray-200 border border-transparent"
        }`}
    >
      <Icon icon={icon} className={`text-lg shrink-0 ${active ? "text-blue-400" : ""}`} />
      <div>
        <div className="text-xs font-medium">{label}</div>
        {description && (
          <div className="text-[10px] text-gray-600">{description}</div>
        )}
      </div>
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
      className="group w-full text-left flex items-center gap-3 px-4 py-3 rounded-lg bg-gray-900 border border-gray-800 hover:border-blue-600 hover:bg-gray-800 transition-all"
    >
      <Icon icon="mdi:layers-outline" className="text-blue-500 text-xl shrink-0" />
      <div className="flex-1 min-w-0">
        <div className="text-sm text-white font-medium truncate">{entry.name}</div>
        <div className="text-[10px] text-gray-600 truncate mt-0.5">{entry.path}</div>
      </div>
      <div className="flex flex-col items-end gap-1.5 shrink-0">
        <span className="text-[10px] text-gray-600">{formatDate(entry.updatedAt)}</span>
        <button
          type="button"
          onClick={onRemove}
          title="Remove from recent"
          className="opacity-0 group-hover:opacity-100 text-gray-600 hover:text-red-400 transition-all"
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
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-[11px] font-semibold text-gray-500 uppercase tracking-widest">
          Templates
        </h2>
        <span className="text-[10px] text-gray-700">
          {templates.length} template{templates.length !== 1 ? "s" : ""}
        </span>
      </div>

      <div className="flex gap-1.5 mb-5 flex-wrap">
        {PROVIDERS.map((p) => {
          const active = providerFilter === p.id;
          return (
            <button
              key={p.id}
              onClick={() => onChangeFilter(p.id)}
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-md text-[11px] border transition-colors
                ${active
                  ? "bg-blue-600/20 border-blue-600 text-blue-300"
                  : "bg-gray-900 border-gray-800 text-gray-500 hover:text-gray-300 hover:border-gray-700"
                }`}
            >
              <Icon icon={p.icon} className="text-sm" />
              {p.label}
            </button>
          );
        })}
      </div>

      {templates.length === 0 ? (
        <div className="flex flex-col items-center justify-center flex-1 gap-3 text-gray-700">
          <Icon icon="mdi:view-grid-outline" className="text-5xl opacity-30" />
          <p className="text-xs">No hay templates para este filtro</p>
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
  const icon = template.icon ?? providerIcon(template.provider);
  return (
    <button
      onClick={onClick}
      className="text-left flex flex-col gap-2 p-4 rounded-lg bg-gray-900 border border-gray-800 hover:border-blue-600 hover:bg-gray-800 transition-all"
    >
      <div className="flex items-center gap-2.5">
        <Icon icon={icon} className={`text-2xl shrink-0 ${providerAccent(template.provider)}`} />
        <div className="flex-1 min-w-0">
          <div className="text-sm text-white font-medium truncate">{template.name}</div>
          <div className="text-[10px] text-gray-600 uppercase tracking-wider">
            {providerLabel(template.provider)}
          </div>
        </div>
      </div>
      <p className="text-[11px] text-gray-500 leading-relaxed line-clamp-3">
        {template.description}
      </p>
      <div className="flex items-center gap-2 mt-1 flex-wrap">
        <span className="text-[10px] px-1.5 py-0.5 rounded bg-gray-800 text-gray-400 border border-gray-700">
          {template.resourceCount} recursos
        </span>
        {template.tags.slice(0, 2).map((tag) => (
          <span
            key={tag}
            className="text-[10px] px-1.5 py-0.5 rounded bg-gray-800 text-gray-500 border border-gray-800"
          >
            {tag}
          </span>
        ))}
      </div>
    </button>
  );
}
