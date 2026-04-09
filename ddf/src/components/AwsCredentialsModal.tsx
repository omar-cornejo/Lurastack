import { useState } from "react";
import type { AwsCredentials } from "../hooks/useAwsCredentials";

const AWS_REGIONS = [
  "us-east-1",
  "us-east-2",
  "us-west-1",
  "us-west-2",
  "eu-west-1",
  "eu-west-2",
  "eu-west-3",
  "eu-south-2",
  "eu-central-1",
  "eu-north-1",
  "ap-southeast-1",
  "ap-southeast-2",
  "ap-northeast-1",
  "ap-northeast-2",
  "ap-south-1",
  "sa-east-1",
  "ca-central-1",
];

type Props = {
  initial: AwsCredentials;
  onSave: (credentials: AwsCredentials) => void;
  onClose: () => void;
};

export default function AwsCredentialsModal({ initial, onSave, onClose }: Props) {
  const [accessKeyId, setAccessKeyId] = useState(initial.accessKeyId);
  const [secretAccessKey, setSecretAccessKey] = useState(initial.secretAccessKey);
  const [sessionToken, setSessionToken] = useState(initial.sessionToken ?? "");
  const [region, setRegion] = useState(initial.region || "us-east-1");
  const [showSecret, setShowSecret] = useState(false);
  const [showSessionToken, setShowSessionToken] = useState(false);

  const trimmedAccessKeyId = accessKeyId.trim();
  const trimmedSecretAccessKey = secretAccessKey.trim();
  const trimmedSessionToken = sessionToken.trim();
  const hasAccessKeyError = trimmedAccessKeyId.length > 0 && !/^A(KIA|SIA)[A-Z0-9]{16}$/.test(trimmedAccessKeyId);
  const hasSecretKeyError = trimmedSecretAccessKey.length > 0 && trimmedSecretAccessKey.length < 20;
  const canSave =
    trimmedAccessKeyId.length > 0 &&
    trimmedSecretAccessKey.length > 0 &&
    !hasAccessKeyError &&
    !hasSecretKeyError;

  const handleSave = () => {
    if (!canSave) return;
    onSave({
      accessKeyId: trimmedAccessKeyId,
      secretAccessKey: trimmedSecretAccessKey,
      sessionToken: trimmedSessionToken,
      region,
    });
    onClose();
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/60"
      onClick={(e) => { if (e.target === e.currentTarget) onClose(); }}
    >
      <div className="bg-gray-900 border border-gray-700 rounded-lg shadow-2xl w-[420px] p-6 flex flex-col gap-5">
        <div className="flex items-center justify-between">
          <h2 className="text-white text-base font-semibold">Credenciales AWS</h2>
          <button
            type="button"
            onClick={onClose}
            className="text-gray-400 hover:text-white text-xl leading-none"
          >
            ×
          </button>
        </div>

        <div className="rounded border border-gray-700 bg-gray-800/60 p-3 text-xs text-gray-300">
          <p>
            Se guardan solo en tu equipo (localStorage) y se usan para ejecutar Terraform desde esta app.
          </p>
          <ol className="mt-2 list-decimal pl-4 text-gray-400 space-y-1">
            <li>Crea un usuario IAM con permisos para Terraform (idealmente mínimos).</li>
            <li>Genera Access Key + Secret Access Key o usa credenciales temporales de STS.</li>
            <li>Si usas STS/MFA, pega también el Session Token.</li>
          </ol>
        </div>

        <div className="flex flex-col gap-4">
          <div className="flex flex-col gap-1">
            <label className="text-gray-300 text-xs font-medium">AWS Access Key ID</label>
            <input
              type="text"
              value={accessKeyId}
              onChange={(e) => setAccessKeyId(e.target.value)}
              placeholder="AKIAIOSFODNN7EXAMPLE"
              className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-blue-500"
              autoComplete="off"
              spellCheck={false}
            />
            {hasAccessKeyError && (
              <span className="text-[11px] text-amber-300">Formato esperado: AKIA/ASIA + 16 caracteres.</span>
            )}
          </div>

          <div className="flex flex-col gap-1">
            <label className="text-gray-300 text-xs font-medium">AWS Secret Access Key</label>
            <div className="relative">
              <input
                type={showSecret ? "text" : "password"}
                value={secretAccessKey}
                onChange={(e) => setSecretAccessKey(e.target.value)}
                placeholder="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
                className="bg-gray-800 border border-gray-600 rounded px-3 py-2 pr-10 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-blue-500 w-full"
                autoComplete="off"
                spellCheck={false}
              />
              <button
                type="button"
                onClick={() => setShowSecret((v) => !v)}
                className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 hover:text-white text-xs"
              >
                {showSecret ? "ocultar" : "ver"}
              </button>
            </div>
            {hasSecretKeyError && (
              <span className="text-[11px] text-amber-300">La Secret Access Key parece incompleta.</span>
            )}
          </div>

          <div className="flex flex-col gap-1">
            <label className="text-gray-300 text-xs font-medium">AWS Session Token (opcional)</label>
            <div className="relative">
              <input
                type={showSessionToken ? "text" : "password"}
                value={sessionToken}
                onChange={(e) => setSessionToken(e.target.value)}
                placeholder="IQoJb3JpZ2luX2VjEOz//////////wEaCXVzLWVhc3QtMSJHMEUC..."
                className="bg-gray-800 border border-gray-600 rounded px-3 py-2 pr-10 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-blue-500 w-full"
                autoComplete="off"
                spellCheck={false}
              />
              <button
                type="button"
                onClick={() => setShowSessionToken((v) => !v)}
                className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 hover:text-white text-xs"
              >
                {showSessionToken ? "ocultar" : "ver"}
              </button>
            </div>
            <span className="text-[11px] text-gray-500">Requerido cuando usas credenciales temporales (STS/MFA).</span>
          </div>

          <div className="flex flex-col gap-1">
            <label className="text-gray-300 text-xs font-medium">Region</label>
            <select
              value={region}
              onChange={(e) => setRegion(e.target.value)}
              className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-sm focus:outline-none focus:border-blue-500"
            >
              {AWS_REGIONS.map((r) => (
                <option key={r} value={r}>{r}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex justify-end gap-2 pt-1">
          <button
            type="button"
            onClick={onClose}
            className="px-4 py-1.5 rounded text-sm text-gray-300 hover:text-white hover:bg-gray-700"
          >
            Cancelar
          </button>
          <button
            type="button"
            onClick={handleSave}
            disabled={!canSave}
            className="px-4 py-1.5 rounded text-sm bg-orange-600 text-white hover:bg-orange-500 disabled:opacity-40 disabled:cursor-not-allowed font-medium"
          >
            Guardar
          </button>
        </div>
      </div>
    </div>
  );
}
