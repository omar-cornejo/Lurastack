import { useEffect, useState, useCallback } from "react";
import { Icon } from "@iconify/react";
import { loadHistoryIndex, loadHistoryEntry } from "../commands/historyManager";
import type { HistoryEntry, HistoryIndex, HistoryAction } from "../types/history";
import type { DdfViewSnapshot } from "../types/project";

type HistoryTabProps = {
  projectDir: string;
  currentViewId: string;
  refreshSignal: number;
  onRestore: (snapshot: DdfViewSnapshot, entryId: string) => void;
};

function relativeTime(iso: string): string {
  const diff = Date.now() - new Date(iso).getTime();
  const minutes = Math.floor(diff / 60_000);
  if (minutes < 1) return "ahora mismo";
  if (minutes < 60) return `hace ${minutes} min`;
  const hours = Math.floor(minutes / 60);
  if (hours < 24) return `hace ${hours} h`;
  const days = Math.floor(hours / 24);
  return `hace ${days} d`;
}

function dayKey(iso: string): string {
  const d = new Date(iso);
  return `${d.getFullYear()}-${d.getMonth()}-${d.getDate()}`;
}

function dayLabel(iso: string): string {
  const d = new Date(iso);
  const today = new Date();
  const yesterday = new Date();
  yesterday.setDate(today.getDate() - 1);
  if (dayKey(iso) === dayKey(today.toISOString())) return "Hoy";
  if (dayKey(iso) === dayKey(yesterday.toISOString())) return "Ayer";
  return d.toLocaleDateString(undefined, { day: "numeric", month: "short", year: "numeric" });
}

function actionIcon(action: HistoryAction): string {
  switch (action) {
    case "terraform_plan": return "mdi:magnify";
    case "terraform_plan_destroy": return "mdi:magnify-minus-outline";
    case "terraform_apply": return "mdi:check-circle-outline";
    case "terraform_destroy": return "mdi:trash-can-outline";
    case "local-edit": return "mdi:pencil-outline";
  }
}

function actionLabel(action: HistoryAction): string {
  switch (action) {
    case "terraform_plan": return "Plan";
    case "terraform_plan_destroy": return "Plan Destroy";
    case "terraform_apply": return "Apply";
    case "terraform_destroy": return "Destroy";
    case "local-edit": return "Edición local";
  }
}

function actionColor(action: HistoryAction, success: boolean): { icon: string; label: string } {
  if (!success) return { icon: "text-red-600", label: "text-slate-800" };
  switch (action) {
    case "terraform_apply": return { icon: "text-emerald-600", label: "text-slate-800" };
    case "terraform_destroy": return { icon: "text-red-600", label: "text-slate-800" };
    case "terraform_plan": return { icon: "text-sky-600", label: "text-slate-800" };
    case "terraform_plan_destroy": return { icon: "text-amber-600", label: "text-slate-800" };
    case "local-edit": return { icon: "text-indigo-600", label: "text-slate-800" };
  }
}

function SummaryChip({ summary }: { summary: { created: number; changed: number; destroyed: number } }) {
  const parts: string[] = [];
  if (summary.created > 0) parts.push(`+${summary.created}`);
  if (summary.changed > 0) parts.push(`~${summary.changed}`);
  if (summary.destroyed > 0) parts.push(`-${summary.destroyed}`);
  if (parts.length === 0) return null;
  return (
    <span className="inline-flex gap-1 text-[10px] font-mono">
      {summary.created > 0 && <span className="text-emerald-700">+{summary.created}</span>}
      {summary.changed > 0 && <span className="text-amber-700">~{summary.changed}</span>}
      {summary.destroyed > 0 && <span className="text-red-700">-{summary.destroyed}</span>}
    </span>
  );
}

const isPlanOnly = (action: HistoryAction) =>
  action === "terraform_plan" || action === "terraform_plan_destroy";

