// Reference normalization + dotted-key nested attribute read/write, extracted
// verbatim from RightPanel. These encode the convention the edge mapper and the
// inspector both use to store cross-resource references and nested attributes.

import type { TerraformResource } from "../models/terraform";
import { NODE_SCHEMAS } from "../models/nodeRegistry";
import { terraformRefPattern, isPlainObject } from "./hclAttributes";

// Resolves an abbreviated reference (e.g. `subnet.web.id`) to its canonical
// form (`aws_subnet.web.id`, or `data.<type>.<name>.<attr>`) using the schema
// catalog + the project's resources. Returns the raw value unchanged when it is
// already canonical, a var.* expression, or cannot be resolved.
export const normalizeMappedReference = (
  rawValue: string,
  targetPropertyName: string,
  resources: TerraformResource[],
): string => {
  const trimmed = rawValue.trim();
  if (!trimmed) return rawValue;
  if (terraformRefPattern.test(trimmed) || trimmed.startsWith("var.")) {
    return trimmed;
  }

  const match = trimmed.match(/^([a-zA-Z0-9_-]+)\.([a-zA-Z0-9_]+)(?:\.([a-zA-Z0-9_]+))?$/);
  if (!match) return rawValue;

  const [, schemaOrType, resourceName, explicitAttr] = match;
  const schema = NODE_SCHEMAS.find(
    (candidate) =>
      candidate.id.toLowerCase() === schemaOrType.toLowerCase() ||
      candidate.terraformType.toLowerCase() === schemaOrType.toLowerCase(),
  );

  if (!schema) return rawValue;

  const resource = resources.find(
    (candidate) =>
      candidate.name === resourceName &&
      (candidate.schemaId === schema.id || candidate.type === schema.terraformType),
  );

  if (!resource) return rawValue;

  const attr = explicitAttr ?? (targetPropertyName.endsWith("_id") ? "id" : "id");
  const prefix = resource.kind === "data" ? "data." : "";
  return `${prefix}${schema.terraformType}.${resource.name}.${attr}`;
};

// Read an attribute by its dotted key, falling back to a nested lookup
// inside block-shaped containers ({foo: [{bar: ...}]} or {foo: {bar: ...}}),
// which is the shape applyEdgeMapping persists for non-root targets.
export const readNestedAttribute = (
  attrs: Record<string, unknown>,
  dottedKey: string,
): unknown => {
  if (Object.prototype.hasOwnProperty.call(attrs, dottedKey)) {
    return attrs[dottedKey];
  }
  const parts = dottedKey.split(".").filter(Boolean);
  if (parts.length < 2) return undefined;

  let cursor: unknown = attrs[parts[0]];
  for (let i = 1; i < parts.length; i++) {
    if (cursor === undefined || cursor === null) return undefined;
    if (Array.isArray(cursor)) {
      // Block-list form: read from the first entry (the only one applyEdgeMapping writes to)
      if (cursor.length === 0) return undefined;
      cursor = cursor[0];
    }
    if (!isPlainObject(cursor)) return undefined;
    const childKey = parts.slice(i).join(".");
    if (Object.prototype.hasOwnProperty.call(cursor, childKey)) {
      return (cursor as Record<string, unknown>)[childKey];
    }
    cursor = (cursor as Record<string, unknown>)[parts[i]];
  }
  return cursor;
};

// Write/remove an attribute keyed by a dotted path, mirroring the convention
// applyEdgeMapping uses so the inspector and the edge mapper agree.
export const writeNestedAttribute = (
  attrs: Record<string, unknown>,
  dottedKey: string,
  value: unknown,
): Record<string, unknown> => {
  const next = { ...attrs };
  const shouldDelete = value === "" || value === null || value === undefined;
  const parts = dottedKey.split(".").filter(Boolean);

  if (parts.length <= 1) {
    if (shouldDelete) delete next[dottedKey];
    else next[dottedKey] = value;
    return next;
  }

  // Always clean up a legacy dotted-key entry if present.
  delete next[dottedKey];

  const blockKey = parts[0];
  const childPath = parts.slice(1).join(".");
  const existing = next[blockKey];

  if (Array.isArray(existing) && existing.length > 0 && existing.every((it) => isPlainObject(it))) {
    const items = existing.map((item, idx) => {
      if (idx !== 0) return item;
      const copy = { ...(item as Record<string, unknown>) };
      if (shouldDelete) delete copy[childPath];
      else copy[childPath] = value;
      return copy;
    });
    const firstHasContent = isPlainObject(items[0]) && Object.keys(items[0]).length > 0;
    if (!firstHasContent && items.length === 1) {
      delete next[blockKey];
    } else {
      next[blockKey] = items;
    }
  } else if (isPlainObject(existing)) {
    const copy = { ...(existing as Record<string, unknown>) };
    if (shouldDelete) delete copy[childPath];
    else copy[childPath] = value;
    if (Object.keys(copy).length === 0) {
      delete next[blockKey];
    } else {
      next[blockKey] = copy;
    }
  } else if (!shouldDelete) {
    next[blockKey] = [{ [childPath]: value }];
  }

  return next;
};
