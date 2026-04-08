import { useEffect, useMemo, useRef, useState } from "react";
import { invoke } from "@tauri-apps/api/core";
import { readDir, readTextFile } from "@tauri-apps/plugin-fs";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/testNodes";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";
import type { DdfCodeFile } from "../types/project";
import type { BottomPanelLogEntry, BottomPanelLogLevel } from "../types/logs";

type CodePanelProps = {
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  cloudProvider: "aws";
  region: string;
  projectDir?: string;
  initialCustomFiles?: DdfCodeFile[];
  onCustomFilesChange?: (files: DdfCodeFile[]) => void;
  onUpdateAttribute: (resourceId: string, attribute: string, value: unknown) => void;
  onValidationLogs?: (entries: BottomPanelLogEntry[]) => void;
  onOpenLogsPanel?: () => void;
};

type TerraformValidationDiagnostic = {
  severity: string;
  summary: string;
  detail: string;
  filename?: string;
  startLine?: number;
  startColumn?: number;
  endLine?: number;
  endColumn?: number;
};

type TerraformValidationResult = {
  ok: boolean;
  diagnostics: TerraformValidationDiagnostic[];
  initRan: boolean;
};

type TerraformSourceFile = {
  name: string;
  content: string;
};

const TERRAFORM_REF_PATTERN = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;

const parseHclInputToAttribute = (input: string): unknown => {
  const trimmed = input.trim();
  if (!trimmed) return "";
  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(trimmed)) return Number(trimmed);
  if (trimmed.startsWith('"') && trimmed.endsWith('"')) {
    return trimmed.slice(1, -1);
  }
  return trimmed;
};

const toEditableLiteral = (value: unknown): string => {
  if (typeof value === "boolean" || typeof value === "number") {
    return String(value);
  }

  if (typeof value === "string") {
    const trimmed = value.trim();
    if (TERRAFORM_REF_PATTERN.test(trimmed) || trimmed.startsWith("var.")) {
      return trimmed;
    }
    return `"${trimmed.replace(/"/g, '\\"')}"`;
  }

  if (value === null || value === undefined) {
    return '""';
  }

  return `"${String(value).replace(/"/g, '\\"')}"`;
};

const tokenKeyword = "text-[#c586c0]";
const tokenProperty = "text-[#9cdcfe]";
const tokenString = "text-[#ce9178]";
const tokenPunctuation = "text-[#d4d4d4]";

const basename = (input?: string) => {
  if (!input) return undefined;
  const normalized = input.replace(/\\/g, "/");
  const parts = normalized.split("/");
  return parts[parts.length - 1];
};

