import { Icon } from "@iconify/react";
import { useTranslation } from "react-i18next";

type DivergenceBannerProps = {
  visible: boolean;
  onApply: () => void;
  onDismiss: () => void;
};

export default function DivergenceBanner({ visible, onApply, onDismiss }: DivergenceBannerProps) {
  const { t } = useTranslation();
  if (!visible) return null;

  return (
    <div className="flex items-center justify-between gap-3 border-b border-amber-200 bg-amber-50 px-4 py-2">
      <div className="flex items-center gap-2 text-amber-800">
        <Icon icon="mdi:alert-circle-outline" width={16} className="shrink-0 text-amber-500" />
        <span className="text-[12px] font-medium">
          {t("divergence.message")}
        </span>
      </div>
      <div className="flex items-center gap-2">
        <button
          type="button"
          onClick={onApply}
          className="rounded-md bg-amber-600 px-3 py-1 text-[11px] font-semibold text-white hover:bg-amber-700 transition-colors"
        >
          Apply
        </button>
        <button
          type="button"
          onClick={onDismiss}
          className="rounded-md border border-amber-300 bg-white px-2 py-1 text-[11px] text-amber-700 hover:bg-amber-50 transition-colors"
          title={t("divergence.dismiss")}
        >
          <Icon icon="mdi:close" width={13} />
        </button>
      </div>
    </div>
  );
}
