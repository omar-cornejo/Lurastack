import { useEffect, useMemo, useState } from "react";
import { Icon } from "@iconify/react";
import { useTranslation } from "react-i18next";
import LanguageSwitcher from "./LanguageSwitcher";
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
  const { t } = useTranslation();
  // Template name/description come from index.json (manifest), but each template
  // also has localized `template.<id>.{name,description}` keys. Prefer the
  // translation, falling back to the manifest value when a key is missing.
  const localizedTemplateName = (tpl: TemplateManifest) =>
    t(`template.${tpl.id}.name`, { defaultValue: tpl.name });
  const localizedTemplateDescription = (tpl: TemplateManifest) =>
    t(`template.${tpl.id}.description`, { defaultValue: tpl.description });
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
    if (!trimmed) { setNameError(t("welcome.error.nameRequired")); return; }
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
    if (!trimmed) { setNameError(t("welcome.error.nameRequired")); return; }
    if (!chosenPath) { setNameError(t("welcome.error.chooseLocation")); return; }
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
      setError(t("welcome.error.openFailed", { error: String(e) }));
    }
  };

  const handleOpenRecent = async (entry: RecentProject) => {
    setError("");
    try {
      const project = await loadProjectFromPath(entry.path);
      onProjectReady({ name: project.meta.name, filePath: entry.path, isNew: false });
    } catch (e) {
      setError(t("welcome.error.loadFailed", { name: entry.name, error: String(e) }));
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
    if (!trimmed) { setTemplateNameError(t("welcome.error.nameRequired")); return; }
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
    if (!trimmed) { setTemplateNameError(t("welcome.error.nameRequired")); return; }
    if (!templatePath) { setTemplateNameError(t("welcome.error.chooseDestination")); return; }

    setCreatingFromTemplate(true);
    try {
      await createProjectFromTemplate(selectedTemplate.id, trimmed, templatePath);
      onProjectReady({ name: trimmed, filePath: templatePath, isNew: false });
    } catch (e) {
      setError(t("welcome.error.templateFailed", { error: String(e) }));
    } finally {
      setCreatingFromTemplate(false);
    }
  };

  const selectedDirectoryPath = toDirectoryPath(chosenPath);
  const selectedTemplateDirectoryPath = toDirectoryPath(templatePath);

  return (
    <div className="flex w-full h-full bg-slate-100 overflow-hidden">

      {/* Left sidebar */}
      <div className="flex flex-col w-[280px] shrink-0 border-r border-slate-200 bg-white p-7">
        <div className="mb-9">
          <div className="text-[26px] font-bold tracking-[0.12em] text-slate-900 leading-tight">LuraStack</div>
          <div className="text-[11px] font-semibold uppercase tracking-widest text-slate-400 mt-1">
            {t("welcome.tagline")}
          </div>
        </div>

        <div className="text-[11px] font-semibold uppercase tracking-widest text-slate-400 mb-2.5">{t("welcome.sidebar.start")}</div>

        <div className="flex flex-col gap-1.5">
          <SideAction
            icon="mdi:folder-plus-outline"
            label={t("welcome.sidebar.newProject")}
            shortcut="N"
            onClick={openNewForm}
            active={view === "new"}
            testId="welcome-new-project"
          />
          <SideAction
            icon="mdi:view-grid-outline"
            label={t("welcome.sidebar.templates")}
            shortcut="T"
            description={t("welcome.sidebar.templatesDesc")}
            onClick={() => { setView("templates"); setError(""); }}
            active={view === "templates"}
          />
          <SideAction
            icon="mdi:folder-open-outline"
            label={t("welcome.sidebar.openProject")}
            shortcut="O"
            description={t("welcome.sidebar.openProjectDesc")}
            onClick={handleImport}
          />
          <SideAction
            icon="mdi:history"
            label={t("welcome.sidebar.recent")}
            onClick={() => { setView("recent"); setError(""); }}
            active={view === "recent"}
          />
        </div>

        <div className="flex-1" />

        {error && (
          <div className="mb-3 p-3 rounded-lg bg-red-50 border border-red-200 text-[11px] text-red-600 leading-relaxed">
            {error}
          </div>
        )}

        <div className="mb-4">
          <LanguageSwitcher variant="light" />
        </div>

        <div className="pt-4 border-t border-slate-100">
          <div className="flex items-center gap-2">
            <Icon icon="mdi:layers-outline" className="text-slate-400 text-[15px] shrink-0" />
            <span className="text-[11px] text-slate-400 font-medium">LuraStack</span>
            <span className="ml-auto text-[11px] text-slate-300 tabular-nums">v0.1</span>
          </div>
        </div>
      </div>

      {/* Main content */}
      <div className="flex flex-col flex-1 min-w-0 p-11 overflow-y-auto">

        {/* New project form — full-width, two-column layout */}
        {view === "new" && (
          <div className="flex-1 min-h-0 flex flex-col">
            <div className="rounded-xl border border-slate-200 bg-white shadow-sm overflow-hidden">
              <div className="grid grid-cols-1 lg:grid-cols-[1.4fr_1fr]">
                {/* Form column */}
                <div className="p-9">
                  <label className="block text-[11px] font-semibold uppercase tracking-widest text-slate-400 mb-2">
                    {t("welcome.form.projectName")}
                  </label>
                  <input
                    data-testid="new-project-name"
                    autoFocus
                    type="text"
                    value={newName}
                    onChange={(e) => { setNewName(e.target.value); setNameError(""); }}
                    onKeyDown={(e) => {
                      if (e.key === "Escape") setView("recent");
                      if (e.key === "Enter" && chosenPath && newName.trim()) handleCreateProject();
                    }}
                    placeholder={t("welcome.form.namePlaceholder")}
                    className={`w-full rounded-lg border ${
                      nameError ? "border-red-300" : "border-slate-200"
                    } bg-white px-3.5 py-3 text-[15px] text-slate-800 placeholder-slate-400 outline-none focus:border-slate-300 transition-colors`}
                  />
                  {nameError && <p className="text-[11px] text-red-500 mt-1.5">{nameError}</p>}

                  <label className="block text-[11px] font-semibold uppercase tracking-widest text-slate-400 mb-2 mt-7">
                    {t("welcome.form.saveLocation")}
                  </label>
                  <div className="flex gap-2.5 items-center">
                    <div className="flex-1 bg-slate-50 border border-slate-200 rounded-lg px-3.5 py-3 text-[13px] text-slate-600 truncate min-w-0">
                      {selectedDirectoryPath ?? (
                        <span className="text-slate-400 italic">{t("welcome.form.noLocation")}</span>
                      )}
                    </div>
                    <button
                      data-testid="new-project-browse"
                      onClick={handlePickSavePath}
                      disabled={pickingDir}
                      className="shrink-0 flex items-center gap-2 px-4 py-3 text-[13px] rounded-lg border border-slate-200 hover:border-indigo-300 hover:bg-indigo-50 hover:text-indigo-600 text-slate-500 transition-colors disabled:opacity-40"
                    >
                      {pickingDir ? (
                        <Icon icon="mdi:loading" className="animate-spin text-base" />
                      ) : (
                        <Icon icon="mdi:folder-search-outline" className="text-base" />
                      )}
                      {t("welcome.form.browse")}
                    </button>
                  </div>

                  <div className="flex gap-3 mt-10">
                    <button
                      onClick={() => setView("recent")}
                      className="px-6 py-3 text-sm rounded-lg border border-slate-200 hover:bg-slate-50 text-slate-600 transition-colors"
                    >
                      {t("common.cancel")}
                    </button>
                    <button
                      data-testid="new-project-create"
                      onClick={handleCreateProject}
                      disabled={!chosenPath || !newName.trim()}
                      className="flex-1 py-3 text-sm rounded-lg bg-blue-600 hover:bg-blue-500 disabled:opacity-40 text-white font-medium transition-colors"
                    >
                      {t("welcome.form.create")}
                    </button>
                  </div>
                </div>

                {/* Decorative / info column */}
                <div className="hidden lg:flex flex-col justify-center gap-5 border-l border-slate-100 bg-slate-50/60 p-9">
                  <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-indigo-50 ring-1 ring-indigo-100">
                    <Icon icon="mdi:folder-plus-outline" className="text-indigo-600 text-3xl" />
                  </div>
                  <div>
                    <h3 className="text-base font-semibold text-slate-900">{t("welcome.form.scratchTitle")}</h3>
                    <p className="text-[13px] text-slate-500 leading-relaxed mt-1.5">
                      {t("welcome.form.scratchBody")}
                    </p>
                  </div>
                  <div className="flex flex-col gap-2.5 mt-1">
                    {[
                      { icon: "mdi:vector-square", text: t("welcome.form.feature.canvas") },
                      { icon: "mdi:code-braces", text: t("welcome.form.feature.hcl") },
                      { icon: "mdi:cloud-outline", text: "AWS · GCP · Azure" },
                    ].map((f) => (
                      <div key={f.text} className="flex items-center gap-2.5 text-[13px] text-slate-500">
                        <Icon icon={f.icon} className="text-slate-400 text-base shrink-0" />
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
            <div className="flex items-center gap-4 mb-6">
              <h2 className="text-xs font-semibold text-slate-400 uppercase tracking-widest shrink-0">
                {t("welcome.recent.title")}
              </h2>
              <div className="flex-1 relative max-w-md">
                <Icon
                  icon="mdi:magnify"
                  className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-slate-400"
                  width={15}
                />
                <input
                  value={recentSearch}
                  onChange={(e) => setRecentSearch(e.target.value)}
                  placeholder={t("welcome.recent.filter")}
                  className="w-full rounded-lg border border-slate-200 bg-white py-2 pl-9 pr-3 text-[13px] text-slate-700 placeholder-slate-400 outline-none focus:border-slate-300 transition-colors"
                />
              </div>
              <div className="flex-1" />
              {recent.length > 0 && (
                <button
                  onClick={handleClearAllRecent}
                  className="shrink-0 text-xs text-slate-400 hover:text-red-500 transition-colors font-medium"
                >
                  {t("welcome.recent.clearAll")}
                </button>
              )}
            </div>

            {filteredRecent.length === 0 && (
              <div className="flex flex-col items-center justify-center flex-1 gap-5 py-16">
                <div className="flex h-20 w-20 items-center justify-center rounded-2xl bg-slate-200/60 border border-slate-200">
                  <Icon icon="mdi:folder-open-outline" className="text-5xl text-slate-400" />
                </div>
                <div className="text-center">
                  <p className="text-base font-medium text-slate-600">
                    {recentSearch.trim() ? t("welcome.recent.emptySearch") : t("welcome.recent.empty")}
                  </p>
                  <p className="text-sm text-slate-400 mt-1.5">
                    {recentSearch.trim()
                      ? t("welcome.recent.noMatch", { query: recentSearch })
                      : t("welcome.recent.emptyHint")}
                  </p>
                </div>
                {!recentSearch.trim() && (
                  <button
                    onClick={openNewForm}
                    className="flex items-center gap-2 text-sm text-indigo-600 hover:text-indigo-800 font-medium transition-colors"
                  >
                    <Icon icon="mdi:plus" className="text-base" />
                    {t("welcome.recent.createFirst")}
                  </button>
                )}
              </div>
            )}

            {filteredRecent.length > 0 && (
              <div
                className="grid gap-3 overflow-y-auto pr-1"
                style={{ gridTemplateColumns: "repeat(auto-fit, minmax(min(100%, 380px), 1fr))" }}
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
                <div className="text-sm font-semibold text-slate-900 truncate">{localizedTemplateName(selectedTemplate)}</div>
                <div className="text-[11px] text-slate-500 mt-0.5">{localizedTemplateDescription(selectedTemplate)}</div>
              </div>
              <button
                onClick={closeTemplateModal}
                className="text-slate-400 hover:text-slate-700 transition-colors"
              >
                <Icon icon="mdi:close" className="text-base" />
              </button>
            </div>

            <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-1.5">
              {t("welcome.form.projectName")}
            </label>
            <input
              autoFocus
              type="text"
              value={templateName}
              onChange={(e) => { setTemplateName(e.target.value); setTemplateNameError(""); }}
              onKeyDown={(e) => { if (e.key === "Escape") closeTemplateModal(); }}
              placeholder={t("welcome.form.namePlaceholder")}
              className={`w-full rounded-lg border ${
                templateNameError ? "border-red-300" : "border-slate-200"
              } bg-white px-3 py-2 text-sm text-slate-800 placeholder-slate-400 outline-none focus:border-slate-300 transition-colors mb-1`}
            />
            {templateNameError && <p className="text-[10px] text-red-500 mb-3">{templateNameError}</p>}

            <label className="block text-[10px] font-semibold uppercase tracking-widest text-slate-400 mb-1.5 mt-4">
              {t("welcome.form.destination")}
            </label>
            <div className="flex gap-2 items-center">
              <div className="flex-1 bg-slate-50 border border-slate-200 rounded-lg px-3 py-2 text-[11px] text-slate-600 truncate min-w-0">
                {selectedTemplateDirectoryPath ?? (
                  <span className="text-slate-400 italic">{t("welcome.form.noLocation")}</span>
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
                {t("welcome.form.browse")}
              </button>
            </div>

            <div className="flex gap-3 mt-5">
              <button
                onClick={closeTemplateModal}
                className="flex-1 py-2 text-xs rounded-lg border border-slate-200 hover:bg-slate-50 text-slate-600 transition-colors"
              >
                {t("common.cancel")}
              </button>
              <button
                onClick={() => void handleCreateFromTemplate()}
                disabled={!templatePath || !templateName.trim() || creatingFromTemplate}
                className="flex-1 py-2 text-xs rounded-lg bg-blue-600 hover:bg-blue-500 disabled:opacity-40 text-white font-medium transition-colors flex items-center justify-center gap-1.5"
              >
                {creatingFromTemplate && <Icon icon="mdi:loading" className="animate-spin text-sm" />}
                {t("welcome.form.createFromTemplate")}
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
  testId,
}: {
  icon: string;
  label: string;
  description?: string;
  onClick: () => void;
  active?: boolean;
  shortcut?: string;
  testId?: string;
}) {
  return (
    <button
      data-testid={testId}
      onClick={onClick}
      className={`group flex items-center gap-3 px-3.5 py-3 rounded-lg text-left transition-colors w-full
        ${active
          ? "bg-slate-100 text-slate-900 border border-slate-200"
          : "hover:bg-slate-50 text-slate-600 hover:text-slate-900 border border-transparent"
        }`}
    >
      <Icon
        icon={icon}
        className={`text-[20px] shrink-0 transition-colors ${
          active ? "text-indigo-600" : "text-slate-400 group-hover:text-slate-600"
        }`}
      />
      <div className="flex-1 min-w-0">
        <div className="text-sm font-medium truncate">{label}</div>
        {description && (
          <div className="text-[11px] text-slate-400 mt-0.5">{description}</div>
        )}
      </div>
      {shortcut && (
        <kbd className="shrink-0 text-[11px] font-mono font-normal text-slate-400 bg-slate-100 border border-slate-200 rounded px-1.5 py-0.5 leading-none">
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
  const { t } = useTranslation();
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
      className="group w-full text-left flex items-center gap-4 px-5 py-4 rounded-xl bg-white border border-slate-200 hover:border-indigo-300/70 hover:shadow-sm hover:shadow-indigo-100/50 transition-all cursor-pointer"
    >
      <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-lg bg-slate-100 ring-1 ring-slate-200">
        <Icon icon="mdi:layers-outline" className="text-indigo-500 text-xl" />
      </div>
      <div className="flex-1 min-w-0">
        <div className="text-sm text-slate-900 font-semibold truncate leading-snug">{entry.name}</div>
        <div className="text-[11px] text-slate-400 truncate mt-0.5">{entry.path}</div>
      </div>
      <div className="flex flex-col items-end gap-2 shrink-0">
        <span className="text-[11px] text-slate-400 tabular-nums">{formatDate(entry.updatedAt)}</span>
        <button
          type="button"
          onClick={onRemove}
          title={t("welcome.recent.remove")}
          className="opacity-0 group-hover:opacity-100 text-slate-300 hover:text-red-500 transition-all"
        >
          <Icon icon="mdi:close" className="text-sm" />
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
  onPickTemplate: (tpl: TemplateManifest) => void;
}) {
  const { t } = useTranslation();
  return (
    <div className="flex-1 min-h-0 flex flex-col">
      <div className="flex items-center gap-4 mb-6">
        <h2 className="text-xs font-semibold text-slate-400 uppercase tracking-widest shrink-0">
          {t("welcome.templates.title")}
        </h2>
        <div className="h-px flex-1 bg-slate-200" />
        <span className="text-xs text-slate-400 tabular-nums">
          {t("welcome.templates.count", { count: templates.length })}
        </span>
      </div>

      <div className="flex gap-2 mb-6 flex-wrap">
        {PROVIDERS.map((p) => {
          const active = providerFilter === p.id;
          const colors = PROVIDER_CHIP_COLORS[p.id];
          return (
            <button
              key={p.id}
              onClick={() => onChangeFilter(p.id)}
              className={`flex items-center gap-2 px-4 py-2 rounded-lg text-[13px] font-medium border transition-colors
                ${active ? colors.active : colors.inactive}`}
            >
              {p.logo ? (
                <img
                  src={p.logo}
                  alt=""
                  draggable={false}
                  className="h-5 w-5 object-contain"
                />
              ) : (
                <Icon icon={p.icon!} className="text-base" />
              )}
              {p.id === "all" ? t("welcome.templates.all") : p.label}
            </button>
          );
        })}
      </div>

      {templates.length === 0 ? (
        <div className="flex flex-col items-center justify-center flex-1 gap-5 py-16">
          <div className="flex h-20 w-20 items-center justify-center rounded-2xl bg-slate-200/60 border border-slate-200">
            <Icon icon="mdi:view-grid-outline" className="text-5xl text-slate-400" />
          </div>
          <p className="text-base font-medium text-slate-500">{t("welcome.templates.empty")}</p>
        </div>
      ) : (
        <div
          className="grid gap-4 overflow-y-auto pr-1"
          style={{ gridTemplateColumns: "repeat(auto-fit, minmax(min(100%, 300px), 1fr))" }}
        >
          {templates.map((tpl) => (
            <TemplateCard key={tpl.id} template={tpl} onClick={() => onPickTemplate(tpl)} />
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
  const { t } = useTranslation();
  const accent = providerCardAccent(template.provider);
  const localizedTemplateName = (tpl: TemplateManifest) =>
    t(`template.${tpl.id}.name`, { defaultValue: tpl.name });
  const localizedTemplateDescription = (tpl: TemplateManifest) =>
    t(`template.${tpl.id}.description`, { defaultValue: tpl.description });
  return (
    <button
      onClick={onClick}
      className={`text-left flex flex-col gap-3.5 p-5 rounded-xl bg-white border border-slate-200 ${accent.hoverBorder} hover:shadow-sm transition-all`}
    >
      <div className="flex items-start gap-3.5">
        <div className="flex h-12 w-12 shrink-0 items-center justify-center overflow-hidden rounded-lg bg-slate-100 ring-1 ring-slate-200">
          <img
            src={providerLogo(template.provider)}
            alt={providerLabel(template.provider)}
            className="h-full w-full object-cover"
            draggable={false}
          />
        </div>
        <div className="flex-1 min-w-0 pt-0.5">
          <div className="text-sm text-slate-900 font-semibold truncate leading-snug">{localizedTemplateName(template)}</div>
          <div className={`text-[11px] font-semibold uppercase tracking-widest mt-0.5 ${providerAccent(template.provider)}`}>
            {providerLabel(template.provider)}
          </div>
        </div>
      </div>
      <p className="text-[13px] text-slate-500 leading-relaxed line-clamp-2">
        {localizedTemplateDescription(template)}
      </p>
      <div className="flex items-center gap-2 mt-auto flex-wrap">
        <span className={`text-[11px] px-2 py-0.5 rounded border font-medium ${accent.tagBg}`}>
          {t("welcome.templates.resources", { count: template.resourceCount })}
        </span>
        {template.tags.slice(0, 2).map((tag) => (
          <span
            key={tag}
            className="text-[11px] px-2 py-0.5 rounded bg-slate-100 text-slate-500 border border-slate-200"
          >
            {tag}
          </span>
        ))}
      </div>
    </button>
  );
}
