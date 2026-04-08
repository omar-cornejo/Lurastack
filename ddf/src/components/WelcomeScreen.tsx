import { useEffect, useState } from "react";
import { Icon } from "@iconify/react";
import {
  getRecentProjects,
  removeFromRecent,
  pickOpenPath,
  loadProjectFromPath,
  pickSavePath,
} from "../commands/projectManager";
import type { RecentProject } from "../types/project";

type WelcomeScreenProps = {
  onProjectReady: (project: {
    name: string;
    filePath: string;
    isNew: boolean;
  }) => void;
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

export default function WelcomeScreen({ onProjectReady }: WelcomeScreenProps) {
  const [recent, setRecent] = useState<RecentProject[]>([]);
  const [error, setError] = useState("");

  // New project form
  const [showNewForm, setShowNewForm] = useState(false);
  const [newName, setNewName] = useState("");
  const [nameError, setNameError] = useState("");
  const [pickingDir, setPickingDir] = useState(false);
  const [chosenPath, setChosenPath] = useState<string | null>(null);

  useEffect(() => {
    setRecent(getRecentProjects());
  }, []);

  // ── New project ──────────────────────────────────────────────────────────

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
    setShowNewForm(true);
    setNewName("");
    setNameError("");
    setChosenPath(null);
    setError("");
  };

  // ── Import ───────────────────────────────────────────────────────────────

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

  // ── Render ───────────────────────────────────────────────────────────────

  return (
    <div className="flex w-full h-full bg-gray-950 overflow-hidden">

      {/* ── Left sidebar ── */}
      <div className="flex flex-col w-64 shrink-0 border-r border-gray-800 bg-gray-950 p-6">
        {/* Brand */}
        <div className="mb-8">
          <div className="text-4xl font-bold tracking-[0.3em] text-white">ddf</div>
          <div className="text-[10px] text-gray-600 tracking-widest uppercase mt-1">
            Declarative Design Framework
          </div>
        </div>

        {/* Actions */}
        <div className="flex flex-col gap-2">
          <SideAction
            icon="mdi:folder-plus-outline"
            label="New Project"
            onClick={openNewForm}
            active={showNewForm}
          />
          <SideAction
            icon="mdi:folder-open-outline"
            label="Import Project"
            description=".ddf file"
            onClick={handleImport}
          />
        </div>

        <div className="flex-1" />

        {/* Error */}
        {error && (
          <div className="mt-4 p-2.5 rounded bg-red-950 border border-red-800 text-[10px] text-red-400 leading-relaxed">
            {error}
          </div>
        )}

        <div className="mt-4 text-[9px] text-gray-700 leading-relaxed">
          Projects saved in chosen location.
          <br />Recent list stored locally.
        </div>
      </div>

      {/* ── Main area ── */}
      <div className="flex flex-col flex-1 min-w-0 p-8">

        {/* New project form */}
        {showNewForm && (
          <div className="mb-8 p-6 rounded-lg border border-gray-800 bg-gray-900 max-w-xl">
            <div className="flex items-center justify-between mb-5">
              <h2 className="text-sm font-semibold text-white">New Project</h2>
              <button
                onClick={() => setShowNewForm(false)}
                className="text-gray-600 hover:text-gray-300 transition-colors"
              >
                <Icon icon="mdi:close" className="text-base" />
              </button>
            </div>

            {/* Name */}
            <label className="block text-[10px] text-gray-500 mb-1 uppercase tracking-wide">
              Project name
            </label>
            <input
              autoFocus
              type="text"
              value={newName}
              onChange={(e) => { setNewName(e.target.value); setNameError(""); }}
              onKeyDown={(e) => { if (e.key === "Escape") setShowNewForm(false); }}
              placeholder="My Infrastructure"
              className={`w-full bg-gray-800 border ${
                nameError ? "border-red-500" : "border-gray-700"
              } rounded px-3 py-2 text-sm text-white placeholder-gray-600 outline-none focus:border-blue-500 transition-colors mb-1`}
            />
            {nameError && <p className="text-[10px] text-red-400 mb-3">{nameError}</p>}

            {/* Save location */}
            <label className="block text-[10px] text-gray-500 mb-1 mt-4 uppercase tracking-wide">
              Save location
            </label>
            <div className="flex gap-2 items-center">
              <div className="flex-1 bg-gray-800 border border-gray-700 rounded px-3 py-2 text-[11px] text-gray-400 truncate min-w-0">
                {chosenPath ?? (
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

            {/* Actions */}
            <div className="flex gap-3 mt-5">
              <button
                onClick={() => setShowNewForm(false)}
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

        {/* Recent projects section */}
        <div className="flex-1 min-h-0 flex flex-col">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-[11px] font-semibold text-gray-500 uppercase tracking-widest">
              Recent Projects
            </h2>
            {recent.length > 0 && (
              <span className="text-[10px] text-gray-700">{recent.length} project{recent.length !== 1 ? "s" : ""}</span>
            )}
          </div>

          {recent.length === 0 && !showNewForm && (
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
            <div className="grid grid-cols-1 gap-1.5 overflow-y-auto pr-1" style={{ gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))" }}>
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
      </div>
    </div>
  );
}

// ── Sub-components ────────────────────────────────────────────────────────────

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
