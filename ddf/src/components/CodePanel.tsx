import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { readDir, readTextFile, remove, writeTextFile } from "@tauri-apps/plugin-fs";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/testNodes";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";

type CodePanelProps = {
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  cloudProvider: "aws";
  region: string;
  projectDir?: string;
  onUpdateAttribute: (resourceId: string, attribute: string, value: unknown) => void;
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

export default function CodePanel({
  resources,
  schemas,
  cloudProvider,
  region: _region,
  projectDir,
  onUpdateAttribute,
}: CodePanelProps) {
  const [activeFileId, setActiveFileId] = useState<string>("main.tf");
  const [customFiles, setCustomFiles] = useState<Array<{ id: string; name: string; content: string }>>([]);
  const [newFileName, setNewFileName] = useState("");
  const codeEditorRef = useRef<HTMLTextAreaElement | null>(null);
  const lineGutterRef = useRef<HTMLDivElement | null>(null);
  const saveTimersRef = useRef<Map<string, number>>(new Map());

  const isTauriRuntime =
    typeof window !== "undefined" &&
    !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

  const clearFileSaveTimer = useCallback((fileId: string) => {
    const timer = saveTimersRef.current.get(fileId);
    if (timer) {
      window.clearTimeout(timer);
      saveTimersRef.current.delete(fileId);
    }
  }, []);

  const persistCustomFile = useCallback(
    async (fileName: string, content: string) => {
      if (!isTauriRuntime || !projectDir) return;
      await writeTextFile(`${projectDir}/${fileName}`, content);
    },
    [isTauriRuntime, projectDir],
  );

  useEffect(() => {
    saveTimersRef.current.forEach((timer) => window.clearTimeout(timer));
    saveTimersRef.current.clear();
  }, []);

  useEffect(() => {
    if (!isTauriRuntime || !projectDir) {
      setCustomFiles([]);
      setActiveFileId("main.tf");
      return;
    }

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
          setCustomFiles(loadedFiles);
          setActiveFileId((current) => {
            if (current === "main.tf") return current;
            return loadedFiles.some((file) => file.id === current) ? current : "main.tf";
          });
        }
      } catch {
        if (!cancelled) setCustomFiles([]);
      }
    };

    void loadCustomFiles();

    return () => {
      cancelled = true;
    };
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

  const handleAuxiliaryContentChange = (next: string) => {
    const activeId = activeFileId;
    setCustomFiles((current) =>
      current.map((file) =>
        file.id === activeId
          ? {
              ...file,
              content: next,
            }
          : file,
      ),
    );

    if (activeId === "main.tf") return;

    clearFileSaveTimer(activeId);
    const timer = window.setTimeout(() => {
      void persistCustomFile(activeId, next);
    }, 250);
    saveTimersRef.current.set(activeId, timer);
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
    void persistCustomFile(normalized, "");
  };

  const removeCustomFile = (fileId: string) => {
    clearFileSaveTimer(fileId);
    setCustomFiles((current) => current.filter((file) => file.id !== fileId));
    setActiveFileId((current) => (current === fileId ? "main.tf" : current));

    if (isTauriRuntime && projectDir) {
      void remove(`${projectDir}/${fileId}`).catch(() => {});
    }
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
            <h2 className="text-sm font-semibold text-slate-100">
              {visibleFiles.find((file) => file.id === activeFileId)?.name ?? "main.tf"}
            </h2>
            <p className="text-xs text-slate-400">
              {activeFileId === "main.tf"
                ? "Only attribute values are editable in this file."
                : "Editable HCL draft file."}
            </p>
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
                    <div className="px-2 py-1 text-slate-300">terraform {'{'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-6 text-slate-300">required_providers {'{'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-10 text-slate-300">{cloudProvider} = {'{'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-14 text-slate-300">source = "hashicorp/{cloudProvider}"</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-14 text-slate-300">version = "~&gt; 5.0"</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-10 text-slate-300">{'}'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-6 text-slate-300">{'}'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300">{'}'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1"></div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300">provider "{cloudProvider}" {'{'}</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 pl-6 text-slate-300">region = "{_region}"</div>
                  </div>
                  <div className="grid grid-cols-[48px_1fr]">
                    <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                    <div className="px-2 py-1 text-slate-300">{'}'}</div>
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
                            {(resource.kind ?? "resource")} "{resource.type}" "{resource.name}" {'{'}
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
                                <span className="min-w-[220px] break-all text-slate-300">
                                  {attributeKey}
                                  {isRequired ? <span className="ml-1 text-red-400">*</span> : null}
                                </span>
                                <span>=</span>
                                <input
                                  value={displayValue}
                                  onChange={(event) =>
                                    onUpdateAttribute(
                                      resource.id,
                                      attributeKey,
                                      parseHclInputToAttribute(event.target.value),
                                    )
                                  }
                                  className="w-full rounded border border-slate-600 bg-[#252526] px-2 py-1 text-xs text-slate-200 outline-none focus:border-slate-400"
                                />
                              </label>
                            </div>
                          );
                        })}

                        <div className="grid grid-cols-[48px_1fr]">
                          <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                          <div className="px-2 py-1 text-slate-300">{'}'}</div>
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
                    <div key={index}>{index + 1}</div>
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
