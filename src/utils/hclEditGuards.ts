// Guards that keep "attribute-value-only" edits in the HCL editor structural:
// the user may change the right-hand side of `key =` lines but not block
// headers, braces, or whitespace structure. Extracted verbatim from CodePanel
// so the edit-restriction rule is unit-testable.

// Returns the character ranges [start, end] that correspond to the value portion
// of attribute-assignment lines (the part after `=`). Block headers, closing braces,
// and blank lines produce no ranges. For string values (wrapped in outer quotes),
// the range covers only the content INSIDE the outer quotes so the wrappers are protected.
export const getAttributeValueRanges = (text: string): Array<{ start: number; end: number }> => {
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

export const isPositionInAttributeValue = (text: string, position: number): boolean =>
  getAttributeValueRanges(text).some(
    // range.end + 1 allows inserting just before the closing wrapper quote
    (range) => position >= range.start && position <= range.end + 1,
  );

export const isRangeInAttributeValues = (text: string, start: number, end: number): boolean => {
  if (end <= start) return true;
  return getAttributeValueRanges(text).some(
    (range) => start >= range.start && end <= range.end,
  );
};

// Returns true only if the diff between `previous` and `next` falls entirely
// within attribute-value zones (right-hand side of `key =` lines).
// Newline insertion is always blocked to prevent structural changes.
export const canEditOnlyInAttributeValues = (previous: string, next: string): boolean => {
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

export const pruneEmptyAttributeAssignments = (hcl: string): string => {
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