export default function CodePanel({
  resources,
  schemas,
  cloudProvider,
  region: _region,
  projectDir,
  initialCustomFiles,
  onCustomFilesChange,
  onUpdateAttribute,
  onValidationLogs,
  onOpenLogsPanel,
}: CodePanelProps) {
  const [activeFileId, setActiveFileId] = useState<string>("main.tf");
  const [customFiles, setCustomFiles] = useState<DdfCodeFile[]>(initialCustomFiles ?? []);
  const [newFileName, setNewFileName] = useState("");
  const [isValidatingTerraform, setIsValidatingTerraform] = useState(false);
  const [validationDiagnostics, setValidationDiagnostics] = useState<TerraformValidationDiagnostic[]>([]);
  const [validationWasSuccessful, setValidationWasSuccessful] = useState<boolean | null>(null);
  const [validationError, setValidationError] = useState<string | null>(null);
  const codeEditorRef = useRef<HTMLTextAreaElement | null>(null);
  const lineGutterRef = useRef<HTMLDivElement | null>(null);

  const isTauriRuntime =
    typeof window !== "undefined" &&
    !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

  useEffect(() => {
    if (!onCustomFilesChange) return;
    onCustomFilesChange(customFiles);
  }, [customFiles, onCustomFilesChange]);

  useEffect(() => {
    if (!isTauriRuntime || !projectDir) return;

    let cancelled = false;

    const loadCustomFiles = async () => {
      try {
        const entries = await readDir(projectDir);
        const tfFileNames = entries
          .filter((entry) => entry.isFile && typeof entry.name === "string")
          .map((entry) => entry.name as string)
          .filter((name) => name.toLowerCase().endsWith(".tf") && name.toLowerCase() !== "main.tf")
          .sort((a, b) => a.localeCompare(b));

        const loadedFiles = await Promise.all(
          tfFileNames.map(async (name) => ({
            id: name,
            name,
            content: await readTextFile(`${projectDir}/${name}`),
          })),
        );

        if (!cancelled) {
          setCustomFiles(loadedFiles.length > 0 ? loadedFiles : (initialCustomFiles ?? []));
          setActiveFileId((current) => {
            if (current === "main.tf") return current;
            const visible = loadedFiles.length > 0 ? loadedFiles : (initialCustomFiles ?? []);
            return visible.some((file) => file.id === current) ? current : "main.tf";
          });
        }
      } catch {
        if (!cancelled) setCustomFiles(initialCustomFiles ?? []);
      }
    };

    void loadCustomFiles();

    return () => {
      cancelled = true;
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isTauriRuntime, projectDir]);

  const resourcesWithSchemas = useMemo(
    () =>
      resources.map((resource) => ({
        resource,
        schema: schemas.find((schema) => schema.id === resource.schemaId),
      })),
    [resources, schemas],
  );

  const staticFiles = useMemo(
    () => [{ id: "main.tf", name: "main.tf", deletable: false }],
    [],
  );

  const visibleFiles = useMemo(
    () => [
      ...staticFiles,
      ...customFiles.map((file) => ({ id: file.id, name: file.name, deletable: true })),
    ],
    [customFiles, staticFiles],
  );

  const activeCustomFile = useMemo(
    () => customFiles.find((file) => file.id === activeFileId),
    [activeFileId, customFiles],
  );

  const auxiliaryContent = activeCustomFile?.content ?? "";

  const lineCount = Math.max(1, auxiliaryContent.split("\n").length);

  const diagnosticsForActiveFile = useMemo(() => {
    const activeName = activeFileId === "main.tf" ? "main.tf" : activeCustomFile?.name;
    const normalizedActive = basename(activeName)?.toLowerCase();
    if (!normalizedActive) return [];

    return validationDiagnostics.filter((diagnostic) => {
      const fileName = basename(diagnostic.filename)?.toLowerCase();
      return fileName === normalizedActive;
    });
  }, [activeCustomFile?.name, activeFileId, validationDiagnostics]);

  const activeFileDiagnosticLines = useMemo(() => {
    const lines = new Set<number>();
    diagnosticsForActiveFile.forEach((diagnostic) => {
      if (typeof diagnostic.startLine === "number" && diagnostic.startLine > 0) {
        lines.add(diagnostic.startLine);
      }
    });
    return lines;
  }, [diagnosticsForActiveFile]);

  const runTerraformValidate = async () => {
    onOpenLogsPanel?.();

    if (!isTauriRuntime) {
      setValidationError("terraform validate solo está disponible en la app de escritorio (Tauri).");
      setValidationWasSuccessful(null);
      onValidationLogs?.([
        {
          id: `validate-${Date.now()}-runtime`,
          timestamp: new Date().toISOString(),
          level: "error",
          title: "Validate no disponible",
          message: "terraform validate solo está disponible en la app de escritorio (Tauri).",
        },
      ]);
      return;
    }

    if (!projectDir) {
      setValidationError("Abre o guarda un proyecto para ejecutar terraform validate.");
      setValidationWasSuccessful(null);
      onValidationLogs?.([
        {
          id: `validate-${Date.now()}-project`,
          timestamp: new Date().toISOString(),
          level: "error",
          title: "Validate no disponible",
          message: "Abre o guarda un proyecto para ejecutar terraform validate.",
        },
      ]);
      return;
    }

    onValidationLogs?.([
      {
        id: `validate-${Date.now()}-start`,
        timestamp: new Date().toISOString(),
        level: "info",
        title: "Ejecutando validate",
        message: "Iniciando terraform validate...",
      },
    ]);

    setIsValidatingTerraform(true);
    setValidationError(null);

    try {
      const files: TerraformSourceFile[] = [
        {
          name: "main.tf",
          content: buildMainTerraformFile(resources, cloudProvider, _region),
        },
        ...customFiles.map((file) => ({
          name: file.name,
          content: file.content,
        })),
      ];

      const result = await invoke<TerraformValidationResult>("terraform_validate", {
        projectDir,
        files,
      });

      setValidationDiagnostics(result.diagnostics ?? []);
      setValidationWasSuccessful(result.ok);

      const now = new Date().toISOString();
      const logsFromDiagnostics = (result.diagnostics ?? []).map((diagnostic, index) => {
        const severity = (diagnostic.severity?.toLowerCase() ?? "error");
        const level: BottomPanelLogLevel =
          severity === "warning"
            ? "warning"
            : severity === "error"
              ? "error"
              : "info";

        return {
          id: `validate-${Date.now()}-${index}`,
          timestamp: now,
          level,
          title: diagnostic.summary || "Diagnóstico de Terraform",
          message: diagnostic.detail || diagnostic.summary || "Sin detalle.",
          fileName: basename(diagnostic.filename),
          line: diagnostic.startLine,
        } satisfies BottomPanelLogEntry;
      });

      if (!logsFromDiagnostics.length) {
        onValidationLogs?.([
          {
            id: `validate-${Date.now()}-ok`,
            timestamp: now,
            level: result.ok ? "success" : "error",
            title: result.ok ? "Terraform válido" : "Terraform inválido",
            message: result.ok
              ? result.initRan
                ? "terraform init + validate completados sin errores."
                : "terraform validate completado sin errores."
              : "terraform validate devolvió error sin diagnósticos detallados.",
          },
        ]);
      } else {
        onValidationLogs?.(logsFromDiagnostics);
      }
    } catch (error) {
      setValidationDiagnostics([]);
      setValidationWasSuccessful(false);
      setValidationError(String(error));
      onValidationLogs?.([
        {
          id: `validate-${Date.now()}-exception`,
          timestamp: new Date().toISOString(),
          level: "error",
          title: "Error ejecutando validate",
          message: String(error),
        },
      ]);
    } finally {
      setIsValidatingTerraform(false);
    }
  };

  const handleAuxiliaryContentChange = (next: string) => {
    setCustomFiles((current) =>
      current.map((file) =>
        file.id === activeFileId
          ? {
              ...file,
              content: next,
            }
          : file,
      ),
    );
  };

  const addCustomFile = () => {
    const raw = newFileName.trim();
    if (!raw) return;

    const normalized = raw.endsWith(".tf") ? raw : `${raw}.tf`;
    const exists = visibleFiles.some((file) => file.name.toLowerCase() === normalized.toLowerCase());
    if (exists) return;

    setCustomFiles((current) => [
      ...current,
      {
        id: normalized,
        name: normalized,
        content: "",
      },
    ]);
    setActiveFileId(normalized);
    setNewFileName("");
  };

  const removeCustomFile = (fileId: string) => {
    setCustomFiles((current) => current.filter((file) => file.id !== fileId));
    setActiveFileId((current) => (current === fileId ? "main.tf" : current));
  };

  const handleEditorScroll = () => {
    if (!codeEditorRef.current || !lineGutterRef.current) return;
    lineGutterRef.current.scrollTop = codeEditorRef.current.scrollTop;
  };

  let lineNumber = 1;
  const nextLine = () => {
    const current = lineNumber;
    lineNumber += 1;
    return current;
  };

  return (
    <section className="h-full min-h-0 w-full overflow-hidden bg-[#1e1e1e]">
      <div className="flex h-full min-h-0 w-full">
        <aside className="w-56 shrink-0 border-r border-slate-700 bg-[#252526] p-2">
          <div className="mb-2 px-2 text-[11px] font-semibold uppercase tracking-wide text-slate-400">Files</div>

          <div className="space-y-1">
            {visibleFiles.map((file) => (
              <div key={file.id} className="flex items-center gap-1">
                <button
                  type="button"
                  onClick={() => setActiveFileId(file.id)}
                  className={`flex-1 rounded px-2 py-1 text-left text-xs ${
                    activeFileId === file.id
                      ? "bg-slate-700 text-slate-100"
                      : "text-slate-300 hover:bg-slate-700/60"
                  }`}
                >
                  {file.name}
                </button>

                {file.deletable ? (
                  <button
                    type="button"
                    onClick={() => removeCustomFile(file.id)}
                    className="rounded px-1.5 py-1 text-[10px] text-slate-400 hover:bg-slate-700/60 hover:text-slate-200"
                    aria-label={`Delete ${file.name}`}
                    title="Delete file"
                  >
                    ✕
                  </button>
                ) : null}
              </div>
            ))}
          </div>

          <div className="mt-3 border-t border-slate-700 pt-3">
            <div className="mb-1 px-1 text-[11px] text-slate-400">New file</div>
            <input
              value={newFileName}
              onChange={(event) => setNewFileName(event.target.value)}
              placeholder="example.tf"
              className="w-full rounded border border-slate-600 bg-[#1e1e1e] px-2 py-1 text-xs text-slate-200 outline-none focus:border-slate-400"
            />
            <button
              type="button"
              onClick={addCustomFile}
              className="mt-2 w-full rounded border border-slate-600 px-2 py-1 text-xs text-slate-200 hover:bg-slate-700/50"
            >
              Create file
            </button>
          </div>
        </aside>

        <main className="flex min-h-0 flex-1 flex-col">
          <div className="border-b border-slate-700 px-4 py-2">
            <div className="flex items-start justify-between gap-3">
              <div>
                <h2 className="text-sm font-semibold text-slate-100">
                  {visibleFiles.find((file) => file.id === activeFileId)?.name ?? "main.tf"}
                </h2>
                <p className="text-xs text-slate-400">
                  {activeFileId === "main.tf"
                    ? "Only attribute values are editable in this file."
                    : "Editable HCL draft file."}
                </p>
              </div>

              <button
                type="button"
                onClick={() => void runTerraformValidate()}
                disabled={isValidatingTerraform}
                className="rounded border border-slate-600 px-2 py-1 text-xs text-slate-200 hover:bg-slate-700/50 disabled:cursor-not-allowed disabled:opacity-60"
              >
                {isValidatingTerraform ? "Validating..." : "Terraform validate"}
              </button>
            </div>

            {validationError ? (
              <div className="mt-2 rounded border border-red-500/40 bg-red-500/10 px-2 py-1 text-xs text-red-200">
                {validationError}
              </div>
            ) : null}

            {validationWasSuccessful === true ? (
              <div className="mt-2 rounded border border-emerald-500/40 bg-emerald-500/10 px-2 py-1 text-xs text-emerald-200">
                terraform validate: sin errores.
              </div>
            ) : null}

            {validationDiagnostics.length > 0 ? (
              <div className="mt-2 max-h-36 space-y-1 overflow-auto rounded border border-slate-700 bg-[#252526] p-2 text-xs text-slate-200">
                {validationDiagnostics.map((diagnostic, index) => {
                  const diagnosticSeverity = diagnostic.severity?.toLowerCase() ?? "error";
                  const severityClass = diagnosticSeverity === "warning" ? "text-amber-300" : "text-red-300";
                  const fileName = basename(diagnostic.filename);
                  const lineLabel =
                    typeof diagnostic.startLine === "number" ? `:${diagnostic.startLine}` : "";

                  return (
                    <div
                      key={`${diagnostic.summary}-${diagnostic.startLine ?? "x"}-${index}`}
                      className="rounded border border-slate-700/80 bg-[#1e1e1e] px-2 py-1"
                    >
                      <div className="flex items-center gap-2">
                        <span className={`font-semibold uppercase ${severityClass}`}>
                          {diagnosticSeverity}
                        </span>
                        <span className="text-slate-100">{diagnostic.summary}</span>
                      </div>
                      {fileName ? (
                        <div className="text-slate-400">{fileName}{lineLabel}</div>
                      ) : null}
                      {diagnostic.detail ? (
                        <div className="mt-1 whitespace-pre-wrap text-slate-300">{diagnostic.detail}</div>
                      ) : null}
                    </div>
                  );
                })}
              </div>
            ) : null}
          </div>

          <div className="min-h-0 flex-1 overflow-auto p-2 font-mono text-xs text-slate-200">
            {activeFileId === "main.tf" ? (
              resourcesWithSchemas.length === 0 ? (
                <div className="rounded border border-dashed border-slate-600 bg-[#252526] p-4 text-center text-slate-400">
                  No resources in canvas yet.
                </div>
              ) : (
                <div className="space-y-0 bg-[#1e1e1e]">
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300">
                      <span className={tokenKeyword}>terraform</span> <span className={tokenPunctuation}>{"{"}</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-6 text-slate-300">
                      <span className={tokenKeyword}>required_providers</span> <span className={tokenPunctuation}>{"{"}</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-10 text-slate-300">
                      <span className={tokenProperty}>{cloudProvider}</span> <span className={tokenPunctuation}>=</span> <span className={tokenPunctuation}>{"{"}</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-14 text-slate-300">
                      <span className={tokenProperty}>source</span> <span className={tokenPunctuation}>=</span> <span className={tokenString}>"hashicorp/{cloudProvider}"</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-14 text-slate-300">
                      <span className={tokenProperty}>version</span> <span className={tokenPunctuation}>=</span> <span className={tokenString}>"~&gt; 5.0"</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-10 text-slate-300"><span className={tokenPunctuation}>{"}"}</span></div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-6 text-slate-300"><span className={tokenPunctuation}>{"}"}</span></div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300"><span className={tokenPunctuation}>{"}"}</span></div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1"></div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300">
                      <span className={tokenKeyword}>provider</span> <span className={tokenString}>"{cloudProvider}"</span> <span className={tokenPunctuation}>{"{"}</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-6 text-slate-300">
                      <span className={tokenProperty}>region</span> <span className={tokenPunctuation}>=</span> <span className={tokenString}>"{_region}"</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300"><span className={tokenPunctuation}>{"}"}</span></div>
                  </div>

                  {resourcesWithSchemas.map(({ resource, schema }) => {
                    const inspectorProperties = getInspectorPropertiesForSchema(schema);
                    const requiredAttributes = inspectorProperties
                      .filter((property) => property.required)
                      .map((property) => property.name);

                    const currentKeys = Object.keys(resource.config.attributes ?? {});
                    const mergedAttributeKeys = Array.from(
                      new Set([...currentKeys, ...requiredAttributes]),
                    ).sort((left, right) => left.localeCompare(right));

                    return (
                      <div key={resource.id} className="contents">
                        <div className="grid grid-cols-[48px_1fr]">
                          <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                          <div className="px-2 py-1"></div>
                        </div>
                        <div className="grid grid-cols-[48px_1fr]">
                          <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                          <div className="px-2 py-1 text-slate-300">
                            <span className={tokenKeyword}>{resource.kind ?? "resource"}</span>{" "}
                            <span className={tokenString}>"{resource.type}"</span>{" "}
                            <span className={tokenString}>"{resource.name}"</span>{" "}
                            <span className={tokenPunctuation}>{"{"}</span>
                          </div>
                        </div>

                        {mergedAttributeKeys.map((attributeKey) => {
                          const currentValue = resource.config.attributes?.[attributeKey] ?? "";
                          const displayValue = toEditableLiteral(currentValue);
                          const isRequired = requiredAttributes.includes(attributeKey);

                          return (
                            <div key={`${resource.id}-${attributeKey}`} className="grid grid-cols-[48px_1fr]">
                              <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                              <label className="flex items-center gap-2 px-2 py-1 pl-6">
                                <span className={`min-w-[220px] break-all ${tokenProperty}`}>
                                  {attributeKey}
                                  {isRequired ? <span className="ml-1 text-red-400">*</span> : null}
                                </span>
                                <span className={tokenPunctuation}>=</span>
                                <input
                                  value={displayValue}
                                  onChange={(event) =>
                                    onUpdateAttribute(
                                      resource.id,
                                      attributeKey,
                                      parseHclInputToAttribute(event.target.value),
                                    )
                                  }
                                  className={`w-full rounded border border-slate-600 bg-[#252526] px-2 py-1 text-xs ${tokenString} outline-none focus:border-slate-400`}
                                />
                              </label>
                            </div>
                          );
                        })}

                        <div className="grid grid-cols-[48px_1fr]">
                          <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                          <div className="px-2 py-1 text-slate-300"><span className={tokenPunctuation}>{"}"}</span></div>
                        </div>
                      </div>
                    );
                  })}
                </div>
              )
            ) : (
              <div className="grid h-full min-h-0 grid-cols-[48px_1fr] overflow-hidden rounded bg-[#1e1e1e]">
                <div
                  ref={lineGutterRef}
                  className="overflow-hidden border-r border-slate-800 bg-[#252526] px-2 py-2 text-right text-[11px] leading-5 text-slate-500"
                >
                  {Array.from({ length: lineCount }, (_, index) => (
                    <div
                      key={index}
                      className={activeFileDiagnosticLines.has(index + 1) ? "bg-red-500/20 text-red-300" : undefined}
                    >
                      {index + 1}
                    </div>
                  ))}
                </div>
                <textarea
                  ref={codeEditorRef}
                  value={auxiliaryContent}
                  onChange={(event) => handleAuxiliaryContentChange(event.target.value)}
                  onScroll={handleEditorScroll}
                  spellCheck={false}
                  className="h-full min-h-0 w-full resize-none bg-[#1e1e1e] px-3 py-2 font-mono text-xs leading-5 text-slate-200 outline-none"
                />
              </div>
            )}
          </div>
        </main>
      </div>
    </section>
  );
}

