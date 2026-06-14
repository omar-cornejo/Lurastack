import { test, expect } from "@playwright/test";
import { installTauriMock } from "./fixtures/tauriMock";

// Smoke test: proves the whole E2E harness works end-to-end — the app boots
// with the mocked Tauri backend, the welcome screen renders, and the new-project
// flow lands on the real ReactFlow canvas in a real browser.

test.beforeEach(async ({ page }) => {
  await installTauriMock(page);
});

test("boots into the welcome screen with the Tauri shim active", async ({ page }) => {
  await page.goto("/");
  // The new-project side action is present (welcome screen rendered).
  await expect(page.getByTestId("welcome-new-project")).toBeVisible();
  // The shim is installed.
  const hasShim = await page.evaluate(
    () => !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__,
  );
  expect(hasShim).toBe(true);
});

test("creates an empty project and reaches the canvas", async ({ page }) => {
  await page.goto("/");

  await page.getByTestId("welcome-new-project").click();
  await page.getByTestId("new-project-name").fill("E2E Project");
  // Picks a (mocked) save location via the native dialog.
  await page.getByTestId("new-project-browse").click();

  const createButton = page.getByTestId("new-project-create");
  await expect(createButton).toBeEnabled();
  await createButton.click();

  // The ReactFlow canvas mounts — something jsdom cannot render.
  await expect(page.getByTestId("canvas-root")).toBeVisible({ timeout: 15_000 });
});
