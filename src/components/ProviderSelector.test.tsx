// @vitest-environment jsdom
import { describe, it, expect, vi } from "vitest";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { ProviderSelector } from "./ProviderSelector";

describe("ProviderSelector", () => {
  it("renders an option per provider and reflects the selected one", () => {
    render(<ProviderSelector selectedProvider="gcp" onProviderChange={() => {}} />);
    const select = screen.getByRole("combobox") as HTMLSelectElement;
    expect(select.value).toBe("gcp");
    expect(screen.getByRole("option", { name: /AWS/ })).toBeInTheDocument();
    expect(screen.getByRole("option", { name: /GCP/ })).toBeInTheDocument();
    expect(screen.getByRole("option", { name: /Azure/ })).toBeInTheDocument();
  });

  it("shows the default-region hint for the selected provider", () => {
    const { rerender } = render(<ProviderSelector selectedProvider="aws" onProviderChange={() => {}} />);
    expect(screen.getByText(/eu-south-2/)).toBeInTheDocument();
    rerender(<ProviderSelector selectedProvider="azure" onProviderChange={() => {}} />);
    expect(screen.getByText(/westeurope/)).toBeInTheDocument();
  });

  it("calls onProviderChange with the newly selected provider", async () => {
    const onProviderChange = vi.fn();
    render(<ProviderSelector selectedProvider="aws" onProviderChange={onProviderChange} />);
    await userEvent.selectOptions(screen.getByRole("combobox"), "gcp");
    expect(onProviderChange).toHaveBeenCalledWith("gcp");
  });
});
