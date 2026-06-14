import { sileo } from "sileo";

const BRIDGE_COOLDOWN_MS = 5000;
const bridgeSeen = new Map<string, number>();
let bridgeInstalled = false;

type ConsoleMethod = (...args: unknown[]) => void;

const shouldEmit = (key: string) => {
  const now = Date.now();
  const last = bridgeSeen.get(key) ?? 0;
  if (now - last < BRIDGE_COOLDOWN_MS) return false;
  bridgeSeen.set(key, now);
  return true;
};

const stringifyArgs = (args: unknown[]) =>
  args
    .map((arg) => {
      if (typeof arg === "string") return arg;
      if (arg instanceof Error) return arg.message;
      try {
        return JSON.stringify(arg);
      } catch {
        return String(arg);
      }
    })
    .join(" ");

const emitToast = (title: string, description: string, duration: number) => {
  setTimeout(() => {
    sileo.warning({
      title,
      description,
      position: "top-center",
      duration,
    });
  }, 0);
};

const patchWarn = (originalWarn: ConsoleMethod) => {
  console.warn = (...args: unknown[]) => {
    const message = stringifyArgs(args);

    if (
      message.includes("[React Flow]: It looks like you've created a new nodeTypes or edgeTypes object") &&
      shouldEmit("RF_NODE_TYPES")
    ) {
      emitToast(
        "React Flow warning",
        "nodeTypes/edgeTypes se están recreando. Revisa memoización/constantes.",
        3200,
      );
    }

    if (
      message.includes("Failed to persist HCL file via Tauri fs plugin") &&
      shouldEmit("TAURI_FS_PERSIST")
    ) {
      emitToast(
        "Persistencia HCL",
        "No se pudo guardar el .tf en AppData (permisos Tauri).",
        3800,
      );
    }

    originalWarn(...args);
  };
};

const patchError = (originalError: ConsoleMethod) => {
  console.error = (...args: unknown[]) => {
    const message = stringifyArgs(args);

    if (
      message.includes("ResizeObserver loop completed with undelivered notifications") &&
      shouldEmit("RESIZE_OBSERVER")
    ) {
      emitToast(
        "UI warning",
        "ResizeObserver loop detectado (normalmente no bloqueante).",
        2600,
      );
    }

    if (
      message.includes("this._renderer.value.dimensions") &&
      shouldEmit("XTERM_RENDERER")
    ) {
      emitToast(
        "Terminal renderer",
        "Error del terminal embebido (xterm), ajeno al canvas.",
        3200,
      );
    }

    originalError(...args);
  };
};

export const installConsoleToasterBridge = () => {
  if (bridgeInstalled) return;
  bridgeInstalled = true;

  const originalWarn = console.warn.bind(console);
  const originalError = console.error.bind(console);

  patchWarn(originalWarn);
  patchError(originalError);
};
