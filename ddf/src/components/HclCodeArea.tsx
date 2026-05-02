import { useLayoutEffect, useRef } from "react";
import type { RefObject } from "react";
import { highlightHcl, highlightHclAttributeMode, type TypeHintResolver } from "../utils/hclHighlight";

type HclCodeAreaProps = {
  value: string;
  onChange?: (value: string) => void;
  onScroll?: () => void;
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
      {/* Highlighted layer */}
      <pre
        ref={preRef}
        aria-hidden
        className={`pointer-events-none absolute inset-0 m-0 overflow-hidden whitespace-pre-wrap break-words select-none ${innerClassName}`}
        style={{ color: "#d4d4d4" }}
        // eslint-disable-next-line react/no-danger
        dangerouslySetInnerHTML={{ __html: highlighted + "\n\u200B" }}
      />
      {/* Editable layer */}
      <textarea
        ref={textareaRef}
        value={value}
        onChange={onChange ? handleChange : undefined}
        onBeforeInput={onChange ? handleBeforeInput : undefined}
        onScroll={handleScroll}
        readOnly={!onChange}
        spellCheck={false}
        className={`absolute inset-0 h-full w-full resize-none bg-transparent outline-none whitespace-pre-wrap ${innerClassName}`}
        style={{ color: "transparent", caretColor: "#d4d4d4" }}
      />
    </div>
  );
}
