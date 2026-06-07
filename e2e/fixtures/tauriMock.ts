import type { Page } from "@playwright/test";

// Installs a fake `window.__TAURI_INTERNALS__` BEFORE any app code runs, so the
// app's `!!window.__TAURI_INTERNALS__` checks take the desktop path while every
// IPC call is served by an in-page mock registry. This lets the real ReactFlow
// canvas and xterm terminal run in a plain browser with no Tauri backend.
//
// The shim emulates the two entry points @tauri-apps/api 2.x uses:
//   - window.__TAURI_INTERNALS__.invoke(cmd, args, options)
//   - window.__TAURI_INTERNALS__.transformCallback(cb, once)
// plus an event bus so `listen(event, cb)` works and tests can emit events.

export type MockResult = unknown;

// Default command responses. A command not listed here resolves to `null`
// (benign) EXCEPT the ones we explicitly want to fail; unknown commands log a
// warning so an accidental real dependency is visible but never silently wrong.
const DEFAULT_RESPONSES: Record<string, MockResult> = {
  // Native dialogs: the new-project flow asks for a directory; return a fake one.
  "plugin:dialog|open": "/tmp/lurastack-e2e",
  "plugin:dialog|save": "/tmp/lurastack-e2e/project.lura",
  // Filesystem plugin: writes/mkdir/exists all succeed benignly.
  "plugin:fs|mkdir": null,
  "plugin:fs|write_text_file": null,
  "plugin:fs|write_file": null,
  "plugin:fs|read_text_file": "",
  "plugin:fs|read_dir": [],
  "plugin:fs|exists": false,
  "plugin:fs|remove": null,
  "plugin:fs|rename": null,
  grant_project_access: null,
  terraform_state_signature: "sig-0",
  terraform_lsp_diagnostics: { diagnostics: [] },
  terraform_validate: { ok: true, diagnostics: [], initRan: false },
  list_aws_profiles: [],
  get_aws_paths: {
    credentialsPath: "",
    credentialsExists: false,
    configPath: "",
    configExists: false,
    defaultCredentialsPath: "",
    defaultConfigPath: "",
  },
  get_aws_env_source: { processCwd: "", envFilePath: null, envFileExists: false },
  secrets_backend_info: { backend: "encryptedFile", available: true, fallbackReason: null },
  load_secret: null,
  save_secret: null,
  init_terminal_session: null,
  write_to_pty: null,
  close_terminal_session: null,
  open_detached_terminal_window: null,
  close_detached_terminal_window: null,
  terraform_plan: { hasState: false, resources: [], stateSignature: "sig-0" },
  terraform_show: { hasState: false, resources: [], stateSignature: "sig-0" },
};

export type TauriMockOptions = {
  // Per-test overrides, merged over the defaults.
  responses?: Record<string, MockResult>;
};

// Inject the shim. Must run before the app bundle loads.
export async function installTauriMock(page: Page, options: TauriMockOptions = {}): Promise<void> {
  const responses = { ...DEFAULT_RESPONSES, ...(options.responses ?? {}) };

  await page.addInitScript((injected: { responses: Record<string, MockResult> }) => {
    const callbacks = new Map<number, (payload: unknown) => void>();
    let nextCallbackId = 1;
    // event name -> set of callback ids registered via listen()
    const listeners = new Map<string, Set<number>>();
    // record of invoked commands for assertions
    const invokeLog: Array<{ cmd: string; args: unknown }> = [];

    const internals = {
      // getCurrentWindow() reads metadata.currentWindow.label.
      metadata: {
        currentWindow: { label: "main" },
        currentWebview: { windowLabel: "main", label: "main" },
      },
      transformCallback(cb: (payload: unknown) => void, _once?: boolean): number {
        const id = nextCallbackId++;
        callbacks.set(id, cb);
        return id;
      },
      async invoke(cmd: string, args: Record<string, unknown> = {}): Promise<unknown> {
        invokeLog.push({ cmd, args });

        // Event plugin: wire listen/unlisten into the in-page bus.
        if (cmd === "plugin:event|listen") {
          const event = args.event as string;
          const handlerId = args.handler as number;
          if (!listeners.has(event)) listeners.set(event, new Set());
          listeners.get(event)!.add(handlerId);
          return handlerId; // used as the eventId for unlisten
        }
        if (cmd === "plugin:event|unlisten") {
          const eventId = args.eventId as number;
          for (const ids of listeners.values()) ids.delete(eventId);
          return null;
        }

        if (cmd in injected.responses) {
          return injected.responses[cmd];
        }
        // Unknown command: visible but non-fatal.
        // eslint-disable-next-line no-console
        console.warn(`[tauri-mock] unmocked invoke("${cmd}")`);
        return null;
      },
    };

    // Test hook: emit a Tauri event to all registered listeners.
    (window as unknown as { __emitTauriEvent: (name: string, payload: unknown) => void }).__emitTauriEvent =
      (name: string, payload: unknown) => {
        const ids = listeners.get(name);
        if (!ids) return;
        for (const id of ids) {
          const cb = callbacks.get(id);
          if (cb) cb({ event: name, id, payload });
        }
      };

    // Test hook: read the invoke log for assertions.
    (window as unknown as { __tauriInvokeLog: typeof invokeLog }).__tauriInvokeLog = invokeLog;

    (window as unknown as { __TAURI_INTERNALS__: typeof internals }).__TAURI_INTERNALS__ = internals;

    // Signal E2E mode so the app can suppress the xterm terminal, which can't
    // initialize its renderer in a headless browser (see WorkspaceView).
    (window as unknown as { __LURASTACK_E2E__: boolean }).__LURASTACK_E2E__ = true;

    // The event plugin unlisten path calls this directly (not via invoke).
    (window as unknown as {
      __TAURI_EVENT_PLUGIN_INTERNALS__: { unregisterListener: (event: string, id: number) => void };
    }).__TAURI_EVENT_PLUGIN_INTERNALS__ = {
      unregisterListener: (event: string, id: number) => {
        listeners.get(event)?.delete(id);
        callbacks.delete(id);
      },
    };
  }, { responses });
}

// Emit a backend event (e.g. "pty-output", "terraform-output") from a test.
export async function emitTauriEvent(page: Page, name: string, payload: unknown): Promise<void> {
  await page.evaluate(
    ({ name, payload }) =>
      (window as unknown as { __emitTauriEvent: (n: string, p: unknown) => void }).__emitTauriEvent(
        name,
        payload,
      ),
    { name, payload },
  );
}

// Read the recorded invoke log for assertions.
export async function getInvokeLog(page: Page): Promise<Array<{ cmd: string; args: unknown }>> {
  return page.evaluate(
    () => (window as unknown as { __tauriInvokeLog: Array<{ cmd: string; args: unknown }> }).__tauriInvokeLog,
  );
}
