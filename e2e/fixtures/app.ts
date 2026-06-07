import { expect, type Page } from "@playwright/test";

// Shared helper: walk the real welcome-screen flow to create an empty project
// and land on the canvas. Used by the canvas/terminal specs.
export async function createEmptyProjectAndOpenCanvas(page: Page, name = "E2E Project"): Promise<void> {
  await page.goto("/");
  await page.getByTestId("welcome-new-project").click();
  await page.getByTestId("new-project-name").fill(name);
  await page.getByTestId("new-project-browse").click(); // mocked dialog sets a path
  const createButton = page.getByTestId("new-project-create");
  await expect(createButton).toBeEnabled();
  await createButton.click();
  await expect(page.getByTestId("canvas-root")).toBeVisible({ timeout: 15_000 });
}
