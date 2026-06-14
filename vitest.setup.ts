import "@testing-library/jest-dom/vitest";
import { vi } from "vitest";

// Centralized Tauri IPC seam. The frontend talks to the Rust backend through
// these module boundaries; in tests there is no backend, so we stub them here.
//
// `invoke` rejects by default: a test that accidentally triggers a real backend
// call should fail loudly rather than silently resolve `undefined`. Tests that
// exercise IPC paths override these mocks locally with `vi.mocked(...)`.

vi.mock("@tauri-apps/api/core", () => ({
  invoke: vi.fn((cmd: string) =>
    Promise.reject(
      new Error(`Unmocked Tauri invoke("${cmd}") — mock it explicitly in the test`),
    ),
  ),
}));

vi.mock("@tauri-apps/plugin-fs", () => ({
  readTextFile: vi.fn(),
  writeTextFile: vi.fn(),
  readDir: vi.fn(),
  mkdir: vi.fn(),
  remove: vi.fn(),
  rename: vi.fn(),
  exists: vi.fn(),
  BaseDirectory: {},
}));

vi.mock("@tauri-apps/plugin-dialog", () => ({
  open: vi.fn(),
  save: vi.fn(),
}));
