import { useMemo, useRef, useState } from "react";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/testNodes";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";

type CodePanelProps = {
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  cloudProvider: "aws";
  region: string;
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

const tokenKeyword = "text-[#c586c0]";
const tokenProperty = "text-[#9cdcfe]";
const tokenString = "text-[#ce9178]";
const tokenPunctuation = "text-[#d4d4d4]";

export default function CodePanel({
  resources,
  schemas,
  cloudProvider,
  region: _region,
  onUpdateAttribute,
}: CodePanelProps) {
  const [activeFileId, setActiveFileId] = useState<string>("main.tf");
  const [customFiles, setCustomFiles] = useState<Array<{ id: string; name: string; content: string }>>([]);
  const [newFileName, setNewFileName] = useState("");
  const codeEditorRef = useRef<HTMLTextAreaElement | null>(null);
  const lineGutterRef = useRef<HTMLDivElement | null>(null);

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

    const id = `custom-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;
    setCustomFiles((current) => [
      ...current,
      {
        id,
        name: normalized,
        content: "",
      },
    ]);
    setActiveFileId(id);
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
                <div className="px-2 py-1 text-slate-300">
                  <span className={tokenKeyword}>terraform</span> <span className={tokenPunctuation}>{'{'}</span>
                </div>
              </div>
              <div className="grid grid-cols-[48px_1fr]">
                <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                <div className="px-2 py-1 pl-6 text-slate-300">
                  <span className={tokenKeyword}>required_providers</span> <span className={tokenPunctuation}>{'{'}</span>
                </div>
              </div>
              <div className="grid grid-cols-[48px_1fr]">
                <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                <div className="px-2 py-1 pl-10 text-slate-300">
                  <span className={tokenProperty}>{cloudProvider}</span> <span className={tokenPunctuation}>=</span> <span className={tokenPunctuation}>{'{'}</span>
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
                <div className="px-2 py-1 pl-10 text-slate-300"><span className={tokenPunctuation}>{'}'}</span></div>
              </div>
              <div className="grid grid-cols-[48px_1fr]">
                <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                <div className="px-2 py-1 pl-6 text-slate-300"><span className={tokenPunctuation}>{'}'}</span></div>
              </div>
              <div className="grid grid-cols-[48px_1fr]">
                <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                <div className="px-2 py-1 text-slate-300"><span className={tokenPunctuation}>{'}'}</span></div>
              </div>
              <div className="grid grid-cols-[48px_1fr]">
                <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                <div className="px-2 py-1"></div>
              </div>
              <div className="grid grid-cols-[48px_1fr]">
                <div className="px-2 py-1 text-right text-[11px] text-slate-500">{nextLine()}</div>
                <div className="px-2 py-1 text-slate-300">
                  <span className={tokenKeyword}>provider</span> <span className={tokenString}>"{cloudProvider}"</span> <span className={tokenPunctuation}>{'{'}</span>
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
                <div className="px-2 py-1 text-slate-300"><span className={tokenPunctuation}>{'}'}</span></div>
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
                        <span className={tokenPunctuation}>{'{'}</span>
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
                      <div className="px-2 py-1 text-slate-300"><span className={tokenPunctuation}>{'}'}</span></div>
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
