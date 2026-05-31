import { useTranslation } from "react-i18next";
import type { AwsCredentials } from "../hooks/useAwsCredentials";

type CloudProvider = "aws" | "gcp" | "azure";

const PROVIDER_BADGE: Record<CloudProvider, { label: string; configuredClass: string; dotConfiguredClass: string }> = {
  aws: {
    label: "AWS",
    configuredClass: "border-orange-500/60 bg-orange-500/10 text-orange-300 hover:bg-orange-500/20",
    dotConfiguredClass: "bg-orange-400",
  },
  gcp: {
    label: "GCP",
    configuredClass: "border-blue-500/60 bg-blue-500/10 text-blue-300 hover:bg-blue-500/20",
    dotConfiguredClass: "bg-blue-400",
  },
  azure: {
    label: "Azure",
    configuredClass: "border-sky-500/60 bg-sky-500/10 text-sky-300 hover:bg-sky-500/20",
    dotConfiguredClass: "bg-sky-400",
  },
};

type HeaderProps = {
  onClearCanvas: () => void;
  activeSection: "canvas" | "code" | "diff" | "cloud";
  onSectionChange?: (section: "canvas" | "code" | "diff" | "cloud") => void;
  awsCredentials?: AwsCredentials;
  cloudProvider?: CloudProvider;
  credentialsConfigured?: boolean;
  awsConfigured?: boolean;
  onOpenAwsConfig?: () => void;
  onPlan?: () => void;
  onApply?: () => void;
  onDestroy?: () => void;
  isApplyConfirming?: boolean;
  isDestroyConfirming?: boolean;
  onConfirmApply?: () => void;
  onCancelApply?: () => void;
  onConfirmDestroy?: () => void;
  onCancelDestroy?: () => void;
  isDeploying?: boolean;
};

