import "./App.css";
import { useCallback, useRef, useState } from "react";
import GlobalBar from "./components/GlobalBar";
import WorkspaceView from "./components/WorkspaceView";
import WelcomeScreen from "./components/WelcomeScreen";
import { ViewInfo } from "./types/views";
import type { DdfProject, DdfViewSnapshot } from "./types/project";
import {
  saveProjectToPath,
  syncAuxiliaryTfFiles,
  loadProjectFromPath,
  buildProjectSnapshot,
  createEmptyProject,
  getProjectDir,
  writeMainTf,
  pickSavePath,
  pickOpenPath,
} from "./commands/projectManager";
import { Toaster, sileo } from "sileo";

let viewCounter = 1;

function makeViewInfo(id?: string, name?: string): ViewInfo {
  return {
    id: id ?? crypto.randomUUID(),
    name: name ?? `View ${viewCounter++}`,
  };
}

export default function App() {
  // ── Project state ─────────────────────────────────────────────────────────
  const [project, setProject] = useState<DdfProject | null>(null);
  const [projectFilePath, setProjectFilePath] = useState<string | null>(null);
  const [autosave, setAutosave] = useState(false);

  // ── View state ────────────────────────────────────────────────────────────
  const [views, setViews] = useState<ViewInfo[]>([]);
  const [activeViewId, setActiveViewId] = useState<string>("");

  // Per-view snapshot cache (used for save)
  const viewSnapshotsRef = useRef<Map<string, DdfViewSnapshot>>(new Map());

  // ── Internal helpers ──────────────────────────────────────────────────────

  const applyLoadedProject = useCallback(
    (loaded: DdfProject, filePath: string) => {
      viewCounter = loaded.views.length + 1;
      const viewInfos = loaded.views.map((v) => makeViewInfo(v.id, v.name));
      viewSnapshotsRef.current = new Map(loaded.views.map((v) => [v.id, v]));
      setProject(loaded);
      setProjectFilePath(filePath);
      setViews(viewInfos);
      setActiveViewId(loaded.activeViewId);
      setAutosave(loaded.settings.autosave);
    },
    [],
  );

  const assembleSave = useCallback(
    (overrideName?: string): DdfProject => {
      if (!project) throw new Error("No project");
      const base = overrideName
        ? { ...project, meta: { ...project.meta, name: overrideName } }
        : project;
      return buildProjectSnapshot({ ...base, activeViewId }, viewSnapshotsRef.current);
    },
    [project, activeViewId],
  );

  const persistProjectBundle = useCallback(
    async (snapshot: DdfProject, filePath: string) => {
      await saveProjectToPath(snapshot, filePath);
      const projectDir = getProjectDir(filePath);
      const activeView = snapshot.views.find((view) => view.id === snapshot.activeViewId);
      await syncAuxiliaryTfFiles(projectDir, activeView?.codeFiles ?? []);
    },
    [],
  );

  // ── Project actions ───────────────────────────────────────────────────────

  /** Called by WelcomeScreen after the user fills the new-project form */
  const handleProjectReady = useCallback(
    async ({
      name,
      filePath,
      isNew,
    }: {
      name: string;
      filePath: string;
      isNew: boolean;
    }) => {
      if (isNew) {
        const newProject = createEmptyProject(name);
        try {
          await saveProjectToPath(newProject, filePath);
          await writeMainTf(getProjectDir(filePath), "");
        } catch {
          sileo.error({ title: "Could not save project." });
          return;
        }
        applyLoadedProject(newProject, filePath);
      } else {
        // isNew=false means the project was already loaded by WelcomeScreen
        try {
          const loaded = await loadProjectFromPath(filePath);
          applyLoadedProject(loaded, filePath);
        } catch {
          sileo.error({ title: "Failed to load project." });
        }
      }
    },
    [applyLoadedProject],
  );

  const handleSaveProject = useCallback(async () => {
    if (!project || !projectFilePath) return;
    try {
      const snap = assembleSave();
      await persistProjectBundle(snap, projectFilePath);
      setProject(snap);
      sileo.success({ title: "Project saved." });
    } catch {
      sileo.error({ title: "Failed to save project." });
    }
  }, [project, projectFilePath, assembleSave, persistProjectBundle]);

  const handleSaveProjectAs = useCallback(async () => {
    if (!project) return;
    const newPath = await pickSavePath(project.meta.name);
    if (!newPath) return;
    // Derive name from filename
    const newName = newPath
      .split(/[\\/]/)
      .pop()
      ?.replace(/\.ddf$/i, "")
      .replace(/[-_]+/g, " ")
      ?? project.meta.name;
    try {
      const snap = assembleSave(newName);
      await persistProjectBundle(snap, newPath);
      setProject(snap);
      setProjectFilePath(newPath);
      sileo.success({ title: `Saved as "${newName}".` });
    } catch {
      sileo.error({ title: "Failed to save project." });
    }
  }, [project, assembleSave, persistProjectBundle]);

  const handleOpenProject = useCallback(async () => {
    const path = await pickOpenPath();
    if (!path) return;
    try {
      const loaded = await loadProjectFromPath(path);
      applyLoadedProject(loaded, path);
    } catch {
      sileo.error({ title: "Failed to load project." });
    }
  }, [applyLoadedProject]);

  const handleExportHcl = useCallback(() => {
    sileo.info({ title: "Switch to Code view to copy or export HCL." });
  }, []);

  const handleToggleAutosave = useCallback(() => {
    setAutosave((prev) => {
      const next = !prev;
      setProject((p) => {
        if (!p) return p;
        const updated = buildProjectSnapshot(
          {
            ...p,
            activeViewId,
            settings: { ...p.settings, autosave: next },
          },
          viewSnapshotsRef.current,
        );

        if (projectFilePath) {
          void persistProjectBundle(updated, projectFilePath).catch(() => {
            sileo.error({ title: "Failed to save autosave setting." });
          });

          if (next) {
            window.setTimeout(() => {
              const refreshed = buildProjectSnapshot(
                { ...updated, activeViewId },
                viewSnapshotsRef.current,
              );
              void persistProjectBundle(refreshed, projectFilePath).catch(() => {
                sileo.error({ title: "Failed to capture autosave snapshot." });
              });
            }, 900);
          }
        }

        return updated;
      });
      return next;
    });
  }, [activeViewId, projectFilePath, persistProjectBundle]);

  // Called (debounced) by each WorkspaceView when its state changes
  const handleViewStateChange = useCallback(
    (viewId: string, snapshot: DdfViewSnapshot) => {
      viewSnapshotsRef.current.set(viewId, snapshot);
      if (!autosave || !projectFilePath || !project) return;
      const snap = buildProjectSnapshot(
        { ...project, activeViewId },
        viewSnapshotsRef.current,
      );
      void persistProjectBundle(snap, projectFilePath).then(() => setProject(snap));
    },
    [autosave, projectFilePath, project, activeViewId, persistProjectBundle],
  );

  // ── View actions ──────────────────────────────────────────────────────────

  const handleCreateView = useCallback(() => {
    const v = makeViewInfo();
    const snap: DdfViewSnapshot = {
      id: v.id,
      name: v.name,
      resources: [],
      nodes: [],
      edges: [],
      codeFiles: [],
    };
    viewSnapshotsRef.current.set(v.id, snap);
    setViews((prev) => [...prev, v]);
    setActiveViewId(v.id);
    setProject((p) => (p ? { ...p, views: [...p.views, snap] } : p));
  }, []);

  const handleCloseView = useCallback(
    (id: string) => {
      setViews((prev) => {
        const idx = prev.findIndex((v) => v.id === id);
        const updated = prev.filter((v) => v.id !== id);
        const reindexed = updated.map((v, i) => ({ ...v, name: `View ${i + 1}` }));
        viewCounter = reindexed.length + 1;

        if (activeViewId === id && reindexed.length > 0) {
          setActiveViewId(reindexed[Math.min(idx, reindexed.length - 1)].id);
        }

        viewSnapshotsRef.current.delete(id);
        setProject((p) =>
          p ? { ...p, views: p.views.filter((v) => v.id !== id) } : p,
        );

        return reindexed;
      });
    },
    [activeViewId],
  );

  // ── Render ────────────────────────────────────────────────────────────────

  const hasProject = project !== null;
  const projectDir = projectFilePath ? getProjectDir(projectFilePath) : undefined;

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      <Toaster position="top-center" offset={{ top: 56 }} />

      <GlobalBar
        views={views}
        activeViewId={activeViewId}
        hasProject={hasProject}
        projectName={project?.meta.name ?? null}
        autosave={autosave}
        onSwitchView={setActiveViewId}
        onCreateView={handleCreateView}
        onCloseView={handleCloseView}
        onNewProject={() => { setProject(null); setProjectFilePath(null); setViews([]); }}
        onOpenProject={handleOpenProject}
        onSaveProject={handleSaveProject}
        onSaveProjectAs={handleSaveProjectAs}
        onExportHcl={handleExportHcl}
        onToggleAutosave={handleToggleAutosave}
      />

      <div className="flex flex-1 overflow-hidden relative">
        {!hasProject ? (
          <WelcomeScreen onProjectReady={handleProjectReady} />
        ) : (
          views.map((view) => (
            <div
              key={view.id}
              className="absolute inset-0 flex flex-col"
              style={{
                visibility: view.id === activeViewId ? "visible" : "hidden",
                pointerEvents: view.id === activeViewId ? "auto" : "none",
                zIndex: view.id === activeViewId ? 1 : 0,
              }}
            >
              <WorkspaceView
                viewId={view.id}
                viewName={view.name}
                projectDir={projectDir}
                initialState={viewSnapshotsRef.current.get(view.id)}
                onStateChange={handleViewStateChange}
              />
            </div>
          ))
        )}
      </div>
    </div>
  );
}
