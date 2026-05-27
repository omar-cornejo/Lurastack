function esc(s: string): string {
  return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

const C = {
  comment: "#6a9955",
  string:  "#ce9178",
  number:  "#b5cea8",
  keyword: "#569cd6",
  bool:    "#569cd6",
  nil:     "#569cd6",
  attrKey: "#9cdcfe",
  ref:     "#9cdcfe",
  interp:  "#569cd6",
  default: "#d4d4d4",
} as const;

const HCL_KEYWORDS = new Set([
  "resource", "data", "variable", "output", "locals", "local",
  "module", "terraform", "provider", "required_providers",
  "dynamic", "content", "lifecycle", "backend", "moved",
  "import", "check", "removed",
]);

function sp(color: string, text: string): string {
  return `<span style="color:${color}">${esc(text)}</span>`;
}

function scanString(src: string, start: number): { html: string; end: number } {
  const n = src.length;
  const parts: string[] = [sp(C.string, '"')];
  let i = start + 1;

  while (i < n) {
    const ch = src[i];

    if (ch === '"') { parts.push(sp(C.string, '"')); i++; break; }
    if (ch === "\n") break;

    if (ch === "\\") {
      const next = src[i + 1] ?? "";
      parts.push(sp(C.string, "\\" + next));
      i += 2;
      continue;
    }

    if ((ch === "$" || ch === "%") && src[i + 1] === "{") {
      parts.push(sp(C.interp, ch + "{"));
      i += 2;
      let depth = 1;
      while (i < n && depth > 0) {
        if (src[i] === "{") { depth++; parts.push(esc("{")); i++; }
        else if (src[i] === "}") {
          depth--;
          parts.push(depth === 0 ? sp(C.interp, "}") : esc("}"));
          i++;
        } else if (src[i] === '"') {
          const nested = scanString(src, i);
          parts.push(nested.html);
          i = nested.end;
        } else if (/[a-zA-Z_]/.test(src[i])) {
          let end = i;
          while (end < n && /[a-zA-Z0-9_.-]/.test(src[end])) end++;
          const w = src.slice(i, end);
          parts.push(w === "true" || w === "false" || w === "null"
            ? sp(C.bool, w) : sp(C.ref, w));
          i = end;
        } else if (/[0-9]/.test(src[i])) {
          let end = i;
          while (end < n && /[0-9._]/.test(src[end])) end++;
          parts.push(sp(C.number, src.slice(i, end)));
          i = end;
        } else { parts.push(esc(src[i])); i++; }
      }
      continue;
    }

    let end = i;
    while (
      end < n &&
      src[end] !== '"' && src[end] !== "\\" && src[end] !== "\n" &&
      !(src[end] === "$" && src[end + 1] === "{") &&
      !(src[end] === "%" && src[end + 1] === "{")
    ) end++;
    if (end > i) { parts.push(sp(C.string, src.slice(i, end))); i = end; }
  }

  return { html: parts.join(""), end: i };
}

// Resolves the type label for an attribute on a resource at a given block
// path (e.g. ["route"] for nested blocks). Implementations should return
// undefined when no schema info is available so the hint is omitted.
export type TypeHintResolver = (
  resourceHeader: { kind: "resource" | "data"; type: string; name: string } | null,
  blockPath: string[],
  attributeName: string,
) => string | undefined;

// Attribute-mode highlight: dims structural lines and the key portion of attribute
// lines, leaving only the value zone (right side of `=`) at full brightness with
// a subtle background so users immediately see what is editable. When a
// `typeHints` resolver is supplied, each attribute line gets a faded inline
// type label suffix (e.g. `: string`) to mirror the RightPanel info tab.
export function highlightHclAttributeMode(
  source: string,
  typeHints?: TypeHintResolver,
): string {
  const lines = source.split("\n");
  let currentHeader: { kind: "resource" | "data"; type: string; name: string } | null = null;
  const blockPath: string[] = [];
  let depth = 0;

  return lines
    .map((line) => {
      const trimmed = line.trim();

      const headerMatch = trimmed.match(/^(resource|data)\s+"([^"]+)"\s+"([^"]+)"\s*\{\s*$/);
      const namedBlockOpen = !headerMatch && trimmed.match(/^([a-zA-Z_][a-zA-Z0-9_-]*)\s*\{\s*$/);
      const opens = (line.match(/{/g) ?? []).length;
      const closes = (line.match(/}/g) ?? []).length;
      const lineDepthAtStart = depth;

      if (headerMatch) {
        currentHeader = {
          kind: headerMatch[1] as "resource" | "data",
          type: headerMatch[2] ?? "",
          name: headerMatch[3] ?? "",
        };
      } else if (namedBlockOpen && lineDepthAtStart >= 1) {
        blockPath.push(namedBlockOpen[1]);
      }

      const m = line.match(/^(\s*[a-zA-Z_][a-zA-Z0-9_-]*\s*=\s*)(.*)/);
      let rendered: string;
      if (m && lineDepthAtStart >= 1) {
        const keyHtml = `<span style="opacity:0.38">${highlightHcl(m[1] ?? "")}</span>`;
        const valHtml =
          `<span style="background:rgba(96,165,250,0.10);border-radius:2px;` +
          `box-shadow:0 0 0 1px rgba(96,165,250,0.22)">${highlightHcl(m[2] ?? "")}</span>`;

        let hintHtml = "";
        if (typeHints) {
          const keyMatch = (m[1] ?? "").match(/^\s*([a-zA-Z_][a-zA-Z0-9_-]*)\s*=/);
          const attrName = keyMatch?.[1];
          if (attrName) {
            const label = typeHints(currentHeader, [...blockPath], attrName);
            if (label) {
              hintHtml =
                `<span style="opacity:0.45;color:#9ca3af;font-style:italic">` +
                ` : ${esc(label)}</span>`;
            }
          }
        }

        rendered = keyHtml + valHtml + hintHtml;
      } else {
        rendered = `<span style="opacity:0.35">${highlightHcl(line)}</span>`;
      }

      depth += opens - closes;
      if (depth < 0) depth = 0;

      // Pop block path when a nested block closes (depth dropped back below its push level)
      if (closes > 0) {
        const closeCount = closes;
        for (let c = 0; c < closeCount; c += 1) {
          if (blockPath.length > 0 && depth < blockPath.length + 1) {
            blockPath.pop();
          }
        }
        if (depth === 0) {
          currentHeader = null;
          blockPath.length = 0;
        }
      }

      return rendered;
    })
    .join("\n");
}

export function highlightHcl(source: string): string {
  const out: string[] = [];
  let i = 0;
  const n = source.length;

  while (i < n) {
    const ch = source[i];

    // Whitespace / newlines
    if (ch === " " || ch === "\t" || ch === "\r" || ch === "\n") {
      let end = i;
      while (end < n && (source[end] === " " || source[end] === "\t" || source[end] === "\r" || source[end] === "\n")) end++;
      out.push(esc(source.slice(i, end)));
      i = end;
      continue;
    }

    // Line comment
    if (ch === "#" || (ch === "/" && source[i + 1] === "/")) {
      let end = i;
      while (end < n && source[end] !== "\n") end++;
      out.push(sp(C.comment, source.slice(i, end)));
      i = end;
      continue;
    }

    // Block comment
    if (ch === "/" && source[i + 1] === "*") {
      let end = i + 2;
      while (end < n - 1 && !(source[end] === "*" && source[end + 1] === "/")) end++;
      if (end < n - 1) end += 2;
      out.push(sp(C.comment, source.slice(i, end)));
      i = end;
      continue;
    }

    // String
    if (ch === '"') {
      const { html, end } = scanString(source, i);
      out.push(html);
      i = end;
      continue;
    }

    // Number
    if (/[0-9]/.test(ch)) {
      let end = i;
      while (end < n && /[0-9._eExXa-fA-F]/.test(source[end])) end++;
      out.push(sp(C.number, source.slice(i, end)));
      i = end;
      continue;
    }

    // Identifier / keyword / reference
    if (/[a-zA-Z_]/.test(ch)) {
      let end = i;
      while (end < n && /[a-zA-Z0-9_-]/.test(source[end])) end++;
      const word = source.slice(i, end);

      if (word === "true" || word === "false") { out.push(sp(C.bool, word)); i = end; continue; }
      if (word === "null")  { out.push(sp(C.nil,  word)); i = end; continue; }
      if (HCL_KEYWORDS.has(word)) { out.push(sp(C.keyword, word)); i = end; continue; }

      // Reference (followed by '.')
      if (source[end] === ".") {
        let refEnd = end + 1;
        while (refEnd < n && /[a-zA-Z0-9_.-]/.test(source[refEnd])) refEnd++;
        while (refEnd > end && source[refEnd - 1] === ".") refEnd--;
        out.push(sp(C.ref, source.slice(i, refEnd)));
        i = refEnd;
        continue;
      }

      // Attribute key (identifier then optional spaces then '=' but not '==')
      let j = end;
      while (j < n && (source[j] === " " || source[j] === "\t")) j++;
      if (j < n && source[j] === "=" && source[j + 1] !== "=") {
        out.push(sp(C.attrKey, word));
        i = end;
        continue;
      }

      out.push(sp(C.default, word));
      i = end;
      continue;
    }

    out.push(esc(ch));
    i++;
  }

  return out.join("");
}
