// @vitest-environment jsdom
import { describe, it, expect, beforeEach } from "vitest";
import {
  computeUiScale,
  applyUiScale,
  getUiScale,
  subscribeUiScale,
  refreshUiScale,
  MIN_UI_SCALE,
  MAX_UI_SCALE,
  NEUTRAL_UI_SCALE,
  BASE_ROOT_FONT_PX,
} from "./uiScale";

describe("computeUiScale", () => {
  it("is exactly 1.0 at the 1080p reference width (1080p untouched)", () => {
    expect(computeUiScale(1920)).toBe(1);
  });

  it("shrinks gently below the reference on common laptop widths", () => {
    // 1366px is partway between the narrow floor (1280) and reference (1920),
    // so it lands between MIN and 1.0 — and not as low as a naive width/1920
    // ratio (0.71) would give.
    const at1366 = computeUiScale(1366);
    expect(at1366).toBeGreaterThan(MIN_UI_SCALE);
    expect(at1366).toBeLessThan(1);
    expect(at1366).toBeGreaterThan(0.85);
    // 1600px (e.g. 1600×900) is closer to the reference, so closer to 1.0.
    expect(computeUiScale(1600)).toBeGreaterThan(at1366);
    expect(computeUiScale(1600)).toBeLessThan(1);
  });

  it("never drops below MIN_UI_SCALE on very narrow viewports", () => {
    expect(computeUiScale(1280)).toBe(MIN_UI_SCALE);
    expect(computeUiScale(1024)).toBe(MIN_UI_SCALE);
    expect(computeUiScale(800)).toBe(MIN_UI_SCALE);
  });

  it("scales up linearly with width above the reference", () => {
    // 2560 / 1920 = 1.333…
    expect(computeUiScale(2560)).toBeCloseTo(2560 / 1920, 5);
  });

  it("clamps to MAX_UI_SCALE on very wide (4K/5K/8K) viewports", () => {
    expect(computeUiScale(3840)).toBe(MAX_UI_SCALE);
    expect(computeUiScale(5120)).toBe(MAX_UI_SCALE);
    expect(computeUiScale(7680)).toBe(MAX_UI_SCALE);
  });

  it("returns the neutral 1.0 for non-finite or non-positive widths", () => {
    expect(computeUiScale(0)).toBe(NEUTRAL_UI_SCALE);
    expect(computeUiScale(-100)).toBe(NEUTRAL_UI_SCALE);
    expect(computeUiScale(NaN)).toBe(NEUTRAL_UI_SCALE);
    // Infinity is non-finite, so it takes the safe-default branch.
    expect(computeUiScale(Infinity)).toBe(NEUTRAL_UI_SCALE);
  });
});

describe("applyUiScale / getUiScale / subscribeUiScale", () => {
  beforeEach(() => {
    // Reset to baseline between tests.
    applyUiScale(NEUTRAL_UI_SCALE);
    document.documentElement.style.fontSize = "";
  });

  it("sets the root font-size from BASE_ROOT_FONT_PX * scale", () => {
    applyUiScale(1.5);
    expect(getUiScale()).toBe(1.5);
    expect(document.documentElement.style.fontSize).toBe(
      `${BASE_ROOT_FONT_PX * 1.5}px`,
    );
  });

  it("clamps applied scale into [MIN, MAX]", () => {
    applyUiScale(99);
    expect(getUiScale()).toBe(MAX_UI_SCALE);
    applyUiScale(0.1);
    expect(getUiScale()).toBe(MIN_UI_SCALE);
  });

  it("notifies subscribers only when the scale actually changes", () => {
    const seen: number[] = [];
    const unsub = subscribeUiScale((s) => seen.push(s));

    applyUiScale(1.25);
    applyUiScale(1.25); // no-op, same value
    applyUiScale(1.4);

    expect(seen).toEqual([1.25, 1.4]);
    unsub();

    applyUiScale(1.1);
    expect(seen).toEqual([1.25, 1.4]); // no longer notified
  });
});

describe("refreshUiScale", () => {
  it("reads window.innerWidth and applies the computed scale", () => {
    const original = window.innerWidth;
    Object.defineProperty(window, "innerWidth", {
      value: 3840,
      configurable: true,
    });
    try {
      expect(refreshUiScale()).toBe(MAX_UI_SCALE);
      expect(getUiScale()).toBe(MAX_UI_SCALE);
    } finally {
      Object.defineProperty(window, "innerWidth", {
        value: original,
        configurable: true,
      });
      applyUiScale(NEUTRAL_UI_SCALE);
    }
  });
});
