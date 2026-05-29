import type { ViewSnapshot } from "./project";

export type HistoryAction =
  | "terraform_plan"
  | "terraform_plan_destroy"
  | "terraform_apply"
  | "terraform_destroy"
  | "local-edit";

export type HistoryChange = {
  address: string;
  action: "create" | "change" | "destroy";
};

export type HistorySummary = { created: number; changed: number; destroyed: number };

export type HistoryEntry = {
  id: string;
  timestamp: string;
  action: HistoryAction;
  success: boolean;
  viewId: string;
  viewName: string;
  summary: HistorySummary;
  changes?: HistoryChange[];
  message?: string;
  snapshotBefore: ViewSnapshot;
  snapshotAfter: ViewSnapshot;
};

export type HistoryIndex = {
  version: "1";
  entries: Array<Omit<HistoryEntry, "snapshotBefore" | "snapshotAfter" | "changes">>;
};
