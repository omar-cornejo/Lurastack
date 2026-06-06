// @vitest-environment jsdom
import { describe, it, expect, beforeEach } from "vitest";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { I18nextProvider } from "react-i18next";
import i18n from "../i18n";
import LanguageSwitcher from "./LanguageSwitcher";

const renderSwitcher = () =>
  render(
    <I18nextProvider i18n={i18n}>
      <LanguageSwitcher />
    </I18nextProvider>,
  );

describe("LanguageSwitcher", () => {
  beforeEach(async () => {
    await i18n.changeLanguage("en");
  });

  it("shows the active language code on the trigger", () => {
    renderSwitcher();
    // The trigger is the first button; it shows the uppercased active code.
    expect(screen.getAllByRole("button")[0]).toHaveTextContent("EN");
  });

  it("opens the menu and lists every language", async () => {
    renderSwitcher();
    await userEvent.click(screen.getAllByRole("button")[0]);
    expect(screen.getByText("English")).toBeInTheDocument();
    expect(screen.getByText("Español")).toBeInTheDocument();
    expect(screen.getByText("Català")).toBeInTheDocument();
  });

  it("switches the active language when an option is chosen", async () => {
    renderSwitcher();
    await userEvent.click(screen.getAllByRole("button")[0]);
    await userEvent.click(screen.getByText("Español"));
    expect(i18n.language).toBe("es");
    // The menu closed, and the trigger now reflects ES.
    expect(screen.getAllByRole("button")[0]).toHaveTextContent("ES");
  });

  it("reflects a pre-set active language on the trigger", async () => {
    await i18n.changeLanguage("ca");
    renderSwitcher();
    expect(screen.getAllByRole("button")[0]).toHaveTextContent("CA");
  });
});