export default function HistoryTab({
  projectDir,
  currentViewId,
  refreshSignal,
  onRestore,
}: HistoryTabProps) {
  const [index, setIndex] = useState<HistoryIndex | null>(null);
  const [showAllViews, setShowAllViews] = useState(false);
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [expandedEntry, setExpandedEntry] = useState<HistoryEntry | null>(null);
  const [loadingDetail, setLoadingDetail] = useState(false);
  const [restoreConfirmId, setRestoreConfirmId] = useState<string | null>(null);

  const loadIndex = useCallback(async () => {
    if (!projectDir) return;
    const idx = await loadHistoryIndex(projectDir);
    setIndex(idx);
  }, [projectDir]);

  useEffect(() => {
    void loadIndex();
  }, [loadIndex, refreshSignal]);

  const handleExpand = async (id: string) => {
    if (expandedId === id) {
      setExpandedId(null);
      setExpandedEntry(null);
      setRestoreConfirmId(null);
      return;
    }
    setExpandedId(id);
    setExpandedEntry(null);
    setRestoreConfirmId(null);
    setLoadingDetail(true);
    const entry = await loadHistoryEntry(projectDir, id);
    setExpandedEntry(entry);
    setLoadingDetail(false);
  };

  const handleRestore = (entry: HistoryEntry) => {
    onRestore(entry.snapshotAfter, entry.id);
    setRestoreConfirmId(null);
    setExpandedId(null);
    setExpandedEntry(null);
  };

  const entries = index?.entries ?? [];
  const filtered = showAllViews
    ? entries
    : entries.filter((e) => e.viewId === currentViewId);

  return (
    <div className="flex flex-col h-full w-full min-w-0 overflow-hidden pl-1.5">
      {/* Header / filter toggle */}
      <div className="flex items-center justify-between border-b border-slate-100 px-3 py-2">
        <span className="text-[11px] font-semibold text-slate-500 uppercase tracking-wide">
          {filtered.length} {filtered.length === 1 ? "entrada" : "entradas"}
        </span>
        <button
          type="button"
          onClick={() => setShowAllViews((v) => !v)}
          className={`text-[10px] font-medium rounded px-2 py-0.5 transition-colors ${
            showAllViews
              ? "bg-indigo-100 text-indigo-700"
              : "text-slate-400 hover:text-slate-600"
          }`}
        >
          {showAllViews ? "Este view" : "Todas las vistas"}
        </button>
      </div>

      {/* Entry list */}
      <div className="flex-1 min-w-0 overflow-y-auto overflow-x-hidden" style={{ scrollbarWidth: "thin", scrollbarColor: "#e2e8f0 transparent" }}>
        {filtered.length === 0 && (
          <div className="flex flex-col items-center gap-3 px-4 py-10 text-center">
            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-slate-100">
              <Icon icon="mdi:history" className="text-slate-400" width={20} />
            </div>
            <p className="text-[12px] text-slate-500">
              {entries.length === 0
                ? "Aún no hay entradas en el historial."
                : "No hay entradas para este view."}
            </p>
          </div>
        )}

        {filtered.map((entry, index) => {
          const isExpanded = expandedId === entry.id;
          const color = actionColor(entry.action, entry.success);
          const prevEntry = index > 0 ? filtered[index - 1] : null;
          const showDayDivider = !prevEntry || dayKey(prevEntry.timestamp) !== dayKey(entry.timestamp);

          return (
            <div key={entry.id}>
            {/* Day divider */}
            {showDayDivider && (
              <div className="sticky top-0 z-10 bg-white border-b border-slate-100 px-4 py-1.5">
                <span className="inline-block max-w-full truncate text-[10px] font-semibold uppercase tracking-wider text-slate-500">
                  {dayLabel(entry.timestamp)}
                </span>
              </div>
            )}
            <div className="border-b border-slate-100 last:border-b-0">
              {/* Row */}
              <button
                type="button"
                className="flex w-full items-start gap-2.5 bg-slate-50 px-3 py-2.5 text-left"
                onClick={() => void handleExpand(entry.id)}
              >
                <div className={`mt-0.5 shrink-0 ${color.icon}`}>
                  <Icon icon={actionIcon(entry.action)} width={15} />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2 flex-wrap">
                    <span className={`text-[12px] font-medium ${color.label}`}>
                      {actionLabel(entry.action)}
                    </span>
                    {!entry.success && (
                      <span className="rounded bg-red-100 px-1.5 py-px text-[9px] font-bold uppercase text-red-600">
                        Error
                      </span>
                    )}
                    {isPlanOnly(entry.action) && (
                      <span className="rounded bg-slate-100 px-1.5 py-px text-[9px] font-semibold uppercase text-slate-500">
                        Informativo
                      </span>
                    )}
                    <SummaryChip summary={entry.summary} />
                  </div>
                  <div className="flex items-center gap-1.5 mt-0.5">
                    <span className="text-[10px] text-slate-400">{relativeTime(entry.timestamp)}</span>
                    {!showAllViews ? null : (
                      <span className="text-[10px] text-slate-300">· {entry.viewName}</span>
                    )}
                    {entry.message && (
                      <span className="text-[10px] text-slate-400 truncate">· {entry.message}</span>
                    )}
                  </div>
                </div>
                <Icon
                  icon={isExpanded ? "mdi:chevron-up" : "mdi:chevron-down"}
                  width={14}
                  className="mt-0.5 shrink-0 text-slate-400"
                />
              </button>

              {/* Detail panel */}
              {isExpanded && (
                <div className="bg-slate-50/80 border-t border-slate-100 px-3 py-3 space-y-3">
                  {loadingDetail && !expandedEntry && (
                    <p className="text-[11px] text-slate-400">Cargando detalles…</p>
                  )}

                  {expandedEntry && (
                    <>
                      {/* Timestamp detail */}
                      <p className="text-[10px] text-slate-400">
                        {new Date(expandedEntry.timestamp).toLocaleString()}
                      </p>

                      {/* Changes list */}
                      {expandedEntry.changes && expandedEntry.changes.length > 0 && (
                        <div className="space-y-1">
                          <p className="text-[10px] font-semibold uppercase tracking-wide text-slate-400">
                            Cambios
                          </p>
                          <div className="space-y-0.5 max-h-40 overflow-y-auto" style={{ scrollbarWidth: "thin" }}>
                            {expandedEntry.changes.map((change) => (
                              <div
                                key={change.address}
                                className="flex min-w-0 items-center gap-2 text-[11px]"
                              >
                                <span
                                  className={`shrink-0 ${
                                    change.action === "create"
                                      ? "text-emerald-600 font-bold"
                                      : change.action === "destroy"
                                        ? "text-red-500 font-bold"
                                        : "text-amber-600 font-bold"
                                  }`}
                                >
                                  {change.action === "create" ? "+" : change.action === "destroy" ? "-" : "~"}
                                </span>
                                <span className="min-w-0 flex-1 truncate font-mono text-slate-700">{change.address}</span>
                              </div>
                            ))}
                          </div>
                        </div>
                      )}

                      {/* Restore / info */}
                      {isPlanOnly(expandedEntry.action) ? (
                        <p className="text-[11px] text-slate-400 italic">
                          Las entradas de Plan no modifican estado; no se puede restaurar a este punto.
                        </p>
                      ) : (
                        <div>
                          {restoreConfirmId === expandedEntry.id ? (
                            <div className="flex items-center gap-2">
                              <span className="text-[11px] text-slate-600">¿Restaurar diseño?</span>
                              <button
                                type="button"
                                onClick={() => handleRestore(expandedEntry)}
                                className="rounded bg-indigo-600 px-2.5 py-1 text-[11px] font-semibold text-white hover:bg-indigo-700 transition-colors"
                              >
                                Confirmar
                              </button>
                              <button
                                type="button"
                                onClick={() => setRestoreConfirmId(null)}
                                className="rounded border border-slate-200 px-2.5 py-1 text-[11px] text-slate-600 hover:bg-slate-100 transition-colors"
                              >
                                Cancelar
                              </button>
                            </div>
                          ) : (
                            <button
                              type="button"
                              onClick={() => setRestoreConfirmId(expandedEntry.id)}
                              className="rounded border border-slate-200 bg-white px-3 py-1.5 text-[11px] font-medium text-slate-700 hover:border-indigo-300 hover:bg-indigo-50 transition-colors"
                            >
                              Restaurar diseño
                            </button>
                          )}
                        </div>
                      )}
                    </>
                  )}
                </div>
              )}
            </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
