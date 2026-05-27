export type BottomPanelLogLevel = "info" | "success" | "warning" | "error";

export type BottomPanelLogEntry = {
  id: string;
  timestamp: string;
  level: BottomPanelLogLevel;
  title: string;
  message: string;
  fileName?: string;
  line?: number;
};
