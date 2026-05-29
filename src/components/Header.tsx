import { useTranslation } from "react-i18next";
import type { AwsCredentials } from "../hooks/useAwsCredentials";

type CloudProvider = "aws" | "gcp" | "azure";

const PROVIDER_BADGE: Record<CloudProvider, { label: string; configuredClass: string; dotConfiguredClass: string }> = {
  aws: {
    label: "AWS",
    configuredClass: "border-orange-500 text-orange-300 hover:bg-orange-900/30",
    dotConfiguredClass: "bg-orange-400",
  },
  gcp: {
    label: "GCP",
    configuredClass: "border-blue-500 text-blue-300 hover:bg-blue-900/30",
    dotConfiguredClass: "bg-blue-400",
  },
  azure: {
    label: "Azure",
    configuredClass: "border-sky-500 text-sky-300 hover:bg-sky-900/30",
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
  return (
    <header className="bg-gray-800 text-white p-2 flex items-center justify-between">
      <div className="flex items-center gap-3">
        <div className="text-lg font-semibold">{t("header.workspace")}</div>
        <nav className="flex items-center gap-1 rounded bg-gray-700 p-1">
          <button
            type="button"
            onClick={() => onSectionChange?.("canvas")}
            className={`rounded px-3 py-1 text-sm font-medium ${
              activeSection === "canvas"
                ? "bg-white text-gray-800"
                : "text-gray-200 hover:bg-gray-600"
            }`}
          >
            Canvas
          </button>
          <button
            type="button"
            onClick={() => onSectionChange?.("code")}
            className={`rounded px-3 py-1 text-sm font-medium ${
              activeSection === "code"
                ? "bg-white text-gray-800"
                : "text-gray-200 hover:bg-gray-600"
            }`}
          >
            Code
          </button>
          <button
            type="button"
            onClick={() => onSectionChange?.("diff")}
            className={`rounded px-3 py-1 text-sm font-medium ${
              activeSection === "diff"
                ? "bg-white text-gray-800"
                : "text-gray-200 hover:bg-gray-600"
            }`}
          >
            Diff
          </button>
          <button
            type="button"
            onClick={() => onSectionChange?.("cloud")}
            className={`rounded px-3 py-1 text-sm font-medium ${
              activeSection === "cloud"
                ? "bg-white text-gray-800"
                : "text-gray-200 hover:bg-gray-600"
            }`}
          >
            Cloud
          </button>
        </nav>
      </div>

      <nav className="flex items-center gap-2">
        <button
          type="button"
          onClick={onOpenAwsConfig}
          title={isConfigured ? t("header.credentials.configured", { provider: badge.label }) : t("header.credentials.configure", { provider: badge.label })}
          className={`flex items-center gap-1.5 rounded px-3 py-1 text-sm font-medium border ${
            isConfigured
              ? badge.configuredClass
              : "border-gray-500 text-gray-300 hover:bg-gray-700"
          }`}
        >
          <span
            className={`inline-block w-2 h-2 rounded-full ${isConfigured ? badge.dotConfiguredClass : "bg-gray-500"}`}
          />
          {badge.label}
        </button>

        <button
          type="button"
          onClick={onPlan}
          disabled={isDeploying || !isConfigured}
          title={!isConfigured ? t("header.configureFirst", { provider: badge.label }) : t("header.tooltip.plan")}
          className="rounded px-3 py-1 text-sm font-medium border border-gray-500 text-gray-200 hover:bg-gray-700 disabled:opacity-40 disabled:cursor-not-allowed"
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
          className={`rounded px-3 py-1 text-sm font-medium border transition-colors ${
            isApplyConfirming
              ? "border-green-500 text-green-300 hover:bg-green-900/40"
              : "border-gray-500 text-gray-200 hover:bg-gray-700 disabled:opacity-40 disabled:cursor-not-allowed"
          }`}
        >
          {isApplyConfirming ? t("header.btn.yes") : isDeploying ? t("header.btn.running") : "Apply"}
        </button>
        {isApplyConfirming && (
          <button
            type="button"
            onClick={onCancelApply}
            title={t("header.tooltip.cancelApply")}
            className="rounded px-3 py-1 text-sm font-medium border border-gray-500 text-gray-300 hover:bg-gray-700"
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
          className={`rounded px-3 py-1 text-sm font-medium border transition-colors ${
            isDestroyConfirming
              ? "border-green-500 text-green-300 hover:bg-green-900/40"
              : "border-red-500 text-red-200 hover:bg-red-900/40 disabled:opacity-40 disabled:cursor-not-allowed"
          }`}
        >
          {isDestroyConfirming ? t("header.btn.yes") : isDeploying ? t("header.btn.running") : "Destroy"}
        </button>
        {isDestroyConfirming && (
          <button
            type="button"
            onClick={onCancelDestroy}
            title={t("header.tooltip.cancelDestroy")}
            className="rounded px-3 py-1 text-sm font-medium border border-gray-500 text-gray-300 hover:bg-gray-700"
          >
            {t("header.btn.no")}
          </button>
        )}

        <button
          type="button"
          onClick={onClearCanvas}
          className="rounded bg-red-600 px-3 py-1 text-sm font-medium text-white hover:bg-red-500"
        >
          {t("header.clearCanvas")}
        </button>
      </nav>
    </header>
  );
}
