import { useRef } from "react";
import type { RefObject } from "react";
import { highlightHcl } from "../utils/hclHighlight";

type HclCodeAreaProps = {
  value: string;
  onChange?: (value: string) => void;
  onScroll?: () => void;
  textareaRef?: RefObject<HTMLTextAreaElement | null>;
  containerClassName?: string;
  /** Classes applied to both the pre and textarea (font, padding, etc.) */
  innerClassName?: string;
};

export function HclCodeArea({
  value,
  onChange,
  onScroll,
  textareaRef: externalRef,
  containerClassName = "",
  innerClassName = "",
}: HclCodeAreaProps) {
  const internalRef = useRef<HTMLTextAreaElement>(null);
  const textareaRef = (externalRef ?? internalRef) as RefObject<HTMLTextAreaElement | null>;
  const preRef = useRef<HTMLPreElement>(null);

  const highlighted = highlightHcl(value);

  const handleScroll = () => {
    if (preRef.current && textareaRef.current) {
      preRef.current.scrollTop  = textareaRef.current.scrollTop;
      preRef.current.scrollLeft = textareaRef.current.scrollLeft;
    }
    onScroll?.();
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
        onChange={onChange ? (e) => onChange(e.target.value) : undefined}
        onScroll={handleScroll}
        readOnly={!onChange}
        spellCheck={false}
        className={`absolute inset-0 h-full w-full resize-none bg-transparent outline-none whitespace-pre-wrap ${innerClassName}`}
        style={{ color: "transparent", caretColor: "#d4d4d4" }}
      />
    </div>
  );
}
