import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useTranslation } from "react-i18next";
import { HclCodeArea } from "./HclCodeArea";
import type { TypeHintResolver } from "../utils/hclHighlight";
import { basename } from "../utils/pathUtils";
import { parseMainTfBlocks, type ParsedMainTfBlock } from "../utils/hclBlocks";
import {
  canEditOnlyInAttributeValues,
  pruneEmptyAttributeAssignments,
} from "../utils/hclEditGuards";
import { invoke } from "@tauri-apps/api/core";
import { readDir, readTextFile, writeTextFile, remove, rename, mkdir } from "@tauri-apps/plugin-fs";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { CodeFile } from "../types/project";
import type { BottomPanelLogEntry, BottomPanelLogLevel } from "../types/logs";
import {
  formatTypeLabel,
  getInspectorPropertiesForSchema,
} from "../commands/schemaInspector";
import { extractManualSegments } from "../utils/hclParser";
import { PROVIDER_CONFIG, type CloudProvider } from "../models/providerConfig";
import { buildMultiProviderHcl } from "../models/hclEmitter";

type CodePanelProps = {
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  cloudProvider: CloudProvider;
  region: string;
  projectDir?: string;
  initialCustomFiles?: CodeFile[];
  onCustomFilesChange?: (files: CodeFile[]) => void;
  onMainTfBlocksChange?: (blocks: ParsedMainTfBlock[], overrideCanvas?: boolean) => void;
  onValidationLogs: (entries: BottomPanelLogEntry[]) => void;
  onOpenLogsPanel: () => void;
  mainTfDraft?: string;
  onMainTfDraftChange?: (draft: string) => void;
  isFreeEditMode?: boolean;
  onFreeEditModeChange?: (value: boolean) => void;
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

export default function CodePanel({
  resources,
  schemas,
  cloudProvider,
  region: _region,
  projectDir,
  onCustomFilesChange,
  onMainTfBlocksChange,
  onValidationLogs,
  onOpenLogsPanel,
  mainTfDraft: mainTfDraftProp,
  onMainTfDraftChange,
  isFreeEditMode: isFreeEditModeProp,
  onFreeEditModeChange,
}: CodePanelProps) {
  const { t } = useTranslation();
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
  const [mainTfDraftLocal, setMainTfDraftLocal] = useState("");
  const [isFreeEditModeLocal, setIsFreeEditModeLocal] = useState(false);
  const mainTfDraft = mainTfDraftProp !== undefined ? mainTfDraftProp : mainTfDraftLocal;
  const setMainTfDraft = onMainTfDraftChange ?? setMainTfDraftLocal;
  const isFreeEditMode = isFreeEditModeProp !== undefined ? isFreeEditModeProp : isFreeEditModeLocal;
  const setIsFreeEditMode = onFreeEditModeChange ?? setIsFreeEditModeLocal;
  const codeEditorRef = useRef<HTMLTextAreaElement | null>(null);
  const lineGutterRef = useRef<HTMLDivElement | null>(null);
  const saveTimeoutRef = useRef<number | null>(null);
  const topLevelSyncSignatureRef = useRef<string>("");
  const isFreeEditModeRef = useRef(false);
  isFreeEditModeRef.current = isFreeEditMode;
  // When the user edits main.tf, we fire onMainTfBlocksChange which causes
  // resources to update and mainTfContent to regenerate. We must skip that
  // next reset so we don't clobber the user's own edit.
  const skipNextMainTfResetRef = useRef(false);

  // Cache manual code segments when entering free edit mode
  const manualSegmentsRef = useRef<{
    comments: string[];
    customProviderConfig: string;
    preProviderContent: string;
    postResourcesContent: string;
  } | null>(null);

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

      const files: CodeFile[] = await Promise.all(
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

  const typeLabelByResource = useMemo(() => {
    const map = new Map<string, Map<string, string>>();
    resourcesWithSchemas.forEach(({ resource, schema }) => {
      if (!schema) return;
      const properties = getInspectorPropertiesForSchema(schema);
      const attrMap = new Map<string, string>();
      properties.forEach((property) => {
        attrMap.set(property.name, formatTypeLabel(property.rawType));
      });
      map.set(`${resource.type}.${resource.name}`, attrMap);
    });
    return map;
  }, [resourcesWithSchemas]);

  const rawTypeByResource = useMemo(() => {
    const map = new Map<string, Map<string, unknown>>();
    resourcesWithSchemas.forEach(({ resource, schema }) => {
      if (!schema) return;
      const properties = getInspectorPropertiesForSchema(schema);
      const attrMap = new Map<string, unknown>();
      properties.forEach((property) => {
        attrMap.set(property.name, property.rawType);
      });
      map.set(`${resource.type}.${resource.name}`, attrMap);
    });
    return map;
  }, [resourcesWithSchemas]);

  const mainTfTypeHints = useCallback<TypeHintResolver>(
    (header, blockPath, attributeName) => {
      if (!header || header.kind !== "resource") return undefined;
      const labelMap = typeLabelByResource.get(`${header.type}.${header.name}`);
      const rawMap = rawTypeByResource.get(`${header.type}.${header.name}`);
      if (!labelMap) return undefined;

      if (blockPath.length === 0) {
        return labelMap.get(attributeName);
      }

      const dotted = `${blockPath.join(".")}.${attributeName}`;
      const direct = labelMap.get(dotted);
      if (direct) return direct;

      if (rawMap) {
        const parentRaw = rawMap.get(blockPath[0]!);
        if (
          Array.isArray(parentRaw) &&
          (parentRaw[0] === "set" || parentRaw[0] === "list") &&
          Array.isArray(parentRaw[1]) &&
          parentRaw[1][0] === "object" &&
          parentRaw[1][1] &&
          typeof parentRaw[1][1] === "object"
        ) {
          const innerFields = parentRaw[1][1] as Record<string, unknown>;
          const fieldType = innerFields[attributeName];
          if (fieldType !== undefined) {
            return formatTypeLabel(fieldType);
          }
        }
      }

      return labelMap.get(blockPath[0]!);
    },
    [typeLabelByResource, rawTypeByResource],
  );

  const auxiliaryContent = openFileContents[activeFilePath] ?? "";
  const lineCount = Math.max(1, auxiliaryContent.split("\n").length);

  const mainTfContent = useMemo(() => {
    const settings = {
      aws: { region: PROVIDER_CONFIG.aws.defaultRegion },
      gcp: { region: PROVIDER_CONFIG.gcp.defaultRegion },
      azure: { region: PROVIDER_CONFIG.azure.defaultRegion },
    };
    settings[cloudProvider] = { region: _region };
    return buildMultiProviderHcl({ provider: "", resources }, settings, cloudProvider);
  }, [resources, cloudProvider, _region]);
  const mainTfLineCount = Math.max(1, mainTfDraft.split("\n").length);

  useEffect(() => {
    if (skipNextMainTfResetRef.current) {
      skipNextMainTfResetRef.current = false;
      return;
    }
    if (!isFreeEditModeRef.current) {
      setMainTfDraft(mainTfContent);
    }
  }, [mainTfContent]);
  // Keep stable refs so unmount cleanup can read latest values without stale closures.
  const mainTfDraftRef = useRef(mainTfDraft);
  mainTfDraftRef.current = mainTfDraft;
  const onMainTfBlocksChangeRef = useRef(onMainTfBlocksChange);
  onMainTfBlocksChangeRef.current = onMainTfBlocksChange;

  useEffect(() => {
    if (isFreeEditMode) {
      // Entering free edit mode: cache current manual segments
      manualSegmentsRef.current = extractManualSegments(mainTfDraft, "");
    } else if (manualSegmentsRef.current) {
      // Exiting free edit mode: flush the edited draft into resources so the
      // regenerated HCL reflects whatever the user typed (including canvas resources).
      const parsedBlocks = parseMainTfBlocks(mainTfDraft);
      if (parsedBlocks.length > 0 && onMainTfBlocksChange) {
        // Skip is NOT set here: we want the subsequent mainTfContent effect to
        // regenerate the draft from resources (so known attributes appear correctly).
        onMainTfBlocksChange(parsedBlocks, true);
      }
      manualSegmentsRef.current = null;
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isFreeEditMode]);

  // Flush free-mode draft when the user navigates away (CodePanel unmounts).
  // Uses refs so the cleanup captures the latest draft and callback.
  useEffect(() => {
    return () => {
      if (isFreeEditModeRef.current && manualSegmentsRef.current) {
        const parsedBlocks = parseMainTfBlocks(mainTfDraftRef.current);
        if (parsedBlocks.length > 0 && onMainTfBlocksChangeRef.current) {
          onMainTfBlocksChangeRef.current(parsedBlocks, true);
        }
        manualSegmentsRef.current = null;
      }
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);


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
          title: t("code.validate.unavailableTitle"),
          message: t("code.validate.desktopOnly"),
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
          title: t("code.validate.unavailableTitle"),
          message: t("code.validate.openProjectFirst"),
        },
      ]);
      return;
    }

    onValidationLogs([
      {
        id: `validate-${Date.now()}-start`,
        timestamp: new Date().toISOString(),
        level: "info",
        title: t("code.validate.runningTitle"),
        message: t("code.validate.starting"),
      },
    ]);

    onValidationLogs([
      {
        id: `lsp-${Date.now()}-start`,
        timestamp: new Date().toISOString(),
        level: "info",
        title: t("code.validate.runningLs"),
        message: t("code.validate.requestingLsp"),
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
          content: mainTfDraft,
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
            title: `[terraform-ls] ${diagnostic.summary || t("code.validate.diagnostic")}`,
            message: diagnostic.detail || diagnostic.summary || t("code.validate.noDetail"),
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
              title: t("code.validate.lsFinished"),
              message: t("code.validate.lspDiagnosticsCount", { count: lspLogs.length }),
            },
          ]);
        } else {
          onValidationLogs([
            {
              id: `lsp-${Date.now()}-empty`,
              timestamp: new Date().toISOString(),
              level: "info",
              title: t("code.validate.lsFinished"),
              message: t("code.validate.noLspDiagnostics"),
            },
          ]);
        }
      } catch (lspError) {
        onValidationLogs([
          {
            id: `lsp-${Date.now()}-error`,
            timestamp: new Date().toISOString(),
            level: "warning",
            title: t("code.validate.lsUnavailable"),
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
          title: diagnostic.summary || t("code.validate.terraformDiagnostic"),
          message: diagnostic.detail || diagnostic.summary || t("code.validate.noDetail"),
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
            title: result.ok ? t("code.validate.validTitle") : t("code.validate.invalidTitle"),
            message: result.ok
              ? result.initRan
                ? t("code.validate.initOk")
                : t("code.validate.validateOk")
              : t("code.validate.errorNoDiagnostics"),
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
          title: t("code.validate.summaryTitle"),
          message: `${t("code.validate.summary", { count: result.diagnostics?.length ?? 0 })}${result.initRan ? t("code.validate.summaryWithInit") : ""}`,
        },
      ]);
    } catch (error) {
      onValidationLogs([
        {
          id: `validate-${Date.now()}-exception`,
          timestamp: new Date().toISOString(),
          level: "error",
          title: t("code.validate.errorTitle"),
          message: String(error),
        },
      ]);
    } finally {
      setIsValidatingTerraform(false);
    }
  };

  const handleAuxiliaryContentChange = (next: string) => {
    if (activeFilePath === "main.tf" || !projectDir) return;
    const currentValue = openFileContents[activeFilePath] ?? "";
    if (!isFreeEditMode && !canEditOnlyInAttributeValues(currentValue, next)) {
      if (codeEditorRef.current) {
        const sel = codeEditorRef.current.selectionStart;
        codeEditorRef.current.value = currentValue;
        const cursor = Math.min(sel, currentValue.length);
        codeEditorRef.current.setSelectionRange(cursor, cursor);
      }
      return;
    }
    const normalizedNext = isFreeEditMode ? next : pruneEmptyAttributeAssignments(next);

    setOpenFileContents((current) => ({
      ...current,
      [activeFilePath]: normalizedNext,
    }));

    if (saveTimeoutRef.current !== null) {
      window.clearTimeout(saveTimeoutRef.current);
    }

    const targetFile = activeFilePath;
    saveTimeoutRef.current = window.setTimeout(() => {
      void writeTextFile(toAbsolute(targetFile), normalizedNext)
        .then(() => syncTopLevelTfFilesToParent())
        .catch(() => {
          // ignore write errors
        });
    }, 180);
  };

  // In attribute mode, pasted clipboard text often carries trailing newlines
  // (e.g. copying a whole line), which the structural guard rejects outright.
  // Sanitize the paste to a single line and apply it manually so the resulting
  // edit stays inside the attribute value and is accepted.
  const handleAttributeModePaste = (
    event: React.ClipboardEvent<HTMLTextAreaElement>,
    currentValue: string,
    applyChange: (next: string) => void,
  ) => {
    if (isFreeEditMode) return; // free mode: let the browser handle paste natively
    const textarea = event.currentTarget;
    const clipboard = event.clipboardData.getData("text");
    const sanitized = clipboard.replace(/\r?\n|\r/g, " ");
    if (!sanitized) return;
    event.preventDefault();
    const start = textarea.selectionStart ?? currentValue.length;
    const end = textarea.selectionEnd ?? start;
    const next = currentValue.slice(0, start) + sanitized + currentValue.slice(end);
    const caret = start + sanitized.length;
    // Restore the caret after React re-renders with the new value.
    requestAnimationFrame(() => {
      if (codeEditorRef.current) {
        const max = codeEditorRef.current.value.length;
        const pos = Math.min(caret, max);
        codeEditorRef.current.setSelectionRange(pos, pos);
      }
    });
    applyChange(next);
  };

  const handleMainTfContentChange = (next: string) => {
    if (!isFreeEditMode && !canEditOnlyInAttributeValues(mainTfDraft, next)) {
      return;
    }
    if (!isFreeEditMode && onMainTfBlocksChange) {
      // Attribute mode: sync resources on every keystroke. Skip the next
      // mainTfContent reset so the user's in-progress edit is preserved.
      skipNextMainTfResetRef.current = true;
      onMainTfBlocksChange(parseMainTfBlocks(next), false);
    }
    // In free edit mode we only update the draft; resource sync happens on
    // toggle-exit so we don't create duplicate resources on every keystroke.
    setMainTfDraft(isFreeEditMode ? next : pruneEmptyAttributeAssignments(next));
  };

  const regenerateMainTfFromCanvas = () => {
    setMainTfDraft(mainTfContent);
    onMainTfBlocksChange?.(parseMainTfBlocks(mainTfContent), false);
    setActiveFilePath("main.tf");
    setFocusedNodePath("main.tf");
    setIsFreeEditMode(false);
  };

  const handleEditorScroll = () => {
    if (!codeEditorRef.current || !lineGutterRef.current) return;
    lineGutterRef.current.scrollTop = codeEditorRef.current.scrollTop;
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
              title={isExpanded ? t("code.explorer.collapseFolder") : t("code.explorer.expandFolder")}
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
              title={t("code.explorer.rename")}
            >
              ✎
            </button>
            {node.relativePath !== "main.tf" ? (
              <button
                type="button"
                onClick={() => confirmDeleteNode(node.relativePath)}
                className="rounded px-1 text-[10px] text-slate-400 hover:bg-slate-600 hover:text-slate-100"
                title={t("code.explorer.delete")}
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
            <div className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">{t("code.explorer.title")}</div>
            <div className="flex items-center gap-1">
              <button
                type="button"
                onClick={() => openCreatePrompt("file")}
                className="rounded px-1.5 py-0.5 text-[10px] text-slate-300 hover:bg-slate-700/60"
                title={t("code.explorer.newFile")}
              >
                +F
              </button>
              <button
                type="button"
                onClick={() => openCreatePrompt("folder")}
                className="rounded px-1.5 py-0.5 text-[10px] text-slate-300 hover:bg-slate-700/60"
                title={t("code.explorer.newFolder")}
              >
                +D
              </button>
              <button
                type="button"
                onClick={() => void refreshExplorerTree()}
                className="rounded px-1.5 py-0.5 text-[10px] text-slate-300 hover:bg-slate-700/60"
                title={t("code.explorer.refresh")}
              >
                ↻
              </button>
            </div>
          </div>

          {createMode ? (
            <div className="mb-2 rounded border border-slate-700 bg-[#1e1e1e] p-2 text-xs">
              <div className="mb-1 text-slate-400">
                {createMode === "file"
                  ? t("code.explorer.newFileIn", { path: createParentPath || "/" })
                  : t("code.explorer.newFolderIn", { path: createParentPath || "/" })}
              </div>
              <input
                autoFocus
                value={createName}
                onChange={(event) => setCreateName(event.target.value)}
                placeholder={createMode === "file" ? t("code.explorer.fileNamePlaceholder") : t("code.explorer.folderNamePlaceholder")}
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
                  {t("code.common.cancel")}
                </button>
                <button
                  type="button"
                  onClick={() => void submitCreate()}
                  className="rounded border border-slate-500 px-2 py-1 text-[11px] text-slate-100 hover:bg-slate-700/60"
                >
                  {t("code.common.create")}
                </button>
              </div>
            </div>
          ) : null}

          <div className="max-h-[calc(100%-5rem)] overflow-auto">
            {isExplorerBusy ? (
              <div className="px-2 py-2 text-xs text-slate-500">{t("code.explorer.loading")}</div>
            ) : fileTree.length === 0 ? (
              <div className="px-2 py-2 text-xs text-slate-500">{t("code.explorer.noFiles")}</div>
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
                    ? t("code.editor.mainTfSubtitle")
                    : t("code.editor.draftSubtitle")}
                </p>
              </div>

              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={regenerateMainTfFromCanvas}
                  className="rounded border border-sky-500/70 px-2 py-1 text-xs text-sky-200 hover:bg-sky-700/20"
                  title={t("code.editor.regenerateHclTitle")}
                >
                  {t("code.editor.regenerateHcl")}
                </button>

                <button
                  type="button"
                  onClick={() => void runTerraformValidate()}
                  disabled={isValidatingTerraform}
                  className="rounded border border-slate-600 px-2 py-1 text-xs text-slate-200 hover:bg-slate-700/50 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  {isValidatingTerraform ? t("code.validate.validating") : t("code.validate.button")}
                </button>

                <button
                  type="button"
                  onClick={() => setIsFreeEditMode(!isFreeEditMode)}
                  className={`rounded border px-2 py-1 text-xs ${
                    isFreeEditMode
                      ? "border-emerald-500 text-emerald-200 hover:bg-emerald-700/20"
                      : "border-slate-600 text-slate-200 hover:bg-slate-700/50"
                  }`}
                  title={isFreeEditMode ? t("code.editor.switchToAttributeMode") : t("code.editor.switchToFreeMode")}
                >
                  {isFreeEditMode ? t("code.editor.freeMode") : t("code.editor.attributeMode")}
                </button>
              </div>
            </div>
          </div>

          <div className="min-h-0 flex-1 overflow-hidden p-2 font-mono text-xs text-slate-200">
            {activeFilePath === "main.tf" ? (
              resourcesWithSchemas.length === 0 ? (
                <div className="rounded border border-dashed border-slate-600 bg-[#252526] p-4 text-center text-slate-400">
                  {t("code.editor.noResources")}
                </div>
              ) : (
                <div className="grid h-full min-h-0 grid-cols-[48px_1fr] overflow-hidden rounded bg-[#1e1e1e]">
                  <div
                    ref={lineGutterRef}
                    className="overflow-hidden border-r border-slate-800 bg-[#252526] px-2 py-2 text-right text-[11px] leading-5 text-slate-500"
                  >
                    {Array.from({ length: mainTfLineCount }, (_, index) => (
                      <div key={index}>{index + 1}</div>
                    ))}
                  </div>
                  <HclCodeArea
                    value={mainTfDraft}
                    onChange={handleMainTfContentChange}
                    onPaste={(event) =>
                      handleAttributeModePaste(event, mainTfDraft, handleMainTfContentChange)
                    }
                    onScroll={handleEditorScroll}
                    textareaRef={codeEditorRef}
                    containerClassName="h-full min-h-0"
                    innerClassName="px-3 py-2 font-mono text-xs leading-5"
                    attributeMode={!isFreeEditMode}
                    tabInsertsSpaces={isFreeEditMode}
                    typeHints={mainTfTypeHints}
                  />
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
                <HclCodeArea
                  value={auxiliaryContent}
                  onChange={handleAuxiliaryContentChange}
                  onPaste={(event) =>
                    handleAttributeModePaste(event, auxiliaryContent, handleAuxiliaryContentChange)
                  }
                  onScroll={handleEditorScroll}
                  textareaRef={codeEditorRef}
                  containerClassName="h-full min-h-0"
                  innerClassName="px-3 py-2 font-mono text-xs leading-5"
                  attributeMode={!isFreeEditMode}
                  tabInsertsSpaces={isFreeEditMode}
                />
              </div>
            )}
          </div>
        </main>
      </div>
      {pendingDelete ? (
        <div className="absolute inset-0 z-[120] flex items-center justify-center bg-black/45">
          <div className="w-[420px] max-w-[92vw] rounded-lg border border-gray-700 bg-gray-900 p-4 text-sm text-gray-200 shadow-2xl">
            <h3 className="text-base font-semibold text-white">
              {pendingDelete.isDirectory ? t("code.delete.titleFolder") : t("code.delete.titleFile")}
            </h3>
            <p className="mt-2 text-xs text-gray-300">
              {t("code.delete.confirmPrefix")}<span className="font-semibold text-white">{pendingDelete.name}</span>{t("code.delete.confirmSuffix")}
            </p>

            <div className="mt-4 flex justify-end gap-2">
              <button
                type="button"
                onClick={() => setPendingDelete(null)}
                className="rounded border border-gray-600 px-3 py-1.5 text-xs text-gray-300 hover:bg-gray-800"
              >
                {t("code.common.cancel")}
              </button>
              <button
                type="button"
                onClick={() => void executeDelete()}
                className="rounded border border-red-500/70 bg-red-600/20 px-3 py-1.5 text-xs text-red-200 hover:bg-red-600/35"
              >
                {t("code.common.delete")}
              </button>
            </div>
          </div>
        </div>
      ) : null}
    </section>
  );
}

