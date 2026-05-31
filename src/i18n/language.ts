export type Language = "en" | "es" | "ca";

export const LANGUAGES: { code: Language; label: string }[] = [
  { code: "en", label: "English" },
  { code: "es", label: "Español" },
  { code: "ca", label: "Català" },
];

const STORAGE_KEY = "lurastack:language";
const DEFAULT_LANGUAGE: Language = "en";

const isLanguage = (value: unknown): value is Language =>
  typeof value === "string" && LANGUAGES.some((l) => l.code === value);

export function getStoredLanguage(): Language {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return isLanguage(raw) ? raw : DEFAULT_LANGUAGE;
  } catch {
    return DEFAULT_LANGUAGE;
  }
}

export function setStoredLanguage(lang: Language): void {
  try {
    localStorage.setItem(STORAGE_KEY, lang);
  } catch {
    // ignore persistence failures (e.g. storage disabled)
  }
}
