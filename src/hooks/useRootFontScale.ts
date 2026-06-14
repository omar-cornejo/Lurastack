import { useEffect } from "react";
import { refreshUiScale } from "../utils/uiScale";

/**
 * Drives the resolution-aware UI scale: applies the root font-size on mount
 * and keeps it in sync as the window is resized or moved between displays.
 *
 * Mount once, high in the tree. All sizing logic lives in `utils/uiScale.ts`;
 * this hook only owns the React lifecycle so that module stays DOM-agnostic
 * and unit-testable.
 */
export const useRootFontScale = (): void => {
  useEffect(() => {
    refreshUiScale();

    let frame = 0;
    const onResize = () => {
      // Coalesce bursts of resize events into one recompute per frame.
      if (frame) return;
      frame = requestAnimationFrame(() => {
        frame = 0;
        refreshUiScale();
      });
    };

    window.addEventListener("resize", onResize);
    return () => {
      window.removeEventListener("resize", onResize);
      if (frame) cancelAnimationFrame(frame);
    };
  }, []);
};
