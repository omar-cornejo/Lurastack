import { useEffect, useRef, useState } from "react";
import { Icon } from "@iconify/react";
import { useTranslation } from "react-i18next";
import { LANGUAGES, setStoredLanguage, type Language } from "../i18n/language";

type LanguageSwitcherProps = {
  variant?: "dark" | "light";
};

export default function LanguageSwitcher({ variant = "dark" }: LanguageSwitcherProps) {
  const { t, i18n } = useTranslation();
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  const current = (i18n.resolvedLanguage ?? i18n.language ?? "en") as Language;
  const activeLabel = LANGUAGES.find((l) => l.code === current)?.code.toUpperCase() ?? "EN";

  const changeLanguage = (code: Language) => {
    void i18n.changeLanguage(code);
    setStoredLanguage(code);
    setOpen(false);
  };

  const isDark = variant === "dark";

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        title={t("language.label")}
        className={
          isDark
            ? `flex h-full items-center gap-1.5 px-3.5 text-[12px] transition-colors ${open ? "bg-slate-800 text-white" : "hover:bg-slate-800"}`
            : `flex w-full items-center gap-2 rounded-lg border px-3 py-2 text-[13px] font-medium transition-colors ${
                open
                  ? "border-slate-300 bg-slate-100 text-slate-900"
                  : "border-slate-200 bg-white text-slate-600 hover:border-slate-300"
              }`
        }
      >
        <Icon icon="mdi:translate" className={isDark ? "text-[14px]" : "text-base"} />
        <span className={isDark ? "text-[12px]" : ""}>{activeLabel}</span>
        <Icon icon="mdi:chevron-down" className={isDark ? "text-[13px] opacity-70 ml-auto" : "text-sm opacity-70 ml-auto"} />
      </button>

      {open && (
        <div
          className={
            isDark
              ? "absolute right-0 top-full z-50 mt-0 min-w-[160px] rounded-b-lg border border-slate-700 bg-slate-900 py-1.5 text-[13px] text-slate-300 shadow-xl"
              : "absolute left-0 right-0 bottom-full z-50 mb-1.5 min-w-[160px] rounded-lg border border-slate-200 bg-white py-1 text-[13px] text-slate-700 shadow-lg"
          }
        >
          {LANGUAGES.map((lang) => {
            const active = lang.code === current;
            return (
              <button
                key={lang.code}
                type="button"
                onClick={() => changeLanguage(lang.code)}
                className={
                  isDark
                    ? "flex w-full items-center justify-between px-3 py-1.5 text-left transition-colors hover:bg-slate-700 hover:text-white"
                    : "flex w-full items-center justify-between px-3 py-2 text-left transition-colors hover:bg-slate-100 hover:text-slate-900"
                }
              >
                <span>{lang.label}</span>
                <Icon
                  icon="mdi:check"
                  className={`text-[13px] ml-4 ${active ? (isDark ? "text-blue-400" : "text-indigo-500") : "opacity-0"}`}
                />
              </button>
            );
          })}
        </div>
      )}
    </div>
  );
}