export default function Header({
  onClearCanvas,
  activeSection,
  onSectionChange,
  cloudProvider = "aws",
  credentialsConfigured,
  awsConfigured = false,
  onOpenAwsConfig,
  onPlan,
  onApply,
  onDestroy,
  isApplyConfirming = false,
  isDestroyConfirming = false,
  onConfirmApply,
  onCancelApply,
  onConfirmDestroy,
  onCancelDestroy,
  isDeploying = false,
}: HeaderProps) {
  const { t } = useTranslation();
  const isConfigured = credentialsConfigured ?? awsConfigured;
  const badge = PROVIDER_BADGE[cloudProvider];
  const sections: Array<"canvas" | "code" | "diff" | "cloud"> = ["canvas", "code", "diff", "cloud"];
  const sectionLabels: Record<string, string> = { canvas: "Canvas", code: "Code", diff: "Diff", cloud: "Cloud" };
  return (
    <header className="flex items-center justify-between gap-4 border-b border-slate-800 bg-slate-900 px-4 py-2.5">
      <div className="flex items-center gap-4 min-w-0">
        <div className="text-[17px] font-semibold tracking-tight text-slate-100 truncate">{t("header.workspace")}</div>
        <nav className="flex items-center gap-0.5 rounded-lg bg-slate-800/80 p-1 ring-1 ring-slate-700/60">
          {sections.map((section) => (
            <button
              key={section}
              type="button"
              onClick={() => onSectionChange?.(section)}
              className={`rounded-md px-4 py-1.5 text-[14px] font-medium transition-colors ${
                activeSection === section
                  ? "bg-slate-100 text-slate-900 shadow-sm"
                  : "text-slate-300 hover:bg-slate-700/70 hover:text-white"
              }`}
            >
              {sectionLabels[section]}
            </button>
          ))}
        </nav>
      </div>

      <nav className="flex items-center gap-2">
        <button
          type="button"
          onClick={onOpenAwsConfig}
          title={isConfigured ? t("header.credentials.configured", { provider: badge.label }) : t("header.credentials.configure", { provider: badge.label })}
          className={`flex items-center gap-2 rounded-lg px-3 py-1.5 text-[14px] font-medium border transition-colors ${
            isConfigured
              ? badge.configuredClass
              : "border-slate-700 text-slate-300 hover:bg-slate-800"
          }`}
        >
          <span
            className={`inline-block w-2 h-2 rounded-full ${isConfigured ? badge.dotConfiguredClass : "bg-slate-500"}`}
          />
          {badge.label}
        </button>

        <div className="h-5 w-px bg-slate-700/70" />

        <button
          type="button"
          onClick={onPlan}
          disabled={isDeploying || !isConfigured}
          title={!isConfigured ? t("header.configureFirst", { provider: badge.label }) : t("header.tooltip.plan")}
          className="rounded-lg px-3.5 py-1.5 text-[14px] font-medium border border-slate-700 text-slate-200 hover:bg-slate-800 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
        >
          {isDeploying ? "..." : "Plan"}
        </button>

        <button
          type="button"
          onClick={isApplyConfirming ? onConfirmApply : onApply}
          disabled={!isApplyConfirming && (isDeploying || !isConfigured)}
          title={
            isApplyConfirming
              ? t("header.tooltip.confirmApply")
              : !isConfigured
              ? t("header.configureFirst", { provider: badge.label })
              : t("header.tooltip.apply")
          }
          className={`rounded-lg px-3.5 py-1.5 text-[14px] font-medium border transition-colors ${
            isApplyConfirming
              ? "border-emerald-500 bg-emerald-500/10 text-emerald-300 hover:bg-emerald-500/20"
              : "border-slate-700 text-slate-200 hover:bg-slate-800 disabled:opacity-40 disabled:cursor-not-allowed"
          }`}
        >
          {isApplyConfirming ? t("header.btn.yes") : isDeploying ? t("header.btn.running") : "Apply"}
        </button>
        {isApplyConfirming && (
          <button
            type="button"
            onClick={onCancelApply}
            title={t("header.tooltip.cancelApply")}
            className="rounded-lg px-3.5 py-1.5 text-[14px] font-medium border border-slate-700 text-slate-300 hover:bg-slate-800 transition-colors"
          >
            {t("header.btn.no")}
          </button>
        )}

        <button
          type="button"
          onClick={isDestroyConfirming ? onConfirmDestroy : onDestroy}
          disabled={!isDestroyConfirming && (isDeploying || !isConfigured)}
          title={
            isDestroyConfirming
              ? t("header.tooltip.confirmDestroy")
              : !isConfigured
              ? t("header.configureFirst", { provider: badge.label })
              : t("header.tooltip.destroy")
          }
          className={`rounded-lg px-3.5 py-1.5 text-[14px] font-medium border transition-colors ${
            isDestroyConfirming
              ? "border-emerald-500 bg-emerald-500/10 text-emerald-300 hover:bg-emerald-500/20"
              : "border-red-500/60 text-red-300 hover:bg-red-500/15 disabled:opacity-40 disabled:cursor-not-allowed"
          }`}
        >
          {isDestroyConfirming ? t("header.btn.yes") : isDeploying ? t("header.btn.running") : "Destroy"}
        </button>
        {isDestroyConfirming && (
          <button
            type="button"
            onClick={onCancelDestroy}
            title={t("header.tooltip.cancelDestroy")}
            className="rounded-lg px-3.5 py-1.5 text-[14px] font-medium border border-slate-700 text-slate-300 hover:bg-slate-800 transition-colors"
          >
            {t("header.btn.no")}
          </button>
        )}

        <div className="h-5 w-px bg-slate-700/70" />

        <button
          type="button"
          onClick={onClearCanvas}
          className="rounded-lg bg-red-600 px-3.5 py-1.5 text-[14px] font-medium text-white hover:bg-red-500 transition-colors"
        >
          {t("header.clearCanvas")}
        </button>
      </nav>
    </header>
  );
}
