import i18n from "i18next";
import { initReactI18next } from "react-i18next";
import { getStoredLanguage } from "./language";
import en from "./locales/en.json";
import es from "./locales/es.json";
import ca from "./locales/ca.json";

void i18n.use(initReactI18next).init({
  resources: {
    en: { translation: en },
    es: { translation: es },
    ca: { translation: ca },
  },
  lng: getStoredLanguage(),
  fallbackLng: "en",
  interpolation: { escapeValue: false },
});

export default i18n;
