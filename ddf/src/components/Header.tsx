import type { AwsCredentials } from "../hooks/useAwsCredentials";

type HeaderProps = {
  onClearCanvas: () => void;
  activeSection: "canvas" | "code" | "diff";
  onSectionChange?: (section: "canvas" | "code" | "diff") => void;
  awsCredentials?: AwsCredentials;
  awsConfigured?: boolean;
  onOpenAwsConfig?: () => void;
  onPlan?: () => void;
  onApply?: () => void;
  isDeploying?: boolean;
};

export default function Header({
  onClearCanvas,
  activeSection,
  onSectionChange,
  awsConfigured = false,
  onOpenAwsConfig,
  onPlan,
  onApply,
  isDeploying = false,
}: HeaderProps) {
  return (
    <header className="bg-gray-800 text-white p-2 flex items-center justify-between">
      <div className="flex items-center gap-3">
        <div className="text-lg font-semibold">Workspace</div>
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
        </nav>
      </div>

      <nav className="flex items-center gap-2">
        {/* AWS credentials button */}
        <button
          type="button"
          onClick={onOpenAwsConfig}
          title={awsConfigured ? "Credenciales AWS configuradas" : "Configurar credenciales AWS"}
          className={`flex items-center gap-1.5 rounded px-3 py-1 text-sm font-medium border ${
            awsConfigured
              ? "border-orange-500 text-orange-300 hover:bg-orange-900/30"
              : "border-gray-500 text-gray-300 hover:bg-gray-700"
          }`}
        >
          <span
            className={`inline-block w-2 h-2 rounded-full ${awsConfigured ? "bg-orange-400" : "bg-gray-500"}`}
          />
          AWS
        </button>

        {/* Plan button */}
        <button
          type="button"
          onClick={onPlan}
          disabled={isDeploying || !awsConfigured}
          title={!awsConfigured ? "Configura las credenciales AWS primero" : "Ejecutar terraform plan"}
          className="rounded px-3 py-1 text-sm font-medium border border-gray-500 text-gray-200 hover:bg-gray-700 disabled:opacity-40 disabled:cursor-not-allowed"
        >
          {isDeploying ? "..." : "Plan"}
        </button>

        {/* Apply button */}
        <button
          type="button"
          onClick={onApply}
          disabled={isDeploying || !awsConfigured}
          title={!awsConfigured ? "Configura las credenciales AWS primero" : "Ejecutar terraform apply"}
          className="rounded px-3 py-1 text-sm font-medium border border-gray-500 text-gray-200 hover:bg-gray-700 disabled:opacity-40 disabled:cursor-not-allowed"
        >
          {isDeploying ? "Ejecutando..." : "Apply"}
        </button>

        <button
          type="button"
          onClick={onClearCanvas}
          className="rounded bg-red-600 px-3 py-1 text-sm font-medium text-white hover:bg-red-500"
        >
          Borrar canvas
        </button>
      </nav>
    </header>
  );
}
