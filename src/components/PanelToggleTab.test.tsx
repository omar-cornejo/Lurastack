// @vitest-environment jsdom
import { describe, it, expect, vi } from "vitest";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { PanelToggleTab } from "./PanelToggleTab";

describe("PanelToggleTab", () => {
  it("reflects the open state via aria-expanded", () => {
    const { rerender } = render(<PanelToggleTab open={false} onClick={() => {}} edge="right" />);
    expect(screen.getByRole("button").getAttribute("aria-expanded")).toBe("false");
    rerender(<PanelToggleTab open onClick={() => {}} edge="right" />);
    expect(screen.getByRole("button").getAttribute("aria-expanded")).toBe("true");
  });

  it("uses a sensible default aria-label based on state", () => {
    const { rerender } = render(<PanelToggleTab open={false} onClick={() => {}} edge="left" />);
    expect(screen.getByRole("button").getAttribute("aria-label")).toBe("Expand panel");
    rerender(<PanelToggleTab open onClick={() => {}} edge="left" />);
    expect(screen.getByRole("button").getAttribute("aria-label")).toBe("Collapse panel");
  });

  it("honors a custom aria-label and aria-controls", () => {
    render(
      <PanelToggleTab
        open
        onClick={() => {}}
        edge="top"
        ariaLabel="Toggle inspector"
        ariaControls="inspector-panel"
      />,
    );
    const button = screen.getByRole("button", { name: "Toggle inspector" });
    expect(button.getAttribute("aria-controls")).toBe("inspector-panel");
  });

  it("fires onClick when pressed", async () => {
    const onClick = vi.fn();
    render(<PanelToggleTab open={false} onClick={onClick} edge="right" />);
    await userEvent.click(screen.getByRole("button"));
    expect(onClick).toHaveBeenCalledTimes(1);
  });
});
