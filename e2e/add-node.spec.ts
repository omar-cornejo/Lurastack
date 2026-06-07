import { test, expect } from "@playwright/test";
import { installTauriMock } from "./fixtures/tauriMock";
import { createEmptyProjectAndOpenCanvas } from "./fixtures/app";

// Flow: empty project → add a resource from the catalog → a node appears on the
// ReactFlow canvas → the generated HCL reflects it. Exercises the model→HCL
// translation (the product's core value prop) through the real canvas in a real
// browser. Backend is mocked (only benign fs writes happen).

test.beforeEach(async ({ page }) => {
  await installTauriMock(page);
  await createEmptyProjectAndOpenCanvas(page);
});

async function addCatalogItem(page: import("@playwright/test").Page, terraformType: string) {
  // The catalog tiles are `draggable`, which makes Playwright's pointer-based
  // click start a drag instead of firing onClick. Dispatch a real DOM click.
  await page.getByTestId(`catalog-item-${terraformType}`).evaluate((el: HTMLElement) => el.click());
}

test("adding a resource creates a node on the canvas", async ({ page }) => {
  // The empty canvas has no resource nodes yet.
  const nodes = page.locator(".react-flow__node");
  await expect(nodes).toHaveCount(0);

  await addCatalogItem(page, "aws_instance");

  // ReactFlow renders exactly one node (asserted via its stable DOM class).
  await expect(nodes).toHaveCount(1, { timeout: 10_000 });
});

test("the generated HCL reflects an added resource", async ({ page }) => {
  await addCatalogItem(page, "aws_vpc");
  await expect(page.locator(".react-flow__node")).toHaveCount(1, { timeout: 10_000 });

  // Switch to the Code section; the HCL must contain the resource block.
  await page.getByTestId("section-tab-code").click();
  await expect(page.getByText(/resource\s+"aws_vpc"/).first()).toBeVisible({ timeout: 10_000 });
});