const toHclLiteral = (value: unknown): string => {
  if (typeof value === "boolean" || typeof value === "number") return String(value);
  if (typeof value === "string") {
    const trimmed = value.trim();
    if (TERRAFORM_REF_PATTERN.test(trimmed) || trimmed.startsWith("var.")) {
      return trimmed;
    }
    return `"${trimmed.replace(/"/g, '\\"')}"`;
  }
  if (value === null || value === undefined) return '""';
  return `"${String(value).replace(/"/g, '\\"')}"`;
};

const buildMainTerraformFile = (
  resources: TerraformResource[],
  cloudProvider: "aws",
  region: string,
) => {
  let hcl = "terraform {\n";
  hcl += "  required_providers {\n";
  hcl += `    ${cloudProvider} = {\n`;
  hcl += `      source  = \"hashicorp/${cloudProvider}\"\n`;
  hcl += "      version = \"~> 5.0\"\n";
  hcl += "    }\n";
  hcl += "  }\n";
  hcl += "}\n\n";
  hcl += `provider \"${cloudProvider}\" {\n`;
  hcl += `  region = \"${region}\"\n`;
  hcl += "}\n\n";

  resources.forEach((resource) => {
    hcl += `${resource.kind ?? "resource"} \"${resource.type}\" \"${resource.name}\" {\n`;
    Object.entries(resource.config.attributes ?? {}).forEach(([key, value]) => {
      hcl += `  ${key} = ${toHclLiteral(value)}\n`;
    });
    hcl += "}\n\n";
  });

  return hcl;
};
