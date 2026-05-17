import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { HclCodeArea } from "./HclCodeArea";
import type { TypeHintResolver } from "../utils/hclHighlight";
import { invoke } from "@tauri-apps/api/core";
import { readDir, readTextFile, writeTextFile, remove, rename, mkdir } from "@tauri-apps/plugin-fs";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { DdfCodeFile } from "../types/project";
import type { BottomPanelLogEntry, BottomPanelLogLevel } from "../types/logs";
import {
  formatTypeLabel,
  getInspectorPropertiesForSchema,
} from "../commands/schemaInspector";
import { extractManualSegments } from "../utils/hclParser";

type CodePanelProps = {
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  cloudProvider: "aws" | "gcp" | "azure";
  region: string;
  projectDir?: string;
  initialCustomFiles?: DdfCodeFile[];
  onCustomFilesChange?: (files: DdfCodeFile[]) => void;
  onMainTfBlocksChange?: (blocks: ParsedMainTfBlock[], overrideCanvas?: boolean) => void;
  onValidationLogs: (entries: BottomPanelLogEntry[]) => void;
  onOpenLogsPanel: () => void;
  mainTfDraft?: string;
  onMainTfDraftChange?: (draft: string) => void;
  isFreeEditMode?: boolean;
  onFreeEditModeChange?: (value: boolean) => void;
};

