// @vitest-environment jsdom
import { describe, it, expect, vi } from "vitest";
import { renderHook, act } from "@testing-library/react";
import { useUndoRedo, type CanvasSnapshot } from "./useUndoRedo";

// Each snapshot is tagged via its project.provider so we can assert exactly
// which one was restored.
const snap = (tag: string): CanvasSnapshot => ({
  nodes: [],
  edges: [],
  project: { provider: tag, resources: [] },
});

describe("useUndoRedo", () => {
  it("starts with nothing to undo or redo", () => {
    const { result } = renderHook(() => useUndoRedo());
    expect(result.current.canUndo()).toBe(false);
    expect(result.current.canRedo()).toBe(false);
  });

  it("restores the previous snapshot on undo", () => {
    const { result } = renderHook(() => useUndoRedo());
    act(() => result.current.pushSnapshot(snap("v1")));
    expect(result.current.canUndo()).toBe(true);

    const restore = vi.fn();
    act(() => result.current.undo(snap("current"), restore));
    expect(restore).toHaveBeenCalledWith(expect.objectContaining({ project: { provider: "v1", resources: [] } }));
    expect(result.current.canRedo()).toBe(true);
  });

  it("round-trips undo → redo", () => {
    const { result } = renderHook(() => useUndoRedo());
    act(() => result.current.pushSnapshot(snap("v1")));

    const undoRestore = vi.fn();
    act(() => result.current.undo(snap("v2"), undoRestore));
    // undo restored v1; the "current" v2 went onto the future stack.
    expect(undoRestore.mock.calls[0][0].project.provider).toBe("v1");

    const redoRestore = vi.fn();
    act(() => result.current.redo(snap("v1-again"), redoRestore));
    // redo restores the snapshot that was current at undo time (v2).
    expect(redoRestore.mock.calls[0][0].project.provider).toBe("v2");
  });

  it("clears the redo stack when a new snapshot is pushed", () => {
    const { result } = renderHook(() => useUndoRedo());
    act(() => result.current.pushSnapshot(snap("v1")));
    act(() => result.current.undo(snap("v2"), vi.fn()));
    expect(result.current.canRedo()).toBe(true);

    // A fresh action invalidates redo.
    act(() => result.current.pushSnapshot(snap("v3")));
    expect(result.current.canRedo()).toBe(false);
  });

  it("is a no-op when there is nothing to undo or redo", () => {
    const { result } = renderHook(() => useUndoRedo());
    const restore = vi.fn();
    act(() => result.current.undo(snap("current"), restore));
    act(() => result.current.redo(snap("current"), restore));
    expect(restore).not.toHaveBeenCalled();
  });

  it("caps the past stack at MAX_HISTORY (50) entries", () => {
    const { result } = renderHook(() => useUndoRedo());
    act(() => {
      for (let i = 0; i < 60; i += 1) result.current.pushSnapshot(snap(`v${i}`));
    });

    // Drain the undo stack and count how many restores happen.
    let undos = 0;
    act(() => {
      while (result.current.canUndo()) {
        result.current.undo(snap("current"), () => {});
        undos += 1;
      }
    });
    expect(undos).toBe(50);
  });
});
