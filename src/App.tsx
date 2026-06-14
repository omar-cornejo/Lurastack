import "./App.css";
import { useCallback, useEffect, useRef, useState } from "react";
import GlobalBar from "./components/GlobalBar";
import WorkspaceView from "./components/WorkspaceView";
import WelcomeScreen from "./components/WelcomeScreen";
import DetachedTerminalWindow from "./components/DetachedTerminalWindow";
import { ViewInfo } from "./types/views";
import type { LuraProject, ViewSnapshot } from "./types/project";
import {
  saveProjectToPath,
  syncAuxiliaryTfFiles,
  loadProjectFromPath,
  buildProjectSnapshot,
  createEmptyProject,
  getProjectDir,
  writeMainTf,
  getViewDir,
  ensureProjectLayout,
  renameViewDir,
  removeViewDir,
  pickSavePath,
  pickOpenPath,
} from "./commands/projectManager";
import { Toaster, sileo } from "sileo";
import { useTranslation, Trans } from "react-i18next";
import { useRootFontScale } from "./hooks/useRootFontScale";

let viewCounter = 1;

function makeViewInfo(id?: string, name?: string): ViewInfo {
  return {
    id: id ?? crypto.randomUUID(),
    name: name ?? `View ${viewCounter++}`,
  };
}

