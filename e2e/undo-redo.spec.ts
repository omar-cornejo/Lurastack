import { test, expect } from "@playwright/test";
import { installTauriMock } from "./fixtures/tauriMock";
import { createEmptyProjectAndOpenCanvas } from "./fixtures/app";

// Flow F (no backend): add a node, then undo/redo via keyboard and verify the
// canvas reverts and re-applies. Exercises the two-stack history end-to-end
// through the real canvas (the hook itself is unit-tested separately).

test.beforeEach(async ({ page }) => {
  await installTauriMock(page);
  await createEmptyProjectAndOpenCanvas(page);
});

test("undo removes an added node and redo restores it", async ({ page }) => {
  const nodes = page.locator(".react-flow__node");
  await expect(nodes).toHaveCount(0);

  // Add a node (DOM click — the tiles are draggable; see add-node.spec).
  await page.getByTestId("catalog-item-aws_instance").evaluate((el: HTMLElement) => el.click());
  await expect(nodes).toHaveCount(1, { timeout: 10_000 });

  // Undo (Ctrl+Z) → node removed.
  await page.keyboard.press("Control+z");
  await expect(nodes).toHaveCount(0, { timeout: 10_000 });

  // Redo (Ctrl+y) → node restored.
  await page.keyboard.press("Control+y");
  await expect(nodes).toHaveCount(1, { timeout: 10_000 });
});
