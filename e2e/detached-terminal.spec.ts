import { test, expect } from "@playwright/test";
import { installTauriMock, getInvokeLog } from "./fixtures/tauriMock";

// Flow D (detached terminal window). The xterm terminal itself can't render in
// a headless browser (its renderer needs real layout — see the suppressTerminal
// guard), and its logic is covered by unit tests. So this spec validates the
// detached-window FLOW: it mounts from the ?detachedTerminal=1 route, reads its
// query params, and the popdown control invokes the right backend command.

test.beforeEach(async ({ page }) => {
  await installTauriMock(page);
});

test("the detached terminal window mounts from its route", async ({ page }) => {
  await page.goto("/?detachedTerminal=1&cwd=/tmp/proj&viewId=view-1");
  await expect(page.getByTestId("detached-terminal-root")).toBeVisible({ timeout: 10_000 });
  await expect(page.getByTestId("detached-terminal-popdown")).toBeVisible();
});

test("popdown invokes close_detached_terminal_window", async ({ page }) => {
  await page.goto("/?detachedTerminal=1&cwd=/tmp/proj&viewId=view-1");
  await page.getByTestId("detached-terminal-popdown").click();

  await expect
    .poll(async () => (await getInvokeLog(page)).some((e) => e.cmd === "close_detached_terminal_window"))
    .toBe(true);
});
