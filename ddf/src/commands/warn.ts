import { sileo } from "sileo";

const WARNING_COOLDOWN_MS = 4000;
const seenWarnings = new Map<string, number>();

const toKey = (message: string, code?: string) => `${code ?? "GEN"}::${message}`;

const emitWarningToast = (message: string) => {
  setTimeout(() => {
    sileo.warning({
      title: "Canvas warning",
      description: message,
      position: "top-center",
      duration: 3600,
    });
  }, 0);
};

export const warn = (message: string, code?: string) => {
  const key = toKey(message, code);
  const now = Date.now();
  const last = seenWarnings.get(key) ?? 0;

  if (now - last < WARNING_COOLDOWN_MS) {
    return;
  }

  seenWarnings.set(key, now);
  emitWarningToast(message);
  console.warn(`[canvas-warning:${code ?? "GEN"}] ${message}`);
};
