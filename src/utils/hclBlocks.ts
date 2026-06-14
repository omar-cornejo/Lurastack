// HCL block <-> attribute-map conversion, the INVERSE of models/hclEmitter.ts.
// Extracted verbatim from CodePanel (parsing) and RightPanel (emission) so the
// dotted-key ↔ nested-block convention can be unit-tested on both directions.

import type { TerraformResource } from "../models/terraform";
import {
  parseHclValueToAttribute,
  INVALID_HCL_VALUE,
  isMeaningfulValue,
  isPlainObject,
  toHclLiteral,
} from "./hclAttributes";

export type ParsedMainTfBlock = {
  kind: "resource" | "data";
  type: string;
  name: string;
  attributes: Record<string, unknown>;
};

// Parses the body of a resource/data block (the lines between its braces) into
// an attribute map. Scalar assignments become plain keys; repeated named blocks
// (e.g. multiple `ingress { ... }`) are collected into an ARRAY of objects under
// the block name so the emitter can re-render each one as its own nested block.
// Single nested blocks also become a one-element array — round-trip safe.
export const parseBlockBody = (
  lines: string[],
  startIndex: number,
): { attributes: Record<string, unknown>; nextIndex: number } => {
  const attributes: Record<string, unknown> = {};
  let index = startIndex;

  while (index < lines.length) {
    const line = lines[index] ?? "";
    const trimmed = line.trim();

    // Closing brace of the current block — stop and report where we ended.
    if (trimmed === "}" || trimmed.startsWith("}")) {
      return { attributes, nextIndex: index + 1 };
    }

    // Named nested block opener, e.g. `ingress {` or `tags = {` is NOT this
    // (that's an assignment). A block opener has no `=` before the brace.
    const blockOpener = trimmed.match(/^([a-zA-Z_][a-zA-Z0-9_-]*)\s*\{$/);
    if (blockOpener) {
      const blockName = blockOpener[1];
      const nested = parseBlockBody(lines, index + 1);
      const existing = attributes[blockName];
      const item = nested.attributes;
      if (Array.isArray(existing)) {
        existing.push(item);
      } else {
        attributes[blockName] = [item];
      }
      index = nested.nextIndex;
      continue;
    }

    const assignment = trimmed.match(/^([a-zA-Z0-9_.-]+)\s*=\s*(.*)$/);
    if (assignment) {
      const [, key, rawValue] = assignment;
      const parsed = parseHclValueToAttribute(rawValue);
      if (parsed !== INVALID_HCL_VALUE) {
        attributes[key] = parsed;
      }
    }

    index += 1;
  }

  return { attributes, nextIndex: index };
};

export const parseMainTfBlocks = (hcl: string): ParsedMainTfBlock[] => {
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

    const { attributes, nextIndex } = parseBlockBody(lines, index + 1);
    index = nextIndex;

    blocks.push({
      kind: blockKind,
      type: blockType,
      name: blockName,
      attributes,
    });
  }

  return blocks;
};

type HclBlockNode = {
  attributes: Record<string, unknown>;
  blocks: Record<string, HclBlockNode>;
};

// Inspector-side emission: renders a resource (with dotted-key attributes) into
// an HCL block, turning dotted keys into nested blocks. Uses the inspector
// `toHclLiteral` (see hclAttributes), intentionally distinct from the emitter.
export const buildHclFromResource = (resource: TerraformResource): string => {
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

  const renderAssignment = (key: string, value: unknown, indent: string): string =>
    `${indent}${key} = ${toHclLiteral(value)}\n`;

  const renderObjectBlock = (blockName: string, value: Record<string, unknown>, indent: string): string => {
    const entries = Object.entries(value).filter(([, item]) => isMeaningfulValue(item));
    if (!entries.length) return "";
    let lines = `${indent}${blockName} {\n`;
    entries.forEach(([k, v]) => { lines += renderAssignment(k, v, `${indent}  `); });
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
