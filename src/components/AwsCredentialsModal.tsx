import { useEffect, useState } from "react";
import { invoke } from "@tauri-apps/api/core";
import type {
  AwsStoredCredentials,
  AzureStoredCredentials,
  CloudProvider,
  CredentialMode,
  GcpStoredCredentials,
} from "../hooks/useAwsCredentials";

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

type AwsProfile = {
  name: string;
  region: string | null;
  hasCredentials: boolean;
};

type AwsEnvCredentials = {
  accessKeyId: string | null;
  secretAccessKey: string | null;
  sessionToken: string | null;
  region: string | null;
  isComplete: boolean;
};

type AwsPaths = {
  credentialsPath: string;
  credentialsExists: boolean;
  configPath: string;
  configExists: boolean;
  defaultCredentialsPath: string;
  defaultConfigPath: string;
};

type AwsEnvSource = {
  processCwd: string;
  envFilePath: string | null;
  envFileExists: boolean;
};

const GCP_REGIONS = [
  "europe-west1",
  "europe-west2",
  "europe-west3",
  "europe-west4",
  "europe-southwest1",
  "us-central1",
  "us-east1",
  "us-east4",
  "us-west1",
  "us-west2",
  "asia-east1",
  "asia-northeast1",
  "asia-southeast1",
];

const AZURE_REGIONS = [
  "westeurope",
  "northeurope",
  "uksouth",
  "ukwest",
  "francecentral",
  "germanywestcentral",
  "spaincentral",
  "eastus",
  "eastus2",
  "westus",
  "westus2",
  "centralus",
  "japaneast",
  "southeastasia",
];

type StoredAny = AwsStoredCredentials | GcpStoredCredentials | AzureStoredCredentials;

type Props = {
  provider?: CloudProvider;
  initial: StoredAny;
  onSave: (credentials: StoredAny) => void;
  onClose: () => void;
};

const PROVIDER_TITLE: Record<CloudProvider, string> = {
  aws: "Credenciales AWS",
  gcp: "Credenciales Google Cloud",
  azure: "Credenciales Microsoft Azure",
};

export default function AwsCredentialsModal({ provider = "aws", initial, onSave, onClose }: Props) {
  if (provider === "gcp") {
    return <GcpCredentialsForm initial={initial as GcpStoredCredentials} onSave={onSave as (c: GcpStoredCredentials) => void} onClose={onClose} />;
  }
  if (provider === "azure") {
    return <AzureCredentialsForm initial={initial as AzureStoredCredentials} onSave={onSave as (c: AzureStoredCredentials) => void} onClose={onClose} />;
  }
  return <AwsCredentialsForm initial={initial as AwsStoredCredentials} onSave={onSave as (c: AwsStoredCredentials) => void} onClose={onClose} />;
}

