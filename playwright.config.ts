import { defineConfig, devices } from "@playwright/test";

// E2E tests run against the Vite dev server in a real Chromium browser, with the
// Tauri backend mocked at the IPC boundary (see e2e/fixtures/tauriMock.ts).
// This exercises the ReactFlow canvas and xterm terminal — which jsdom can't —
// without needing a built Tauri binary or a real `terraform`.
export default defineConfig({
  testDir: "./e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 1 : 0,
  reporter: process.env.CI ? [["html", { open: "never" }], ["list"]] : "list",
  use: {
    baseURL: "http://localhost:1420",
    trace: "on-first-retry",
  },
  projects: [{ name: "chromium", use: { ...devices["Desktop Chrome"] } }],
  webServer: {
    // Build the template index first (the predev hook would, but CI uses
    // --ignore-scripts), then start Vite on its fixed port.
    command: "npm run templates:index && npx vite --port 1420 --strictPort",
    url: "http://localhost:1420",
    reuseExistingServer: !process.env.CI,
    timeout: 120_000,
  },
});