export default function App() {
  const isDetachedTerminalWindow =
    typeof window !== "undefined" &&
    new URLSearchParams(window.location.search).get("detachedTerminal") === "1";

  if (isDetachedTerminalWindow) {
    return <DetachedTerminalWindow />;
  }

  const { t } = useTranslation();
  useRootFontScale();
  const [project, setProject] = useState<LuraProject | null>(null);
  const [projectFilePath, setProjectFilePath] = useState<string | null>(null);
  const [autosave, setAutosave] = useState(false);

  const [views, setViews] = useState<ViewInfo[]>([]);
  const [activeViewId, setActiveViewId] = useState<string>("");
  const [pendingCloseViewId, setPendingCloseViewId] = useState<string | null>(null);
  const [isClosingView, setIsClosingView] = useState(false);

  // Per-view snapshot cache (used for save)
  const viewSnapshotsRef = useRef<Map<string, ViewSnapshot>>(new Map());

  useEffect(() => {
    const onMigrated = () => {
      sileo.success({ title: t("toast.secretsMigrated") });
    };
    window.addEventListener("lurastack:secrets-migrated", onMigrated as EventListener);
    return () => {
      window.removeEventListener("lurastack:secrets-migrated", onMigrated as EventListener);
    };
  }, [t]);

  const applyLoadedProject = useCallback(
    (loaded: LuraProject, filePath: string) => {
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
    (overrideName?: string): LuraProject => {
      if (!project) throw new Error("No project");
      const base = overrideName
        ? { ...project, meta: { ...project.meta, name: overrideName } }
        : project;
      return buildProjectSnapshot({ ...base, activeViewId }, viewSnapshotsRef.current);
    },
    [project, activeViewId],
  );

  const persistProjectBundle = useCallback(
    async (snapshot: LuraProject, filePath: string) => {
      await saveProjectToPath(snapshot, filePath);
      const projectDir = getProjectDir(filePath);
      await ensureProjectLayout(projectDir, snapshot.views.map((view) => view.name));

      await Promise.all(
        snapshot.views.map(async (view) => {
          const viewDir = getViewDir(projectDir, view.name);
          await syncAuxiliaryTfFiles(viewDir, view.codeFiles ?? []);
        }),
      );
    },
    [],
  );

  const persistIfAutosave = useCallback(
    (nextProject: LuraProject, nextActiveViewId: string) => {
      if (!autosave || !projectFilePath) return;
      const snapshot = buildProjectSnapshot(
        { ...nextProject, activeViewId: nextActiveViewId },
        viewSnapshotsRef.current,
      );
      void persistProjectBundle(snapshot, projectFilePath)
        .then(() => setProject(snapshot))
        .catch(() => {
          sileo.error({ title: t("toast.autosaveFailed") });
        });
    },
    [autosave, projectFilePath, persistProjectBundle],
  );

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
          const projectDir = getProjectDir(filePath);
          await ensureProjectLayout(projectDir, newProject.views.map((view) => view.name));
          const firstView = newProject.views[0];
          if (firstView) {
            await writeMainTf(getViewDir(projectDir, firstView.name), "");
          }
        } catch {
          sileo.error({ title: t("toast.saveFailed") });
          return;
        }
        applyLoadedProject(newProject, filePath);
      } else {
        // isNew=false means the project was already loaded by WelcomeScreen
        try {
          const loaded = await loadProjectFromPath(filePath);
          await ensureProjectLayout(getProjectDir(filePath), loaded.views.map((view) => view.name));
          applyLoadedProject(loaded, filePath);
        } catch {
          sileo.error({ title: t("toast.loadFailed") });
        }
      }
    },
    [applyLoadedProject, t],
  );

  const handleSaveProject = useCallback(async () => {
    if (!project || !projectFilePath) return;
    try {
      const snap = assembleSave();
      await persistProjectBundle(snap, projectFilePath);
      setProject(snap);
      sileo.success({ title: t("toast.projectSaved") });
    } catch {
      sileo.error({ title: t("toast.saveProjectFailed") });
    }
  }, [project, projectFilePath, assembleSave, persistProjectBundle, t]);

  const handleSaveProjectAs = useCallback(async () => {
    if (!project) return;
    const newPath = await pickSavePath(project.meta.name);
    if (!newPath) return;
    // Derive name from filename
    const newName = newPath
      .split(/[\\/]/)
      .pop()
      ?.replace(/\.lura$/i, "")
      .replace(/[-_]+/g, " ")
      ?? project.meta.name;
    try {
      const snap = assembleSave(newName);
      await persistProjectBundle(snap, newPath);
      setProject(snap);
      setProjectFilePath(newPath);
      sileo.success({ title: t("toast.savedAs", { name: newName }) });
    } catch {
      sileo.error({ title: t("toast.saveProjectFailed") });
    }
  }, [project, assembleSave, persistProjectBundle, t]);

  const handleOpenProject = useCallback(async () => {
    const path = await pickOpenPath();
    if (!path) return;
    try {
      const loaded = await loadProjectFromPath(path);
      await ensureProjectLayout(getProjectDir(path), loaded.views.map((view) => view.name));
      applyLoadedProject(loaded, path);
    } catch {
      sileo.error({ title: t("toast.loadFailed") });
    }
  }, [applyLoadedProject, t]);

  const handleExportHcl = useCallback(() => {
    sileo.info({ title: t("toast.exportHclHint") });
  }, [t]);

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
            sileo.error({ title: t("toast.autosaveSettingFailed") });
          });

          if (next) {
            window.setTimeout(() => {
              const refreshed = buildProjectSnapshot(
                { ...updated, activeViewId },
                viewSnapshotsRef.current,
              );
              void persistProjectBundle(refreshed, projectFilePath).catch(() => {
                sileo.error({ title: t("toast.autosaveSnapshotFailed") });
              });
            }, 900);
          }
        }

        return updated;
      });
      return next;
    });
  }, [activeViewId, projectFilePath, persistProjectBundle, t]);

  // Called (debounced) by each WorkspaceView when its state changes
  const handleViewStateChange = useCallback(
    (viewId: string, snapshot: ViewSnapshot) => {
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

  const handleCreateView = useCallback(() => {
    const v = makeViewInfo();
    const snap: ViewSnapshot = {
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
    setProject((p) => {
      if (!p) return p;
      const updatedProject = { ...p, views: [...p.views, snap] };

      if (projectFilePath) {
        const baseDir = getProjectDir(projectFilePath);
        void ensureProjectLayout(baseDir, updatedProject.views.map((view) => view.name));
      }

      persistIfAutosave(updatedProject, v.id);

      return updatedProject;
    });
  }, [persistIfAutosave, projectFilePath]);

  const handleCloseView = useCallback(
    (id: string) => {
      if (views.length <= 1) return;
      setPendingCloseViewId(id);
    },
    [views.length],
  );

  const confirmCloseView = useCallback(async () => {
    if (!pendingCloseViewId) return;

    const id = pendingCloseViewId;
    const viewToClose = views.find((view) => view.id === id);
    if (!viewToClose) {
      setPendingCloseViewId(null);
      return;
    }

    setIsClosingView(true);
    try {
      if (projectFilePath) {
        await removeViewDir(getProjectDir(projectFilePath), viewToClose.name);
      }

      const idx = views.findIndex((view) => view.id === id);
      const updatedViews = views.filter((view) => view.id !== id);
      viewCounter = updatedViews.length + 1;

      const nextActiveViewId =
        activeViewId === id && updatedViews.length > 0
          ? updatedViews[Math.min(idx, updatedViews.length - 1)].id
          : activeViewId;

      if (nextActiveViewId !== activeViewId) {
        setActiveViewId(nextActiveViewId);
      }

      viewSnapshotsRef.current.delete(id);
      setViews(updatedViews);
      setProject((current) => {
        if (!current) return current;
        const updatedProject = {
          ...current,
          views: current.views.filter((view) => view.id !== id),
        };
        persistIfAutosave(updatedProject, nextActiveViewId);
        return updatedProject;
      });
      setPendingCloseViewId(null);
    } catch {
      sileo.error({ title: t("toast.removeViewFailed") });
    } finally {
      setIsClosingView(false);
    }
  }, [activeViewId, pendingCloseViewId, persistIfAutosave, projectFilePath, views, t]);

  const handleRenameView = useCallback(
    async (id: string, nextName: string) => {
      const trimmed = nextName.trim();
      if (!trimmed) return;

      const currentView = views.find((view) => view.id === id);
      if (!currentView) return;

      if (
        views.some(
          (view) => view.id !== id && view.name.toLowerCase() === trimmed.toLowerCase(),
        )
      ) {
        sileo.error({ title: t("toast.viewNameExists") });
        return;
      }

      if (projectFilePath) {
        try {
          await renameViewDir(getProjectDir(projectFilePath), currentView.name, trimmed);
        } catch {
          sileo.error({ title: t("toast.renameViewFailed") });
          return;
        }
      }

      setViews((current) =>
        current.map((view) => (view.id === id ? { ...view, name: trimmed } : view)),
      );

      const snapshot = viewSnapshotsRef.current.get(id);
      if (snapshot) {
        viewSnapshotsRef.current.set(id, { ...snapshot, name: trimmed });
      }

      setProject((current) =>
        {
          if (!current) return current;
          const updatedProject = {
            ...current,
            views: current.views.map((view) =>
              view.id === id ? { ...view, name: trimmed } : view,
            ),
          };
          persistIfAutosave(updatedProject, activeViewId);
          return updatedProject;
        },
      );
    },
    [activeViewId, persistIfAutosave, projectFilePath, views, t],
  );

  const hasProject = project !== null;
  const projectDir = projectFilePath ? getProjectDir(projectFilePath) : undefined;
  const pendingCloseView = pendingCloseViewId
    ? views.find((view) => view.id === pendingCloseViewId)
    : undefined;

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      <Toaster position="top-center" offset={{ top: 56 }} />

      {hasProject && (
        <GlobalBar
          views={views}
          activeViewId={activeViewId}
          hasProject={hasProject}
          projectName={project?.meta.name ?? null}
          autosave={autosave}
          onSwitchView={setActiveViewId}
          onCreateView={handleCreateView}
          onCloseView={handleCloseView}
          onRenameView={handleRenameView}
          onNewProject={() => { setProject(null); setProjectFilePath(null); setViews([]); }}
          onOpenProject={handleOpenProject}
          onSaveProject={handleSaveProject}
          onSaveProjectAs={handleSaveProjectAs}
          onExportHcl={handleExportHcl}
          onToggleAutosave={handleToggleAutosave}
        />
      )}

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
                projectDir={projectDir ? getViewDir(projectDir, view.name) : undefined}
                isVisible={view.id === activeViewId}
                initialState={viewSnapshotsRef.current.get(view.id)}
                onStateChange={handleViewStateChange}
              />
            </div>
          ))
        )}
      </div>

      {pendingCloseView ? (
        <div className="absolute inset-0 z-[120] flex items-center justify-center bg-black/45">
          <div className="w-[26.25rem] max-w-[92vw] rounded-lg border border-gray-700 bg-gray-900 p-4 text-sm text-gray-200 shadow-2xl">
            <h3 className="text-base font-semibold text-white">{t("closeView.title")}</h3>
            <p className="mt-2 text-xs text-gray-300">
              <Trans
                i18nKey="closeView.message"
                values={{ name: pendingCloseView.name }}
                components={{ b: <span className="font-semibold text-white" /> }}
              />
            </p>

            <div className="mt-4 flex justify-end gap-2">
              <button
                type="button"
                onClick={() => setPendingCloseViewId(null)}
                disabled={isClosingView}
                className="rounded border border-gray-600 px-3 py-1.5 text-xs text-gray-300 hover:bg-gray-800 disabled:opacity-60"
              >
                {t("common.cancel")}
              </button>
              <button
                type="button"
                onClick={() => void confirmCloseView()}
                disabled={isClosingView}
                className="rounded border border-red-500/70 bg-red-600/20 px-3 py-1.5 text-xs text-red-200 hover:bg-red-600/35 disabled:opacity-60"
              >
                {isClosingView ? t("closeView.closing") : t("closeView.confirm")}
              </button>
            </div>
          </div>
        </div>
      ) : null}
    </div>
  );
}