function AwsCredentialsForm({ initial, onSave, onClose }: { initial: AwsStoredCredentials; onSave: (c: AwsStoredCredentials) => void; onClose: () => void }) {
  const [activeTab, setActiveTab] = useState<CredentialMode>(initial.mode ?? "manual");

  // Manual tab state
  const [accessKeyId, setAccessKeyId] = useState(initial.accessKeyId ?? "");
  const [secretAccessKey, setSecretAccessKey] = useState(initial.secretAccessKey ?? "");
  const [sessionToken, setSessionToken] = useState(initial.sessionToken ?? "");
  const [region, setRegion] = useState(initial.region || "us-east-1");
  const [showSecret, setShowSecret] = useState(false);
  const [showSessionToken, setShowSessionToken] = useState(false);

  // Profile tab state
  const [profiles, setProfiles] = useState<AwsProfile[]>([]);
  const [profilesLoading, setProfilesLoading] = useState(false);
  const [profilesError, setProfilesError] = useState<string | null>(null);
  const [selectedProfile, setSelectedProfile] = useState(initial.profile ?? "");
  const [profileRegionOverride, setProfileRegionOverride] = useState(initial.profileRegion ?? "");
  const [credentialsPath, setCredentialsPath] = useState(initial.credentialsPath ?? "");
  const [configPath, setConfigPath] = useState(initial.configPath ?? "");
  const [paths, setPaths] = useState<AwsPaths | null>(null);
  const [credentialsPathExists, setCredentialsPathExists] = useState<boolean | null>(null);
  const [configPathExists, setConfigPathExists] = useState<boolean | null>(null);

  // Env tab state
  const [envCreds, setEnvCreds] = useState<AwsEnvCredentials | null>(null);
  const [envLoading, setEnvLoading] = useState(false);
  const [envError, setEnvError] = useState<string | null>(null);
  const [envRegion, setEnvRegion] = useState(initial.envRegion ?? "");
  const [envFilePath, setEnvFilePath] = useState(initial.envFilePath ?? "");
  const [envSource, setEnvSource] = useState<AwsEnvSource | null>(null);
  const [envFileExists, setEnvFileExists] = useState<boolean | null>(null);

  useEffect(() => {
    if (activeTab !== "profile") return;
    let cancelled = false;
    setProfilesLoading(true);
    setProfilesError(null);
    invoke<AwsPaths>("get_aws_paths")
      .then((p) => {
        if (!cancelled) setPaths(p);
      })
      .catch(() => { /* ignore */ });
    invoke<AwsProfile[]>("list_aws_profiles", {
      credentialsPath: credentialsPath.trim() || null,
      configPath: configPath.trim() || null,
    })
      .then((result) => {
        if (cancelled) return;
        setProfiles(result);
        if (!selectedProfile && result.length > 0) {
          const def = result.find((p) => p.name === "default");
          setSelectedProfile(def ? def.name : result[0].name);
        }
      })
      .catch((err) => {
        if (cancelled) return;
        setProfilesError(typeof err === "string" ? err : "No se pudieron leer los perfiles AWS.");
      })
      .finally(() => {
        if (!cancelled) setProfilesLoading(false);
      });
    return () => { cancelled = true; };
  }, [activeTab, credentialsPath, configPath]);

  useEffect(() => {
    if (activeTab !== "profile") return;
    const trimmed = credentialsPath.trim();
    if (!trimmed) { setCredentialsPathExists(null); return; }
    let cancelled = false;
    invoke<boolean>("check_aws_path_exists", { path: trimmed })
      .then((ok) => { if (!cancelled) setCredentialsPathExists(ok); })
      .catch(() => { if (!cancelled) setCredentialsPathExists(null); });
    return () => { cancelled = true; };
  }, [activeTab, credentialsPath]);

  useEffect(() => {
    if (activeTab !== "profile") return;
    const trimmed = configPath.trim();
    if (!trimmed) { setConfigPathExists(null); return; }
    let cancelled = false;
    invoke<boolean>("check_aws_path_exists", { path: trimmed })
      .then((ok) => { if (!cancelled) setConfigPathExists(ok); })
      .catch(() => { if (!cancelled) setConfigPathExists(null); });
    return () => { cancelled = true; };
  }, [activeTab, configPath]);

  useEffect(() => {
    if (activeTab !== "env") return;
    let cancelled = false;
    setEnvLoading(true);
    setEnvError(null);
    invoke<AwsEnvSource>("get_aws_env_source")
      .then((s) => { if (!cancelled) setEnvSource(s); })
      .catch(() => { /* ignore */ });
    invoke<AwsEnvCredentials>("get_aws_env_credentials", {
      envFile: envFilePath.trim() || null,
    })
      .then((result) => {
        if (cancelled) return;
        setEnvCreds(result);
      })
      .catch((err) => {
        if (cancelled) return;
        setEnvError(typeof err === "string" ? err : "No se pudieron leer las variables de entorno.");
      })
      .finally(() => {
        if (!cancelled) setEnvLoading(false);
      });
    return () => { cancelled = true; };
  }, [activeTab, envFilePath]);

  useEffect(() => {
    if (activeTab !== "env") return;
    const trimmed = envFilePath.trim();
    if (!trimmed) { setEnvFileExists(null); return; }
    let cancelled = false;
    invoke<boolean>("check_aws_path_exists", { path: trimmed })
      .then((ok) => { if (!cancelled) setEnvFileExists(ok); })
      .catch(() => { if (!cancelled) setEnvFileExists(null); });
    return () => { cancelled = true; };
  }, [activeTab, envFilePath]);

  const trimmedAccessKeyId = accessKeyId.trim();
  const trimmedSecretAccessKey = secretAccessKey.trim();
  const trimmedSessionToken = sessionToken.trim();
  const hasAccessKeyError = trimmedAccessKeyId.length > 0 && !/^A(KIA|SIA)[A-Z0-9]{16}$/.test(trimmedAccessKeyId);
  const hasSecretKeyError = trimmedSecretAccessKey.length > 0 && trimmedSecretAccessKey.length < 20;

  const canSaveManual =
    trimmedAccessKeyId.length > 0 &&
    trimmedSecretAccessKey.length > 0 &&
    !hasAccessKeyError &&
    !hasSecretKeyError;

  const canSaveProfile = selectedProfile.trim() !== "";
  const canSaveEnv = true;

  const canSave =
    activeTab === "manual" ? canSaveManual :
    activeTab === "profile" ? canSaveProfile :
    canSaveEnv;

  const handleSave = () => {
    if (!canSave) return;
    if (activeTab === "manual") {
      onSave({
        mode: "manual",
        accessKeyId: trimmedAccessKeyId,
        secretAccessKey: trimmedSecretAccessKey,
        sessionToken: trimmedSessionToken,
        region,
      });
    } else if (activeTab === "profile") {
      onSave({
        mode: "profile",
        profile: selectedProfile.trim(),
        profileRegion: profileRegionOverride.trim() || undefined,
        credentialsPath: credentialsPath.trim() || undefined,
        configPath: configPath.trim() || undefined,
      });
    } else {
      onSave({
        mode: "env",
        envRegion: envRegion.trim() || undefined,
        envFilePath: envFilePath.trim() || undefined,
      });
    }
    onClose();
  };

  const tabs: Array<{ id: CredentialMode; label: string }> = [
    { id: "manual", label: "Claves IAM" },
    { id: "profile", label: "Perfil AWS CLI" },
    { id: "env", label: "Variables de entorno" },
  ];

  const selectedProfileData = profiles.find((p) => p.name === selectedProfile);
  const profileNeedsRegion = !!selectedProfileData && !selectedProfileData.region && profileRegionOverride.trim() === "";

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/60"
      onClick={(e) => { if (e.target === e.currentTarget) onClose(); }}
    >
      <div className="bg-gray-900 border border-gray-700 rounded-lg shadow-2xl w-[460px] p-6 flex flex-col gap-5">
        <div className="flex items-center justify-between">
          <h2 className="text-white text-base font-semibold">{PROVIDER_TITLE.aws}</h2>
          <button
            type="button"
            onClick={onClose}
            className="text-gray-400 hover:text-white text-xl leading-none"
          >
            ×
          </button>
        </div>

        <div className="flex gap-1 rounded bg-gray-800/60 p-1">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              type="button"
              onClick={() => setActiveTab(tab.id)}
              className={`flex-1 rounded px-2 py-1.5 text-xs font-medium transition-colors ${
                activeTab === tab.id
                  ? "bg-gray-700 text-white"
                  : "text-gray-400 hover:text-white"
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {activeTab === "manual" && (
          <div className="flex flex-col gap-4">
            <div className="rounded border border-gray-700 bg-gray-800/60 p-3 text-xs text-gray-300">
              <p>Se guardan solo en tu equipo (localStorage).</p>
              <ol className="mt-2 list-decimal pl-4 text-gray-400 space-y-1">
                <li>Crea un usuario IAM con permisos para Terraform.</li>
                <li>Genera Access Key + Secret o usa STS.</li>
                <li>Si usas STS/MFA, pega también el Session Token.</li>
              </ol>
            </div>

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
                className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-black text-sm focus:outline-none focus:border-blue-500"
              >
                {AWS_REGIONS.map((r) => (
                  <option key={r} value={r} style={{ backgroundColor: '#1f2937', color: '#000' }}>{r}</option>
                ))}
              </select>
            </div>
          </div>
        )}

        {activeTab === "profile" && (
          <div className="flex flex-col gap-4">
            <div className="rounded border border-gray-700 bg-gray-800/60 p-3 text-xs text-gray-300">
              <p>Usa un perfil definido en tu archivo de credenciales AWS CLI.</p>
              <p className="mt-1 text-gray-400">Crea perfiles con <code className="text-gray-200">aws configure --profile NOMBRE</code>.</p>
            </div>

            <div className="flex flex-col gap-2 rounded border border-gray-700 bg-gray-800/40 p-3">
              <div className="flex flex-col gap-1">
                <label className="text-gray-300 text-[11px] font-medium">Archivo de credenciales</label>
                <input
                  type="text"
                  value={credentialsPath}
                  onChange={(e) => setCredentialsPath(e.target.value)}
                  placeholder={paths?.defaultCredentialsPath ?? "~/.aws/credentials"}
                  className="bg-gray-800 border border-gray-600 rounded px-2 py-1.5 text-white text-[11px] font-mono placeholder-gray-500 focus:outline-none focus:border-blue-500"
                  spellCheck={false}
                />
                <span className="text-[10px] text-gray-500">
                  {credentialsPath.trim()
                    ? (credentialsPathExists === false ? <span className="text-amber-300">⚠ El archivo no existe</span> : credentialsPathExists ? <span className="text-emerald-400">✓ Existe</span> : "")
                    : <>Por defecto: <code>{paths?.credentialsPath ?? "~/.aws/credentials"}</code> {paths?.credentialsExists === false && <span className="text-amber-300">(no existe)</span>}</>
                  }
                </span>
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-gray-300 text-[11px] font-medium">Archivo de configuración</label>
                <input
                  type="text"
                  value={configPath}
                  onChange={(e) => setConfigPath(e.target.value)}
                  placeholder={paths?.defaultConfigPath ?? "~/.aws/config"}
                  className="bg-gray-800 border border-gray-600 rounded px-2 py-1.5 text-white text-[11px] font-mono placeholder-gray-500 focus:outline-none focus:border-blue-500"
                  spellCheck={false}
                />
                <span className="text-[10px] text-gray-500">
                  {configPath.trim()
                    ? (configPathExists === false ? <span className="text-amber-300">⚠ El archivo no existe</span> : configPathExists ? <span className="text-emerald-400">✓ Existe</span> : "")
                    : <>Por defecto: <code>{paths?.configPath ?? "~/.aws/config"}</code> {paths?.configExists === false && <span className="text-amber-300">(no existe)</span>}</>
                  }
                </span>
              </div>
            </div>

            {profilesLoading && (
              <div className="text-xs text-gray-400">Cargando perfiles…</div>
            )}
            {profilesError && (
              <div className="rounded border border-red-700 bg-red-900/30 p-2 text-[11px] text-red-300">{profilesError}</div>
            )}
            {!profilesLoading && !profilesError && profiles.length === 0 && (
              <div className="rounded border border-amber-700 bg-amber-900/20 p-2 text-[11px] text-amber-200">
                No se encontraron perfiles en el archivo de credenciales. Ejecuta <code>aws configure</code> o cambia el path arriba.
              </div>
            )}

            {profiles.length > 0 && (
              <div className="flex flex-col gap-1">
                <label className="text-gray-300 text-xs font-medium">Perfil</label>
                <select
                  value={selectedProfile}
                  onChange={(e) => setSelectedProfile(e.target.value)}
                  className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-black text-sm focus:outline-none focus:border-blue-500"
                >
                  <option value="" style={{ backgroundColor: '#1f2937', color: '#000' }}>— Selecciona un perfil —</option>
                  {profiles.map((p) => (
                    <option key={p.name} value={p.name} style={{ backgroundColor: '#1f2937', color: '#000' }}>
                      {p.name}{p.region ? ` (${p.region})` : " (sin región)"}
                    </option>
                  ))}
                </select>
              </div>
            )}

            <div className="flex flex-col gap-1">
              <label className="text-gray-300 text-xs font-medium">Región (opcional, sobrescribe la del perfil)</label>
              <select
                value={profileRegionOverride}
                onChange={(e) => setProfileRegionOverride(e.target.value)}
                className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-black text-sm focus:outline-none focus:border-blue-500"
              >
                <option value="" style={{ backgroundColor: '#1f2937', color: '#000' }}>— Usar la del perfil —</option>
                {AWS_REGIONS.map((r) => (
                  <option key={r} value={r} style={{ backgroundColor: '#1f2937', color: '#000' }}>{r}</option>
                ))}
              </select>
              {profileNeedsRegion && (
                <span className="text-[11px] text-amber-300">
                  Este perfil no tiene región configurada. Selecciona una arriba o se usará us-east-1 por defecto.
                </span>
              )}
            </div>
          </div>
        )}

        {activeTab === "env" && (
          <div className="flex flex-col gap-4">
            <div className="rounded border border-gray-700 bg-gray-800/60 p-3 text-xs text-gray-300">
              <p>Usa las variables AWS_* del proceso de la app o de un archivo <code className="text-gray-200">.env</code>.</p>
              <p className="mt-1 text-gray-400">
                Nota: en macOS/Linux las apps lanzadas desde el icono pueden no heredar las variables de la shell. Si
                faltan, lanza la app desde la terminal o usa un archivo .env.
              </p>
            </div>

            <div className="flex flex-col gap-2 rounded border border-gray-700 bg-gray-800/40 p-3">
              <div className="flex flex-col gap-0.5 text-[11px]">
                <span className="text-gray-400">Directorio del proceso (cwd):</span>
                <code className="text-gray-200 break-all">{envSource?.processCwd ?? "(cargando…)"}</code>
              </div>
              <div className="flex flex-col gap-1 mt-1">
                <label className="text-gray-300 text-[11px] font-medium">Archivo .env (opcional)</label>
                <input
                  type="text"
                  value={envFilePath}
                  onChange={(e) => setEnvFilePath(e.target.value)}
                  placeholder="/ruta/a/.env  — leído antes que las env vars del proceso"
                  className="bg-gray-800 border border-gray-600 rounded px-2 py-1.5 text-white text-[11px] font-mono placeholder-gray-500 focus:outline-none focus:border-blue-500"
                  spellCheck={false}
                />
                <span className="text-[10px] text-gray-500">
                  {envFilePath.trim()
                    ? (envFileExists === false ? <span className="text-amber-300">⚠ El archivo no existe</span> : envFileExists ? <span className="text-emerald-400">✓ Existe — los valores del archivo tienen prioridad</span> : "")
                    : "Si está vacío, se usan solo las variables del proceso."
                  }
                </span>
              </div>
            </div>

            {envLoading && <div className="text-xs text-gray-400">Leyendo entorno…</div>}
            {envError && (
              <div className="rounded border border-red-700 bg-red-900/30 p-2 text-[11px] text-red-300">{envError}</div>
            )}

            {envCreds && (
              <div className="flex flex-col gap-2 rounded border border-gray-700 bg-gray-800/40 p-3 text-xs font-mono">
                <EnvRow name="AWS_ACCESS_KEY_ID" value={envCreds.accessKeyId} />
                <EnvRow name="AWS_SECRET_ACCESS_KEY" value={envCreds.secretAccessKey} />
                <EnvRow name="AWS_SESSION_TOKEN" value={envCreds.sessionToken} />
                <EnvRow name="AWS_DEFAULT_REGION / AWS_REGION" value={envCreds.region} />
              </div>
            )}

            {envCreds && !envCreds.isComplete && (
              <div className="rounded border border-amber-700 bg-amber-900/20 p-2 text-[11px] text-amber-200">
                Faltan variables AWS_* obligatorias. Terraform fallará con error de autenticación.
              </div>
            )}

            <div className="flex flex-col gap-1">
              <label className="text-gray-300 text-xs font-medium">Región (opcional, sobrescribe AWS_DEFAULT_REGION)</label>
              <select
                value={envRegion}
                onChange={(e) => setEnvRegion(e.target.value)}
                className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-black text-sm focus:outline-none focus:border-blue-500"
              >
                <option value="" style={{ backgroundColor: '#1f2937', color: '#000' }}>— Usar la del entorno —</option>
                {AWS_REGIONS.map((r) => (
                  <option key={r} value={r} style={{ backgroundColor: '#1f2937', color: '#000' }}>{r}</option>
                ))}
              </select>
            </div>
          </div>
        )}

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

function EnvRow({ name, value }: { name: string; value: string | null }) {
  return (
    <div className="flex items-center justify-between gap-2">
      <span className="text-gray-400">{name}</span>
      <span className={value ? "text-emerald-300" : "text-gray-500"}>
        {value ?? "no establecida"}
      </span>
    </div>
  );
}

function ModalShell({ title, accent, onClose, children, canSave, onSave }: {
  title: string;
  accent: "blue" | "sky";
  onClose: () => void;
  children: React.ReactNode;
  canSave: boolean;
  onSave: () => void;
}) {
  const saveBtnClass = accent === "blue"
    ? "bg-blue-600 hover:bg-blue-500"
    : "bg-sky-600 hover:bg-sky-500";
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/60"
      onClick={(e) => { if (e.target === e.currentTarget) onClose(); }}
    >
      <div className="bg-gray-900 border border-gray-700 rounded-lg shadow-2xl w-[460px] p-6 flex flex-col gap-5">
        <div className="flex items-center justify-between">
          <h2 className="text-white text-base font-semibold">{title}</h2>
          <button
            type="button"
            onClick={onClose}
            className="text-gray-400 hover:text-white text-xl leading-none"
          >
            ×
          </button>
        </div>
        {children}
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
            onClick={onSave}
            disabled={!canSave}
            className={`px-4 py-1.5 rounded text-sm text-white disabled:opacity-40 disabled:cursor-not-allowed font-medium ${saveBtnClass}`}
          >
            Guardar
          </button>
        </div>
      </div>
    </div>
  );
}

function GcpCredentialsForm({ initial, onSave, onClose }: { initial: GcpStoredCredentials; onSave: (c: GcpStoredCredentials) => void; onClose: () => void }) {
  const [serviceAccountJson, setServiceAccountJson] = useState(initial.serviceAccountJson ?? "");
  const [serviceAccountFilePath, setServiceAccountFilePath] = useState(initial.serviceAccountFilePath ?? "");
  const [projectId, setProjectId] = useState(initial.projectId ?? "");
  const [region, setRegion] = useState(initial.region || "europe-west1");
  const [showJson, setShowJson] = useState(false);

  const trimmedJson = serviceAccountJson.trim();
  const trimmedPath = serviceAccountFilePath.trim();
  const trimmedProject = projectId.trim();

  let jsonError: string | null = null;
  if (trimmedJson) {
    try {
      const parsed = JSON.parse(trimmedJson);
      if (typeof parsed !== "object" || parsed === null || !("client_email" in parsed) || !("private_key" in parsed)) {
        jsonError = "El JSON no parece una service account válida (faltan client_email/private_key).";
      }
    } catch {
      jsonError = "JSON inválido.";
    }
  }

  const canSave = trimmedProject !== "" && (trimmedJson !== "" || trimmedPath !== "") && !jsonError;

  const handleSave = () => {
    if (!canSave) return;
    onSave({
      mode: "manual",
      serviceAccountJson: trimmedJson || undefined,
      serviceAccountFilePath: trimmedPath || undefined,
      projectId: trimmedProject,
      region,
    });
    onClose();
  };

  return (
    <ModalShell title={PROVIDER_TITLE.gcp} accent="blue" onClose={onClose} onSave={handleSave} canSave={canSave}>
      <div className="rounded border border-gray-700 bg-gray-800/60 p-3 text-xs text-gray-300">
        <p>Se guardan solo en tu equipo (localStorage).</p>
        <ol className="mt-2 list-decimal pl-4 text-gray-400 space-y-1">
          <li>Crea una Service Account en IAM con permisos para Terraform.</li>
          <li>Descarga su clave en formato JSON.</li>
          <li>Pega el contenido del JSON o indica la ruta al archivo.</li>
        </ol>
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Project ID</label>
        <input
          type="text"
          value={projectId}
          onChange={(e) => setProjectId(e.target.value)}
          placeholder="my-gcp-project-123456"
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-blue-500"
          autoComplete="off"
          spellCheck={false}
        />
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Ruta a service account JSON (opcional)</label>
        <input
          type="text"
          value={serviceAccountFilePath}
          onChange={(e) => setServiceAccountFilePath(e.target.value)}
          placeholder="/ruta/a/service-account.json"
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-xs font-mono placeholder-gray-500 focus:outline-none focus:border-blue-500"
          spellCheck={false}
        />
        <span className="text-[10px] text-gray-500">Si pegas el JSON abajo, no necesitas ruta.</span>
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Service Account JSON</label>
        <div className="relative">
          <textarea
            value={showJson ? serviceAccountJson : serviceAccountJson ? "•".repeat(Math.min(serviceAccountJson.length, 200)) : ""}
            onChange={(e) => { if (showJson) setServiceAccountJson(e.target.value); }}
            placeholder='{"type":"service_account","project_id":"...","private_key":"-----BEGIN..."}'
            rows={5}
            className="bg-gray-800 border border-gray-600 rounded px-3 py-2 pr-12 text-white text-[11px] font-mono placeholder-gray-500 focus:outline-none focus:border-blue-500 w-full resize-none"
            spellCheck={false}
            readOnly={!showJson}
          />
          <button
            type="button"
            onClick={() => setShowJson((v) => !v)}
            className="absolute right-2 top-2 text-gray-400 hover:text-white text-xs"
          >
            {showJson ? "ocultar" : "ver/editar"}
          </button>
        </div>
        {jsonError && <span className="text-[11px] text-amber-300">{jsonError}</span>}
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Region</label>
        <select
          value={region}
          onChange={(e) => setRegion(e.target.value)}
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-black text-sm focus:outline-none focus:border-blue-500"
        >
          {GCP_REGIONS.map((r) => (
            <option key={r} value={r} style={{ backgroundColor: '#1f2937', color: '#000' }}>{r}</option>
          ))}
        </select>
      </div>
    </ModalShell>
  );
}

function AzureCredentialsForm({ initial, onSave, onClose }: { initial: AzureStoredCredentials; onSave: (c: AzureStoredCredentials) => void; onClose: () => void }) {
  const [subscriptionId, setSubscriptionId] = useState(initial.subscriptionId ?? "");
  const [tenantId, setTenantId] = useState(initial.tenantId ?? "");
  const [clientId, setClientId] = useState(initial.clientId ?? "");
  const [clientSecret, setClientSecret] = useState(initial.clientSecret ?? "");
  const [region, setRegion] = useState(initial.region || "westeurope");
  const [showSecret, setShowSecret] = useState(false);

  const uuidRe = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  const subError = subscriptionId.trim() && !uuidRe.test(subscriptionId.trim()) ? "Debe ser un UUID." : null;
  const tenantError = tenantId.trim() && !uuidRe.test(tenantId.trim()) ? "Debe ser un UUID." : null;
  const clientError = clientId.trim() && !uuidRe.test(clientId.trim()) ? "Debe ser un UUID." : null;

  const canSave =
    subscriptionId.trim() !== "" && !subError &&
    tenantId.trim() !== "" && !tenantError &&
    clientId.trim() !== "" && !clientError &&
    clientSecret.trim() !== "";

  const handleSave = () => {
    if (!canSave) return;
    onSave({
      mode: "manual",
      subscriptionId: subscriptionId.trim(),
      tenantId: tenantId.trim(),
      clientId: clientId.trim(),
      clientSecret: clientSecret.trim(),
      region,
    });
    onClose();
  };

  return (
    <ModalShell title={PROVIDER_TITLE.azure} accent="sky" onClose={onClose} onSave={handleSave} canSave={canSave}>
      <div className="rounded border border-gray-700 bg-gray-800/60 p-3 text-xs text-gray-300">
        <p>Se guardan solo en tu equipo (localStorage).</p>
        <ol className="mt-2 list-decimal pl-4 text-gray-400 space-y-1">
          <li>Crea un Service Principal en Azure AD.</li>
          <li>Asigna roles sobre la Subscription que vas a desplegar.</li>
          <li>Copia subscription/tenant/client ID + secret.</li>
        </ol>
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Subscription ID</label>
        <input
          type="text"
          value={subscriptionId}
          onChange={(e) => setSubscriptionId(e.target.value)}
          placeholder="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-sky-500 font-mono"
          spellCheck={false}
        />
        {subError && <span className="text-[11px] text-amber-300">{subError}</span>}
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Tenant ID</label>
        <input
          type="text"
          value={tenantId}
          onChange={(e) => setTenantId(e.target.value)}
          placeholder="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-sky-500 font-mono"
          spellCheck={false}
        />
        {tenantError && <span className="text-[11px] text-amber-300">{tenantError}</span>}
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Client ID</label>
        <input
          type="text"
          value={clientId}
          onChange={(e) => setClientId(e.target.value)}
          placeholder="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-sky-500 font-mono"
          spellCheck={false}
        />
        {clientError && <span className="text-[11px] text-amber-300">{clientError}</span>}
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Client Secret</label>
        <div className="relative">
          <input
            type={showSecret ? "text" : "password"}
            value={clientSecret}
            onChange={(e) => setClientSecret(e.target.value)}
            placeholder="•••••••"
            className="bg-gray-800 border border-gray-600 rounded px-3 py-2 pr-10 text-white text-sm placeholder-gray-500 focus:outline-none focus:border-sky-500 w-full"
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
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-gray-300 text-xs font-medium">Region</label>
        <select
          value={region}
          onChange={(e) => setRegion(e.target.value)}
          className="bg-gray-800 border border-gray-600 rounded px-3 py-2 text-black text-sm focus:outline-none focus:border-sky-500"
        >
          {AZURE_REGIONS.map((r) => (
            <option key={r} value={r} style={{ backgroundColor: '#1f2937', color: '#000' }}>{r}</option>
          ))}
        </select>
      </div>
    </ModalShell>
  );
}
