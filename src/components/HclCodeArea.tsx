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
  typeHints,
}: HclCodeAreaProps) {
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
