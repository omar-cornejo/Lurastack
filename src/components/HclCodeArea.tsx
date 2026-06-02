import { useLayoutEffect, useRef } from "react";
import type { RefObject } from "react";
import { highlightHcl, highlightHclAttributeMode, type TypeHintResolver } from "../utils/hclHighlight";

type HclCodeAreaProps = {
  value: string;
  onChange?: (value: string) => void;
  onScroll?: () => void;
  onPaste?: (event: React.ClipboardEvent<HTMLTextAreaElement>) => void;
  textareaRef?: RefObject<HTMLTextAreaElement | null>;
  containerClassName?: string;
  /** Classes applied to both the pre and textarea (font, padding, etc.) */
  innerClassName?: string;
  /** When true, dims structural lines and highlights only editable attribute values */
  attributeMode?: boolean;
  /** When true, the Tab key inserts spaces instead of moving focus (free edit mode) */
  tabInsertsSpaces?: boolean;
  /** Resolver for inline type hints rendered next to attribute lines (attribute mode only) */
  typeHints?: TypeHintResolver;
};

export function HclCodeArea({
  value,
  onChange,
  onScroll,
  onPaste,
  textareaRef: externalRef,
  containerClassName = "",
  innerClassName = "",
  attributeMode = false,
  tabInsertsSpaces = false,
  typeHints,
}: HclCodeAreaProps) {
  const TAB_SPACES = "  ";
  const internalRef = useRef<HTMLTextAreaElement>(null);
  const textareaRef = (externalRef ?? internalRef) as RefObject<HTMLTextAreaElement | null>;
  const preRef = useRef<HTMLPreElement>(null);
  const selectionRef = useRef<{
    start: number;
    end: number;
    scrollTop: number;
    scrollLeft: number;
  } | null>(null);

  const highlighted = attributeMode
    ? highlightHclAttributeMode(value, typeHints)
    : highlightHcl(value);

  const captureSelection = (target?: HTMLTextAreaElement | null) => {
    const el = target ?? textareaRef.current;
    if (!el) return;
    selectionRef.current = {
      start: el.selectionStart,
      end: el.selectionEnd,
      scrollTop: el.scrollTop,
      scrollLeft: el.scrollLeft,
    };
  };

  useLayoutEffect(() => {
    const pending = selectionRef.current;
    const el = textareaRef.current;
    if (!pending || !el) return;
    const max = el.value.length;
    const start = Math.min(pending.start, max);
    const end = Math.min(pending.end, max);
    el.setSelectionRange(start, end);
    el.scrollTop = pending.scrollTop;
    el.scrollLeft = pending.scrollLeft;
    selectionRef.current = null;
  }, [value, textareaRef]);

  const handleScroll = () => {
    if (preRef.current && textareaRef.current) {
      preRef.current.scrollTop  = textareaRef.current.scrollTop;
      preRef.current.scrollLeft = textareaRef.current.scrollLeft;
    }
    captureSelection();
    onScroll?.();
  };

  const handleBeforeInput = () => {
    // Capture BEFORE the input changes the DOM
    captureSelection();
  };

  const handleChange = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
    captureSelection(event.currentTarget);
    onChange?.(event.target.value);
  };

  const handleKeyDown = (event: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if (event.key !== "Tab" || !tabInsertsSpaces || !onChange) return;
    event.preventDefault();
    const el = event.currentTarget;
    const start = el.selectionStart;
    const end = el.selectionEnd;
    const text = el.value;

    if (event.shiftKey) {
      // Outdent: remove up to TAB_SPACES.length leading spaces from each line in
      // the selection (or the caret's line when there's no selection).
      const lineStart = text.lastIndexOf("\n", start - 1) + 1;
      const segment = text.slice(lineStart, end);
      const dedented = segment.replace(
        new RegExp(`^ {1,${TAB_SPACES.length}}`, "gm"),
        "",
      );
      const removed = segment.length - dedented.length;
      if (removed === 0) return;
      const next = text.slice(0, lineStart) + dedented + text.slice(end);
      // Caret offset shrinks by however many spaces were stripped before it.
      const beforeCaret = text.slice(lineStart, start);
      const caretRemoved = beforeCaret.length - beforeCaret.replace(
        new RegExp(`^ {1,${TAB_SPACES.length}}`, "gm"),
        "",
      ).length;
      const nextStart = Math.max(lineStart, start - caretRemoved);
      selectionRef.current = {
        start: nextStart,
        end: Math.max(nextStart, end - removed),
        scrollTop: el.scrollTop,
        scrollLeft: el.scrollLeft,
      };
      onChange(next);
      return;
    }

    if (start !== end && text.slice(start, end).includes("\n")) {
      // Multi-line selection: indent every line in range.
      const lineStart = text.lastIndexOf("\n", start - 1) + 1;
      const segment = text.slice(lineStart, end);
      const indented = segment.replace(/^/gm, TAB_SPACES);
      const added = indented.length - segment.length;
      const next = text.slice(0, lineStart) + indented + text.slice(end);
      selectionRef.current = {
        start: start + TAB_SPACES.length,
        end: end + added,
        scrollTop: el.scrollTop,
        scrollLeft: el.scrollLeft,
      };
      onChange(next);
      return;
    }

    // Plain Tab: insert spaces at the caret.
    const next = text.slice(0, start) + TAB_SPACES + text.slice(end);
    const caret = start + TAB_SPACES.length;
    selectionRef.current = {
      start: caret,
      end: caret,
      scrollTop: el.scrollTop,
      scrollLeft: el.scrollLeft,
    };
    onChange(next);
  };

  return (
    <div className={`relative overflow-hidden ${containerClassName}`}>
      {/*
        Both layers must wrap identically or the caret drifts from the visible
        text. They use `whitespace-pre` (no wrapping) so each logical line maps
        to exactly one visual row in both the highlight <pre> and the <textarea>;
        long lines scroll horizontally instead of wrapping. Wrapping (pre-wrap)
        desynced the two layers because the <pre> also renders inline type hints
        (e.g. ` : string`) that the textarea doesn't, shifting where long lines
        wrapped and making clicks land on the wrong row.
      */}
      <pre
        ref={preRef}
        aria-hidden
        className={`pointer-events-none absolute inset-0 m-0 overflow-hidden whitespace-pre select-none ${innerClassName}`}
        style={{ color: "#d4d4d4" }}
        // eslint-disable-next-line react/no-danger
        dangerouslySetInnerHTML={{ __html: highlighted + "\n\u200B" }}
      />
      <textarea
        ref={textareaRef}
        value={value}
        onChange={onChange ? handleChange : undefined}
        onBeforeInput={onChange ? handleBeforeInput : undefined}
        onKeyDown={onChange ? handleKeyDown : undefined}
        onPaste={onChange ? onPaste : undefined}
        onScroll={handleScroll}
        readOnly={!onChange}
        spellCheck={false}
        wrap="off"
        className={`absolute inset-0 h-full w-full resize-none overflow-auto bg-transparent outline-none whitespace-pre ${innerClassName}`}
        style={{ color: "transparent", caretColor: "#d4d4d4" }}
      />
    </div>
  );
}
