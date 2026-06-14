/**
 * Resolution-aware UI scaling.
 *
 * The whole UI is laid out in rem (via Tailwind), so changing the root
 * font-size scales every panel, bar, modal and menu proportionally. This
 * module is the single source of truth for that scale factor.
 *
 * The goal is that a window of a given *physical* size shows the UI at the
 * same apparent size on a 1080p and a 4K monitor: at 100% OS scaling a 4K
 * panel covers half the physical area of a 1080p one, so we grow the root
 * font-size on wider/denser displays to compensate, while staying identical
 * to today's look on 1080p.
 *
 * The factor is also consumed by the parts of the UI that are NOT laid out in
 * rem and therefore can't follow the root font-size on their own: the
 * ReactFlow canvas node sizes (flow coordinates) and the xterm terminal
 * (a <canvas> with a pixel fontSize). Those read `getUiScale()` directly.
 */

/** Root font-size (px) that reproduces today's 1080p look. Tailwind's rem
 *  scale is built around 16px, and every legacy `[Npx]` value was migrated to
 *  rem assuming this base, so `BASE_ROOT_FONT_PX * uiScale` is the actual
 *  root font-size we set. */
export const BASE_ROOT_FONT_PX = 16;

/** Clamp so the UI never becomes uncomfortably small or cartoonishly large,
 *  regardless of the display. 1.0 keeps 1080p exactly as it is today; we allow
 *  a gentle shrink below it so the UI stays comfortable (and modals fit) on
 *  narrow laptop panels like 1366×768 or a window snapped to half a screen. */
export const MIN_UI_SCALE = 0.85;
export const MAX_UI_SCALE = 1.6;

/** The neutral, "no scaling" factor. Used as the safe default when there is no
 *  viewport to measure (server/test environments) or the width is invalid, so
 *  layout that runs without a DOM behaves exactly as it does at 1080p. */
export const NEUTRAL_UI_SCALE = 1;

/** Reference width (CSS px) at which scale is exactly 1.0 — a standard 1080p
 *  logical viewport. This is the pivot of the curve: 1080p is untouched. */
const REFERENCE_WIDTH = 1920;

/** Below the reference we shrink gently toward MIN_UI_SCALE, reaching it at
 *  this width (a typical small-laptop panel). The shallower slope here keeps
 *  laptops from collapsing to a tiny UI (a pure width/1920 ratio would give
 *  0.71 at 1366px; this curve gives ~0.88). */
const NARROW_FLOOR_WIDTH = 1280;

const clamp = (value: number, min: number, max: number): number =>
  Math.min(max, Math.max(min, value));

/**
 * Compute the UI scale factor for a given viewport.
 *
 * Pure function so it can be unit-tested without a DOM. We key off the CSS
 * pixel width of the viewport rather than the raw device pixels: a 4K monitor
 * at 100% OS scaling reports ~3840 CSS px wide, so the UI grows; the same
 * monitor at 200% OS scaling reports ~1920 CSS px (the OS already enlarged
 * everything), so we leave it at 1.0 and don't double-scale.
 *
 * The curve has two segments, both pinned at (1920px → 1.0) so 1080p is exact:
 *  - Above 1920px: grow linearly with width (width/1920), capped at MAX.
 *  - Below 1920px: shrink linearly toward MIN_UI_SCALE, reaching it at
 *    NARROW_FLOOR_WIDTH, then flat. Gentler than the upper slope so common
 *    laptops only compact slightly rather than collapsing.
 */
export const computeUiScale = (viewportWidthCssPx: number): number => {
  if (!Number.isFinite(viewportWidthCssPx) || viewportWidthCssPx <= 0) {
    return NEUTRAL_UI_SCALE;
  }
  if (viewportWidthCssPx >= REFERENCE_WIDTH) {
    return clamp(viewportWidthCssPx / REFERENCE_WIDTH, 1, MAX_UI_SCALE);
  }
  // Linear interpolation from (NARROW_FLOOR_WIDTH → MIN) to (REFERENCE → 1.0).
  const t =
    (viewportWidthCssPx - NARROW_FLOOR_WIDTH) /
    (REFERENCE_WIDTH - NARROW_FLOOR_WIDTH);
  return clamp(MIN_UI_SCALE + t * (1 - MIN_UI_SCALE), MIN_UI_SCALE, 1);
};

// Seed eagerly from the current viewport so `getUiScale()` is already correct
// when read inside `useState` initializers (which run before the
// useRootFontScale effect). Falls back to the neutral 1.0 outside the browser.
let currentScale =
  typeof window !== "undefined"
    ? computeUiScale(window.innerWidth)
    : NEUTRAL_UI_SCALE;
const subscribers = new Set<(scale: number) => void>();

/** The current UI scale factor (1.0 on 1080p). Read by the canvas/terminal. */
export const getUiScale = (): number => currentScale;

/**
 * Scale a px design value (measured at the 1080p baseline) by the current UI
 * scale, rounded to a whole pixel. For one-shot sizing that lives in JS rather
 * than rem/Tailwind — e.g. a resizable panel's initial width, or ReactFlow node
 * dimensions — so it opens proportionally larger on a 4K display.
 */
export const scaledPx = (basePx: number): number =>
  Math.round(basePx * currentScale);

/** Subscribe to scale changes (e.g. to refit the terminal). Returns an
 *  unsubscribe function. */
export const subscribeUiScale = (fn: (scale: number) => void): (() => void) => {
  subscribers.add(fn);
  return () => {
    subscribers.delete(fn);
  };
};

let domApplied = false;

/**
 * Apply a scale: set the root font-size and notify subscribers. Idempotent on
 * the scale value, so it's safe to call on every resize — but always writes the
 * inline font-size the first time, since the eager seed means `currentScale`
 * may already equal the target before we've ever touched the DOM.
 */
export const applyUiScale = (scale: number): void => {
  const next = clamp(scale, MIN_UI_SCALE, MAX_UI_SCALE);
  if (next === currentScale && domApplied) return;
  currentScale = next;
  if (typeof document !== "undefined") {
    document.documentElement.style.fontSize = `${BASE_ROOT_FONT_PX * next}px`;
    domApplied = true;
  }
  for (const fn of subscribers) fn(next);
};

/**
 * Recompute and apply the scale from the current window size. Returns the
 * applied scale. No-op outside the browser.
 */
export const refreshUiScale = (): number => {
  if (typeof window === "undefined") return currentScale;
  const next = computeUiScale(window.innerWidth);
  applyUiScale(next);
  return next;
};