type ParsedMainTfBlock = {
  kind: "resource" | "data";
  type: string;
  name: string;
  attributes: Record<string, unknown>;
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

type HclBlockNode = {
  attributes: Record<string, unknown>;
  blocks: Record<string, HclBlockNode>;
};

const TERRAFORM_REF_PATTERN = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;
const INVALID_HCL_VALUE = Symbol("invalid-hcl-value");


// Returns the character ranges [start, end] that correspond to the value portion
// of attribute-assignment lines (the part after `=`). Block headers, closing braces,
// and blank lines produce no ranges. For string values (wrapped in outer quotes),
// the range covers only the content INSIDE the outer quotes so the wrappers are protected.
const getAttributeValueRanges = (text: string): Array<{ start: number; end: number }> => {
  const ranges: Array<{ start: number; end: number }> = [];
  const lines = text.split("\n");
  let offset = 0;

  for (const line of lines) {
    // Attribute lines: optional indent + plain identifier + optional spaces + = + rest
    // Block headers (resource "..." "..." {) never contain a bare `=` at this position.
    const match = line.match(/^(\s*[a-zA-Z_][a-zA-Z0-9_-]*\s*=\s*)/);
    if (match) {
      const valueStart = offset + match[1].length;
      const lineEnd = offset + line.trimEnd().length;
      const valueStr = line.slice(match[1].length).trimEnd();

      if (valueStr.length >= 2 && valueStr.startsWith('"') && valueStr.endsWith('"')) {
        // String value: restrict editable zone to inside the outer quotes so the
        // wrapper quotes themselves cannot be accidentally deleted.
        ranges.push({ start: valueStart + 1, end: Math.max(valueStart + 1, lineEnd - 1) });
      } else {
        ranges.push({ start: valueStart, end: Math.max(valueStart, lineEnd) });
      }
    }

    offset += line.length + 1; // +1 for the newline character
  }

  return ranges;
};

const isPositionInAttributeValue = (text: string, position: number): boolean =>
  getAttributeValueRanges(text).some(
    // range.end + 1 allows inserting just before the closing wrapper quote
    (range) => position >= range.start && position <= range.end + 1,
  );

const isRangeInAttributeValues = (text: string, start: number, end: number): boolean => {
  if (end <= start) return true;
  return getAttributeValueRanges(text).some(
    (range) => start >= range.start && end <= range.end,
  );
};

// Returns true only if the diff between `previous` and `next` falls entirely
// within attribute-value zones (right-hand side of `key =` lines).
// Newline insertion is always blocked to prevent structural changes.
const canEditOnlyInAttributeValues = (previous: string, next: string): boolean => {
  if (previous === next) return true;

  let prefix = 0;
  while (
    prefix < previous.length &&
    prefix < next.length &&
    previous[prefix] === next[prefix]
  ) {
    prefix += 1;
  }

  let prevSuffix = previous.length;
  let nextSuffix = next.length;
  while (
    prevSuffix > prefix &&
    nextSuffix > prefix &&
    previous[prevSuffix - 1] === next[nextSuffix - 1]
  ) {
    prevSuffix -= 1;
    nextSuffix -= 1;
  }

  const removedLen = prevSuffix - prefix;
  const addedLen = nextSuffix - prefix;

  if (removedLen > 0 && !isRangeInAttributeValues(previous, prefix, prevSuffix)) {
    return false;
  }

  if (addedLen > 0) {
    const addedText = next.slice(prefix, nextSuffix);
    if (addedText.includes("\n")) return false;
    if (!isPositionInAttributeValue(previous, prefix)) return false;
  }

  return true;
};

const pruneEmptyAttributeAssignments = (hcl: string): string => {
  const lines = hcl.split("\n");
  const nextLines: string[] = [];
  let blockDepth = 0;

  lines.forEach((line) => {
    const trimmed = line.trim();
    const opens = (line.match(/{/g) ?? []).length;
    const closes = (line.match(/}/g) ?? []).length;
    const isInsideBlock = blockDepth > 0;

    const isEmptyAssignment =
      /^([a-zA-Z0-9_.-]+)\s*=\s*""\s*$/.test(trimmed) ||
      /^([a-zA-Z0-9_.-]+)\s*=\s*$/.test(trimmed);

    if (!(isInsideBlock && isEmptyAssignment)) {
      nextLines.push(line);
    }

    blockDepth += opens;
    blockDepth -= closes;
    if (blockDepth < 0) blockDepth = 0;
  });

  return nextLines.join("\n");
};

const parseHclValueToAttribute = (rawValue: string): unknown | typeof INVALID_HCL_VALUE => {
  const trimmed = rawValue.trim();
  // Empty value or empty HCL string literal → treat as cleared
  if (!trimmed || trimmed === '""') return "";
  if (trimmed === "[" || trimmed === "]" || trimmed === "{" || trimmed === "}") {
    return INVALID_HCL_VALUE;
  }
  if ((trimmed.startsWith("[") && !trimmed.endsWith("]")) || (trimmed.startsWith("{") && !trimmed.endsWith("}"))) {
    return INVALID_HCL_VALUE;
  }
  // Store raw HCL value as-is — user is responsible for HCL syntax
  return trimmed;
};

const parseMainTfBlocks = (hcl: string): ParsedMainTfBlock[] => {
  const lines = hcl.split("\n");
  const blocks: ParsedMainTfBlock[] = [];

  let index = 0;
  while (index < lines.length) {
    const header = lines[index]?.trim() ?? "";
    const match = header.match(/^(resource|data)\s+"([^"]+)"\s+"([^"]+)"\s*\{\s*$/);
    if (!match) {
      index += 1;
      continue;
    }

    const blockKind = match[1] as "resource" | "data";
    const blockType = match[2] ?? "";
    const blockName = match[3] ?? "";
    const attributes: Record<string, unknown> = {};

    // Stack of block-name prefixes for nested blocks (e.g. "route" → "route.")
    const prefixStack: string[] = [];
    let depth = 1;
    index += 1;

    while (index < lines.length && depth > 0) {
      const line = lines[index] ?? "";
      const trimmed = line.trim();

      // Detect a named block opener at any depth (e.g. `route {`)
      const blockOpener = trimmed.match(/^([a-zA-Z_][a-zA-Z0-9_-]*)\s*\{$/);

      if (blockOpener && prefixStack.length === depth - 1) {
        // Push the block name so child attributes are prefixed with it
        prefixStack.push(blockOpener[1]);
      } else {
        const assignment = trimmed.match(/^([a-zA-Z0-9_.-]+)\s*=\s*(.*)$/);
        if (assignment) {
          const [, key, rawValue] = assignment;
          const parsed = parseHclValueToAttribute(rawValue);
          if (parsed !== INVALID_HCL_VALUE) {
            const prefix = prefixStack.join(".");
            const fullKey = prefix ? `${prefix}.${key}` : key;
            attributes[fullKey] = parsed;
          }
        }
      }

      const opens = (line.match(/{/g) ?? []).length;
      const closes = (line.match(/}/g) ?? []).length;
      const nextDepth = depth + opens - closes;

      // When depth decreases, pop the matching prefix (closing a nested block)
      if (nextDepth < depth && prefixStack.length >= nextDepth) {
        prefixStack.splice(nextDepth - 1);
      }

      depth = nextDepth;
      index += 1;
    }

    blocks.push({
      kind: blockKind,
      type: blockType,
      name: blockName,
      attributes,
    });
  }

  return blocks;
};


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
  onMainTfBlocksChange,
  onValidationLogs,
  onOpenLogsPanel,
  mainTfDraft: mainTfDraftProp,
  onMainTfDraftChange,
  isFreeEditMode: isFreeEditModeProp,
  onFreeEditModeChange,
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

  const mainTfContent = useMemo(
    () => buildMainTerraformFile(resources, cloudProvider, _region),
    [resources, cloudProvider, _region],
  );
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
  // Handle toggling free edit mode
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
                    ? "Generated from templates. Edit attributes in the inspector."
                    : "Editable HCL draft file."}
                </p>
              </div>

              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={regenerateMainTfFromCanvas}
                  className="rounded border border-sky-500/70 px-2 py-1 text-xs text-sky-200 hover:bg-sky-700/20"
                  title="Regenerar main.tf desde los recursos actuales del canvas"
                >
                  Regenerar HCL
                </button>

                <button
                  type="button"
                  onClick={() => void runTerraformValidate()}
                  disabled={isValidatingTerraform}
                  className="rounded border border-slate-600 px-2 py-1 text-xs text-slate-200 hover:bg-slate-700/50 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  {isValidatingTerraform ? "Validating..." : "Terraform validate"}
                </button>

                <button
                  type="button"
                  onClick={() => setIsFreeEditMode(!isFreeEditMode)}
                  className={`rounded border px-2 py-1 text-xs ${
                    isFreeEditMode
                      ? "border-emerald-500 text-emerald-200 hover:bg-emerald-700/20"
                      : "border-slate-600 text-slate-200 hover:bg-slate-700/50"
                  }`}
                  title={isFreeEditMode ? "Switch to attribute-safe mode" : "Switch to full free-text editor"}
                >
                  {isFreeEditMode ? "Modo libre" : "Modo atributos"}
                </button>
              </div>
            </div>
          </div>

          <div className="min-h-0 flex-1 overflow-hidden p-2 font-mono text-xs text-slate-200">
            {activeFilePath === "main.tf" ? (
              resourcesWithSchemas.length === 0 ? (
                <div className="rounded border border-dashed border-slate-600 bg-[#252526] p-4 text-center text-slate-400">
                  No resources in canvas yet.
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
                    onScroll={handleEditorScroll}
                    textareaRef={codeEditorRef}
                    containerClassName="h-full min-h-0"
                    innerClassName="px-3 py-2 font-mono text-xs leading-5"
                    attributeMode={!isFreeEditMode}
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
                  onScroll={handleEditorScroll}
                  textareaRef={codeEditorRef}
                  containerClassName="h-full min-h-0"
                  innerClassName="px-3 py-2 font-mono text-xs leading-5"
                  attributeMode={!isFreeEditMode}
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
  if (value === null || value === undefined) return "null";
  if (typeof value === "boolean" || typeof value === "number") return String(value);
  if (Array.isArray(value)) {
    if (value.length === 0) return "[]";
    if (value.every((item) => typeof item === "object" && item !== null && !Array.isArray(item))) {
      const entries = (value as Array<Record<string, unknown>>).map((item) => {
        const fields = Object.entries(item)
          .filter(([, v]) => v !== undefined)
          .map(([k, v]) => `      ${k} = ${toHclLiteral(v)}`)
          .join("\n");
        return `    {\n${fields}\n    }`;
      });
      return `[\n${entries.join(",\n")}\n  ]`;
    }
    return `[${value.map(toHclLiteral).join(", ")}]`;
  }
  if (typeof value === "string") {
    const trimmed = value.trim();
    if (!trimmed) return '""';
    if (TERRAFORM_REF_PATTERN.test(trimmed) || trimmed.startsWith("var.")) return trimmed;
    if (
      trimmed === "true" ||
      trimmed === "false" ||
      /^-?\d+(\.\d+)?$/.test(trimmed) ||
      (trimmed.startsWith('"') && trimmed.endsWith('"')) ||
      (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
      (trimmed.startsWith("{") && trimmed.endsWith("}"))
    ) {
      return trimmed;
    }
    return JSON.stringify(value);
  }
  return JSON.stringify(String(value));
};

const isPlainObject = (value: unknown): value is Record<string, unknown> =>
  typeof value === "object" && value !== null && !Array.isArray(value);

const isMeaningfulValue = (value: unknown): boolean => {
  if (value === undefined || value === null) return false;
  if (typeof value === "string") {
    const trimmed = value.trim();
    if (!trimmed) return false;
    if (trimmed === "[" || trimmed === "]" || trimmed === "{" || trimmed === "}") return false;
    return true;
  }
  if (Array.isArray(value)) {
    if (!value.length) return false;
    if (value.every((item) => isPlainObject(item))) {
      return value.some((item) => Object.values(item).some((nested) => isMeaningfulValue(nested)));
    }
    return value.some((item) => isMeaningfulValue(item));
  }
  if (isPlainObject(value)) {
    return Object.values(value).some((nested) => isMeaningfulValue(nested));
  }
  return true;
};


const buildResourceHcl = (resource: TerraformResource): string => {
  const blockKind = resource.kind ?? "resource";
  const attrs = resource.config.attributes ?? {};
  const root: HclBlockNode = { attributes: {}, blocks: {} };

  Object.entries(attrs).forEach(([rawKey, rawValue]) => {
    if (!isMeaningfulValue(rawValue)) return;

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

    cursor.attributes[pathParts[pathParts.length - 1]] = rawValue;
  });

  const renderAssignment = (key: string, value: unknown, indent: string): string => {
    if (key === "protocol" && typeof value === "number" && value === -1) {
      return `${indent}${key} = "-1"\n`;
    }
    return `${indent}${key} = ${toHclLiteral(value)}\n`;
  };

  const renderObjectBlock = (blockName: string, value: Record<string, unknown>, indent: string): string => {
    const entries = Object.entries(value).filter(([, item]) => isMeaningfulValue(item));
    if (!entries.length) return "";

    let lines = `${indent}${blockName} {\n`;
    entries.forEach(([k, v]) => {
      lines += renderAssignment(k, v, `${indent}  `);
    });
    lines += `${indent}}\n`;
    return lines;
  };

  const renderNode = (node: HclBlockNode, indent: string): string => {
    let lines = "";

    Object.entries(node.attributes).forEach(([key, value]) => {
      if (!isMeaningfulValue(value)) return;

      if (Array.isArray(value) && value.every((item) => isPlainObject(item))) {
        value.forEach((item) => {
          const rendered = renderObjectBlock(key, item as Record<string, unknown>, indent);
          if (rendered) lines += rendered;
        });
        return;
      }

      lines += renderAssignment(key, value, indent);
    });

    Object.entries(node.blocks).forEach(([blockName, blockNode]) => {
      const inner = renderNode(blockNode, `${indent}  `);
      if (!inner.trim()) return;
      lines += `${indent}${blockName} {\n`;
      lines += inner;
      lines += `${indent}}\n`;
    });

    return lines;
  };

  const body = renderNode(root, "  ");
  return `${blockKind} "${resource.type}" "${resource.name}" {\n${body}}`;
};

const buildMainTerraformFile = (
  resources: TerraformResource[],
  cloudProvider: "aws" | "gcp" | "azure",
  region: string,
) => {
    const providerConfig: Record<string, { name: string; source: string; version: string }> = {
      aws: { name: "aws", source: "hashicorp/aws", version: "~> 5.0" },
      gcp: { name: "google", source: "hashicorp/google", version: "~> 5.0" },
      azure: { name: "azurerm", source: "hashicorp/azurerm", version: "~> 3.0" },
    };
    const config = providerConfig[cloudProvider];

  let hcl = "terraform {\n";
  hcl += "  required_providers {\n";
  hcl += `    ${config.name} = {\n`;
  hcl += `      source  = \"${config.source}\"\n`;
  hcl += `      version = \"${config.version}\"\n`;
  hcl += "    }\n";
  hcl += "  }\n";
  hcl += "}\n\n";
  hcl += `provider \"${config.name}\" {\n`;
  hcl += `  region = \"${region}\"\n`;
  hcl += "}\n\n";

  resources.forEach((resource) => {
    const block = buildResourceHcl(resource);
    hcl += block;
    hcl += "\n\n";
  });

  return hcl.trimEnd() + "\n";
};
