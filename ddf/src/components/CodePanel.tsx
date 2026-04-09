import { useEffect, useMemo, useRef, useState } from "react";
import { invoke } from "@tauri-apps/api/core";
import { readDir, readTextFile, writeTextFile, remove, rename, mkdir } from "@tauri-apps/plugin-fs";
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
  onValidationLogs: (entries: BottomPanelLogEntry[]) => void;
  onOpenLogsPanel: () => void;
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

type TerraformLspDiagnosticsResult = {
  diagnostics: TerraformValidationDiagnostic[];
};

type TerraformSourceFile = {
  name: string;
  content: string;
};

type HclBlockNode = {
  attributes: Record<string, unknown>;
  blocks: Record<string, HclBlockNode>;
};

type ExplorerNode = {
  id: string;
  name: string;
  relativePath: string;
  isDirectory: boolean;
  children?: ExplorerNode[];
};

type PendingDeleteTarget = {
  name: string;
  relativePath: string;
  isDirectory: boolean;
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
  onCustomFilesChange,
  onUpdateAttribute,
  onValidationLogs,
  onOpenLogsPanel,
}: CodePanelProps) {
  const [activeFilePath, setActiveFilePath] = useState<string>("main.tf");
  const [fileTree, setFileTree] = useState<ExplorerNode[]>([]);
  const [expandedDirs, setExpandedDirs] = useState<Set<string>>(new Set());
  const [openFileContents, setOpenFileContents] = useState<Record<string, string>>({});
  const [focusedNodePath, setFocusedNodePath] = useState<string>("main.tf");
  const [isExplorerBusy, setIsExplorerBusy] = useState(false);
  const [createMode, setCreateMode] = useState<"file" | "folder" | null>(null);
  const [createParentPath, setCreateParentPath] = useState<string>("");
  const [createName, setCreateName] = useState("");
  const [renameTargetPath, setRenameTargetPath] = useState<string | null>(null);
  const [renameValue, setRenameValue] = useState("");
  const [pendingDelete, setPendingDelete] = useState<PendingDeleteTarget | null>(null);
  const [isValidatingTerraform, setIsValidatingTerraform] = useState(false);
  const codeEditorRef = useRef<HTMLTextAreaElement | null>(null);
  const lineGutterRef = useRef<HTMLDivElement | null>(null);
  const saveTimeoutRef = useRef<number | null>(null);
  const topLevelSyncSignatureRef = useRef<string>("");

  const isTauriRuntime =
    typeof window !== "undefined" &&
    !!(window as unknown as { __TAURI_INTERNALS__?: unknown }).__TAURI_INTERNALS__;

  const normalizePath = (value: string) => value.replace(/\\/g, "/").replace(/\/+/g, "/");

  const parentPathOf = (value: string) => {
    const normalized = normalizePath(value);
    const idx = normalized.lastIndexOf("/");
    return idx >= 0 ? normalized.slice(0, idx) : "";
  };

  const joinRelative = (left: string, right: string) => {
    if (!left) return right;
    return `${left}/${right}`;
  };

  const toAbsolute = (relativePath: string) => {
    if (!projectDir) return relativePath;
    return relativePath ? `${projectDir}/${relativePath}` : projectDir;
  };

  const sortNodes = (nodes: ExplorerNode[]) =>
    [...nodes].sort((a, b) => {
      if (a.isDirectory !== b.isDirectory) return a.isDirectory ? -1 : 1;
      return a.name.localeCompare(b.name);
    });

  const loadTreeRecursive = async (basePath: string, relativeBase = ""): Promise<ExplorerNode[]> => {
    let entries;
    try {
      entries = await readDir(basePath);
    } catch {
      return [];
    }

    const nodes = await Promise.all(
      entries
        .filter((entry) => typeof entry.name === "string")
        .map(async (entry) => {
          const name = entry.name as string;
          const relativePath = joinRelative(relativeBase, name);
          if (entry.isDirectory) {
            const children = await loadTreeRecursive(`${basePath}/${name}`, relativePath);
            return {
              id: relativePath,
              name,
              relativePath,
              isDirectory: true,
              children: sortNodes(children),
            } satisfies ExplorerNode;
          }

          return {
            id: relativePath,
            name,
            relativePath,
            isDirectory: false,
          } satisfies ExplorerNode;
        }),
    );

    return sortNodes(nodes);
  };

  const refreshExplorerTree = async () => {
    if (!projectDir || !isTauriRuntime) return;
    setIsExplorerBusy(true);
    try {
      const loaded = await loadTreeRecursive(projectDir, "");
      setFileTree(loaded);
      setExpandedDirs((current) => {
        const next = new Set(current);
        next.add("");
        return next;
      });
      const existingPaths = new Set<string>();
      const collect = (nodes: ExplorerNode[]) => {
        nodes.forEach((node) => {
          existingPaths.add(node.relativePath);
          if (node.children?.length) collect(node.children);
        });
      };
      collect(loaded);
      setActiveFilePath((current) => (current === "main.tf" || existingPaths.has(current) ? current : "main.tf"));
    } finally {
      setIsExplorerBusy(false);
    }
  };

  const syncTopLevelTfFilesToParent = async () => {
    if (!onCustomFilesChange || !projectDir || !isTauriRuntime) return;
    try {
      const entries = await readDir(projectDir);
      const tfFiles = entries
        .filter((entry) => entry.isFile && typeof entry.name === "string")
        .map((entry) => entry.name as string)
        .filter((name) => name.toLowerCase().endsWith(".tf") && name.toLowerCase() !== "main.tf")
        .sort((a, b) => a.localeCompare(b));

      const files: DdfCodeFile[] = await Promise.all(
        tfFiles.map(async (name) => ({
          id: name,
          name,
          content: await readTextFile(`${projectDir}/${name}`),
        })),
      );

      const nextSignature = JSON.stringify(
        files.map((file) => ({ name: file.name, content: file.content })),
      );
      if (topLevelSyncSignatureRef.current === nextSignature) {
        return;
      }
      topLevelSyncSignatureRef.current = nextSignature;

      onCustomFilesChange(files);
    } catch {
      // ignore sync errors
    }
  };

  useEffect(() => {
    if (!isTauriRuntime || !projectDir) return;

    let cancelled = false;

    const loadExplorer = async () => {
      try {
        await refreshExplorerTree();
        await syncTopLevelTfFilesToParent();
      } catch {
        if (!cancelled) setFileTree([]);
      }
    };

    void loadExplorer();

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

  const auxiliaryContent = openFileContents[activeFilePath] ?? "";

  const lineCount = Math.max(1, auxiliaryContent.split("\n").length);

  const loadFileIntoEditor = async (relativePath: string) => {
    if (!projectDir || relativePath === "main.tf") {
      setActiveFilePath(relativePath);
      return;
    }

    try {
      const content = await readTextFile(toAbsolute(relativePath));
      setOpenFileContents((current) => ({
        ...current,
        [relativePath]: content,
      }));
      setActiveFilePath(relativePath);
    } catch {
      setOpenFileContents((current) => ({
        ...current,
        [relativePath]: "",
      }));
      setActiveFilePath(relativePath);
    }
  };

  const flattenTree = (nodes: ExplorerNode[]): ExplorerNode[] => {
    const collected: ExplorerNode[] = [];
    const visit = (entries: ExplorerNode[]) => {
      entries.forEach((entry) => {
        collected.push(entry);
        if (entry.children?.length) visit(entry.children);
      });
    };
    visit(nodes);
    return collected;
  };

  const findNodeByPath = (relativePath: string): ExplorerNode | undefined => {
    if (!relativePath) return undefined;
    return flattenTree(fileTree).find((entry) => entry.relativePath === relativePath);
  };

  const getCreateBasePath = () => {
    const focused = findNodeByPath(focusedNodePath);
    if (!focused) return "";
    if (focused.isDirectory) return focused.relativePath;
    return parentPathOf(focused.relativePath);
  };

  const getEditorTitle = () => {
    if (!activeFilePath) return "main.tf";
    const node = findNodeByPath(activeFilePath);
    return node?.name ?? activeFilePath;
  };

  const openCreatePrompt = (mode: "file" | "folder") => {
    setCreateMode(mode);
    setCreateParentPath(getCreateBasePath());
    setCreateName("");
  };

  const submitCreate = async () => {
    if (!createMode || !projectDir) return;
    const raw = createName.trim();
    if (!raw) return;

    const normalizedName = createMode === "file" && !raw.includes(".") ? `${raw}.tf` : raw;
    const relativePath = createParentPath ? `${createParentPath}/${normalizedName}` : normalizedName;

    try {
      if (createMode === "folder") {
        await mkdir(toAbsolute(relativePath), { recursive: true });
      } else {
        await writeTextFile(toAbsolute(relativePath), "");
      }

      await refreshExplorerTree();
      await syncTopLevelTfFilesToParent();

      if (createMode === "file") {
        await loadFileIntoEditor(relativePath);
      } else {
        setExpandedDirs((current) => {
          const next = new Set(current);
          next.add(relativePath);
          if (createParentPath) next.add(createParentPath);
          return next;
        });
      }
    } catch {
      // ignore create failures
    } finally {
      setCreateMode(null);
      setCreateName("");
    }
  };

  const beginRename = (relativePath: string) => {
    const node = findNodeByPath(relativePath);
    if (!node) return;
    setRenameTargetPath(relativePath);
    setRenameValue(node.name);
  };

  const submitRename = async () => {
    if (!renameTargetPath || !projectDir) return;
    const nextName = renameValue.trim();
    if (!nextName) return;
    const parentPath = parentPathOf(renameTargetPath);
    const nextRelativePath = parentPath ? `${parentPath}/${nextName}` : nextName;

    try {
      await rename(toAbsolute(renameTargetPath), toAbsolute(nextRelativePath));
      await refreshExplorerTree();
      await syncTopLevelTfFilesToParent();

      if (activeFilePath === renameTargetPath) {
        setActiveFilePath(nextRelativePath);
      }
      if (focusedNodePath === renameTargetPath) {
        setFocusedNodePath(nextRelativePath);
      }
      if (openFileContents[renameTargetPath] !== undefined) {
        setOpenFileContents((current) => {
          const { [renameTargetPath]: previous, ...rest } = current;
          return previous === undefined ? current : { ...rest, [nextRelativePath]: previous };
        });
      }
    } catch {
      // ignore rename failures
    } finally {
      setRenameTargetPath(null);
      setRenameValue("");
    }
  };

  const confirmDeleteNode = (relativePath: string) => {
    const node = findNodeByPath(relativePath);
    if (!node) return;
    setPendingDelete({
      name: node.name,
      relativePath,
      isDirectory: node.isDirectory,
    });
  };

  const executeDelete = async () => {
    if (!pendingDelete || !projectDir) return;
    try {
      await remove(toAbsolute(pendingDelete.relativePath), { recursive: pendingDelete.isDirectory });
      await refreshExplorerTree();
      await syncTopLevelTfFilesToParent();

      if (
        activeFilePath === pendingDelete.relativePath ||
        activeFilePath.startsWith(`${pendingDelete.relativePath}/`)
      ) {
        setActiveFilePath("main.tf");
      }

      setOpenFileContents((current) => {
        const next = { ...current };
        Object.keys(next).forEach((key) => {
          if (key === pendingDelete.relativePath || key.startsWith(`${pendingDelete.relativePath}/`)) {
            delete next[key];
          }
        });
        return next;
      });
    } catch {
      // ignore delete failures
    } finally {
      setPendingDelete(null);
    }
  };

  const toggleDirectory = (relativePath: string) => {
    setExpandedDirs((current) => {
      const next = new Set(current);
      if (next.has(relativePath)) {
        next.delete(relativePath);
      } else {
        next.add(relativePath);
      }
      return next;
    });
  };

  const runTerraformValidate = async () => {
    onOpenLogsPanel();

    if (!isTauriRuntime) {
      onValidationLogs([
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
      onValidationLogs([
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

    onValidationLogs([
      {
        id: `validate-${Date.now()}-start`,
        timestamp: new Date().toISOString(),
        level: "info",
        title: "Ejecutando validate",
        message: "Iniciando terraform validate...",
      },
    ]);

    onValidationLogs([
      {
        id: `lsp-${Date.now()}-start`,
        timestamp: new Date().toISOString(),
        level: "info",
        title: "Ejecutando terraform-ls",
        message: "Solicitando diagnósticos LSP...",
      },
    ]);

    setIsValidatingTerraform(true);

    try {
      const tfNodes = flattenTree(fileTree)
        .filter((node) => !node.isDirectory)
        .filter((node) => node.relativePath.toLowerCase().endsWith(".tf"))
        .filter((node) => node.relativePath !== "main.tf");

      const additionalFiles = await Promise.all(
        tfNodes.map(async (node) => ({
          name: node.relativePath,
          content:
            openFileContents[node.relativePath] ??
            (await readTextFile(toAbsolute(node.relativePath))),
        })),
      );

      const files: TerraformSourceFile[] = [
        {
          name: "main.tf",
          content: buildMainTerraformFile(resources, cloudProvider, _region),
        },
        ...additionalFiles,
      ];

      try {
        const lspResult = await invoke<TerraformLspDiagnosticsResult>("terraform_lsp_diagnostics", {
          projectDir,
          files,
        });

        const lspLogs = (lspResult.diagnostics ?? []).map((diagnostic, index) => {
          const severity = diagnostic.severity?.toLowerCase() ?? "error";
          const level: BottomPanelLogLevel =
            severity === "warning"
              ? "warning"
              : severity === "error"
                ? "error"
                : "info";

          return {
            id: `lsp-${Date.now()}-${index}`,
            timestamp: new Date().toISOString(),
            level,
            title: `[terraform-ls] ${diagnostic.summary || "Diagnóstico"}`,
            message: diagnostic.detail || diagnostic.summary || "Sin detalle.",
            fileName: basename(diagnostic.filename),
            line: diagnostic.startLine,
          } satisfies BottomPanelLogEntry;
        });

        if (lspLogs.length) {
          onValidationLogs(lspLogs);
          onValidationLogs([
            {
              id: `lsp-${Date.now()}-summary`,
              timestamp: new Date().toISOString(),
              level: "info",
              title: "terraform-ls finalizado",
              message: `Diagnósticos LSP: ${lspLogs.length}.`,
            },
          ]);
        } else {
          onValidationLogs([
            {
              id: `lsp-${Date.now()}-empty`,
              timestamp: new Date().toISOString(),
              level: "info",
              title: "terraform-ls finalizado",
              message: "Sin diagnósticos LSP para el contenido actual.",
            },
          ]);
        }
      } catch (lspError) {
        onValidationLogs([
          {
            id: `lsp-${Date.now()}-error`,
            timestamp: new Date().toISOString(),
            level: "warning",
            title: "terraform-ls no disponible",
            message: String(lspError),
          },
        ]);
      }

      const result = await invoke<TerraformValidationResult>("terraform_validate", {
        projectDir,
        files,
      });

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
        onValidationLogs([
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
        onValidationLogs(logsFromDiagnostics);
      }

      onValidationLogs([
        {
          id: `validate-${Date.now()}-summary`,
          timestamp: now,
          level: "info",
          title: "Resumen validate",
          message: `Finalizado. Diagnósticos: ${result.diagnostics?.length ?? 0}${result.initRan ? ", con init" : ""}.`,
        },
      ]);
    } catch (error) {
      onValidationLogs([
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
    if (activeFilePath === "main.tf" || !projectDir) return;
    setOpenFileContents((current) => ({
      ...current,
      [activeFilePath]: next,
    }));

    if (saveTimeoutRef.current !== null) {
      window.clearTimeout(saveTimeoutRef.current);
    }

    const targetFile = activeFilePath;
    saveTimeoutRef.current = window.setTimeout(() => {
      void writeTextFile(toAbsolute(targetFile), next)
        .then(() => syncTopLevelTfFilesToParent())
        .catch(() => {
          // ignore write errors
        });
    }, 180);
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

  const renderExplorerNode = (node: ExplorerNode, depth = 0) => {
    const isExpanded = node.isDirectory && expandedDirs.has(node.relativePath);
    const isFocused = focusedNodePath === node.relativePath;
    const isActiveFile = !node.isDirectory && activeFilePath === node.relativePath;
    const isRenaming = renameTargetPath === node.relativePath;

    return (
      <div key={node.id}>
        <div
          className={`group flex items-center gap-1 rounded px-1 py-0.5 text-xs ${
            isActiveFile ? "bg-slate-700 text-slate-100" : isFocused ? "bg-slate-700/60 text-slate-200" : "text-slate-300 hover:bg-slate-700/50"
          }`}
          style={{ paddingLeft: `${depth * 12 + 4}px` }}
        >
          {node.isDirectory ? (
            <button
              type="button"
              onClick={() => {
                toggleDirectory(node.relativePath);
                setFocusedNodePath(node.relativePath);
              }}
              className="text-[11px] text-slate-400 hover:text-slate-100"
              title={isExpanded ? "Collapse folder" : "Expand folder"}
            >
              {isExpanded ? "▾" : "▸"}
            </button>
          ) : (
            <span className="w-3 text-center text-[11px] text-slate-500">•</span>
          )}

          {isRenaming ? (
            <input
              autoFocus
              value={renameValue}
              onChange={(event) => setRenameValue(event.target.value)}
              onBlur={() => void submitRename()}
              onKeyDown={(event) => {
                if (event.key === "Enter") {
                  event.preventDefault();
                  void submitRename();
                }
                if (event.key === "Escape") {
                  setRenameTargetPath(null);
                  setRenameValue("");
                }
              }}
              className="w-full rounded border border-slate-500 bg-[#1e1e1e] px-1 py-0.5 text-xs text-slate-100 outline-none"
            />
          ) : (
            <button
              type="button"
              onClick={() => {
                setFocusedNodePath(node.relativePath);
                if (node.isDirectory) {
                  toggleDirectory(node.relativePath);
                  return;
                }
                void loadFileIntoEditor(node.relativePath);
              }}
              className="flex-1 truncate text-left"
              title={node.relativePath}
            >
              {node.name}
            </button>
          )}

          <div className="hidden items-center gap-1 group-hover:flex">
            <button
              type="button"
              onClick={() => beginRename(node.relativePath)}
              className="rounded px-1 text-[10px] text-slate-400 hover:bg-slate-600 hover:text-slate-100"
              title="Rename"
            >
              ✎
            </button>
            {node.relativePath !== "main.tf" ? (
              <button
                type="button"
                onClick={() => confirmDeleteNode(node.relativePath)}
                className="rounded px-1 text-[10px] text-slate-400 hover:bg-slate-600 hover:text-slate-100"
                title="Delete"
              >
                ✕
              </button>
            ) : null}
          </div>
        </div>

        {node.isDirectory && isExpanded && node.children?.length
          ? node.children.map((child) => renderExplorerNode(child, depth + 1))
          : null}
      </div>
    );
  };

  return (
    <section className="relative h-full min-h-0 w-full overflow-hidden bg-[#1e1e1e]">
      <div className="flex h-full min-h-0 w-full">
        <aside className="w-72 shrink-0 border-r border-slate-700 bg-[#252526] p-2">
          <div className="mb-2 flex items-center justify-between px-2">
            <div className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">Explorer</div>
            <div className="flex items-center gap-1">
              <button
                type="button"
                onClick={() => openCreatePrompt("file")}
                className="rounded px-1.5 py-0.5 text-[10px] text-slate-300 hover:bg-slate-700/60"
                title="New file"
              >
                +F
              </button>
              <button
                type="button"
                onClick={() => openCreatePrompt("folder")}
                className="rounded px-1.5 py-0.5 text-[10px] text-slate-300 hover:bg-slate-700/60"
                title="New folder"
              >
                +D
              </button>
              <button
                type="button"
                onClick={() => void refreshExplorerTree()}
                className="rounded px-1.5 py-0.5 text-[10px] text-slate-300 hover:bg-slate-700/60"
                title="Refresh"
              >
                ↻
              </button>
            </div>
          </div>

          {createMode ? (
            <div className="mb-2 rounded border border-slate-700 bg-[#1e1e1e] p-2 text-xs">
              <div className="mb-1 text-slate-400">
                New {createMode === "file" ? "file" : "folder"} in {createParentPath || "/"}
              </div>
              <input
                autoFocus
                value={createName}
                onChange={(event) => setCreateName(event.target.value)}
                placeholder={createMode === "file" ? "example.tf" : "modules"}
                className="w-full rounded border border-slate-600 bg-[#252526] px-2 py-1 text-xs text-slate-200 outline-none focus:border-slate-400"
              />
              <div className="mt-2 flex justify-end gap-1">
                <button
                  type="button"
                  onClick={() => {
                    setCreateMode(null);
                    setCreateName("");
                  }}
                  className="rounded border border-slate-600 px-2 py-1 text-[11px] text-slate-300 hover:bg-slate-700/40"
                >
                  Cancel
                </button>
                <button
                  type="button"
                  onClick={() => void submitCreate()}
                  className="rounded border border-slate-500 px-2 py-1 text-[11px] text-slate-100 hover:bg-slate-700/60"
                >
                  Create
                </button>
              </div>
            </div>
          ) : null}

          <div className="max-h-[calc(100%-5rem)] overflow-auto">
            {isExplorerBusy ? (
              <div className="px-2 py-2 text-xs text-slate-500">Loading explorer...</div>
            ) : fileTree.length === 0 ? (
              <div className="px-2 py-2 text-xs text-slate-500">No files found in this view folder.</div>
            ) : (
              fileTree.map((node) => renderExplorerNode(node, 0))
            )}
          </div>
        </aside>

        <main className="flex min-h-0 flex-1 flex-col">
          <div className="border-b border-slate-700 px-4 py-2">
            <div className="flex items-start justify-between gap-3">
              <div>
                <h2 className="text-sm font-semibold text-slate-100">
                  {getEditorTitle()}
                </h2>
                <p className="text-xs text-slate-400">
                  {activeFilePath === "main.tf"
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
          </div>

          <div className="min-h-0 flex-1 overflow-auto p-2 font-mono text-xs text-slate-200">
            {activeFilePath === "main.tf" ? (
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
      {pendingDelete ? (
        <div className="absolute inset-0 z-[120] flex items-center justify-center bg-black/45">
          <div className="w-[420px] max-w-[92vw] rounded-lg border border-gray-700 bg-gray-900 p-4 text-sm text-gray-200 shadow-2xl">
            <h3 className="text-base font-semibold text-white">Delete {pendingDelete.isDirectory ? "folder" : "file"}</h3>
            <p className="mt-2 text-xs text-gray-300">
              Are you sure you want to delete <span className="font-semibold text-white">{pendingDelete.name}</span>? This action cannot be undone.
            </p>

            <div className="mt-4 flex justify-end gap-2">
              <button
                type="button"
                onClick={() => setPendingDelete(null)}
                className="rounded border border-gray-600 px-3 py-1.5 text-xs text-gray-300 hover:bg-gray-800"
              >
                Cancel
              </button>
              <button
                type="button"
                onClick={() => void executeDelete()}
                className="rounded border border-red-500/70 bg-red-600/20 px-3 py-1.5 text-xs text-red-200 hover:bg-red-600/35"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      ) : null}
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
    if (
      trimmed === "true" ||
      trimmed === "false" ||
      /^-?\d+(\.\d+)?$/.test(trimmed) ||
      (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
      (trimmed.startsWith("{") && trimmed.endsWith("}"))
    ) {
      return trimmed;
    }
    return `"${trimmed.replace(/"/g, '\\"')}"`;
  }
  if (value === null || value === undefined) return '""';
  return `"${String(value).replace(/"/g, '\\"')}"`;
};

const buildHclBlockTree = (attributes: Record<string, unknown>): HclBlockNode => {
  const root: HclBlockNode = { attributes: {}, blocks: {} };

  Object.entries(attributes ?? {}).forEach(([rawKey, rawValue]) => {
    if (rawValue === undefined || rawValue === null) return;
    if (typeof rawValue === "string" && rawValue.trim() === "") return;

    const pathParts = rawKey.split(".").filter(Boolean);
    if (!pathParts.length) return;

    if (pathParts.length === 1) {
      root.attributes[pathParts[0]] = rawValue;
      return;
    }

    let cursor = root;
    for (const blockName of pathParts.slice(0, -1)) {
      if (!cursor.blocks[blockName]) {
        cursor.blocks[blockName] = { attributes: {}, blocks: {} };
      }
      cursor = cursor.blocks[blockName];
    }

    const attrName = pathParts[pathParts.length - 1];
    cursor.attributes[attrName] = rawValue;
  });

  return root;
};

const renderHclBlockNode = (node: HclBlockNode, indent: string): string => {
  let lines = "";

  Object.entries(node.attributes).forEach(([key, value]) => {
    lines += `${indent}${key} = ${toHclLiteral(value)}\n`;
  });

  Object.entries(node.blocks).forEach(([blockName, blockNode]) => {
    lines += `${indent}${blockName} {\n`;
    lines += renderHclBlockNode(blockNode, `${indent}  `);
    lines += `${indent}}\n`;
  });

  return lines;
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
    const blockTree = buildHclBlockTree(resource.config.attributes ?? {});
    hcl += renderHclBlockNode(blockTree, "  ");
    hcl += "}\n\n";
  });

  return hcl;
};
