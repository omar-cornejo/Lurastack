import { useCallback, useRef } from "react";
import type { Node, Edge } from "reactflow";
import type { CanvasTerraformNodeData, CanvasEdgeData } from "../canvas/types";
import type { TerraformProject } from "../models/terraform";

export interface CanvasSnapshot {
  nodes: Node<CanvasTerraformNodeData>[];
  edges: Edge<CanvasEdgeData>[];
  project: TerraformProject;
}

const MAX_HISTORY = 50;

export function useUndoRedo() {
  const pastRef = useRef<CanvasSnapshot[]>([]);
  const futureRef = useRef<CanvasSnapshot[]>([]);

  const pushSnapshot = useCallback((snapshot: CanvasSnapshot) => {
    pastRef.current = [...pastRef.current, snapshot].slice(-MAX_HISTORY);
    futureRef.current = [];
  }, []);

  const undo = useCallback(
    (
      currentSnapshot: CanvasSnapshot,
      restore: (snapshot: CanvasSnapshot) => void,
    ) => {
      const past = pastRef.current;
      if (!past.length) return;

      const previous = past[past.length - 1];
      pastRef.current = past.slice(0, -1);
      futureRef.current = [currentSnapshot, ...futureRef.current].slice(0, MAX_HISTORY);
      restore(previous);
    },
    [],
  );

  const redo = useCallback(
    (
      currentSnapshot: CanvasSnapshot,
      restore: (snapshot: CanvasSnapshot) => void,
    ) => {
      const future = futureRef.current;
      if (!future.length) return;

      const next = future[0];
      futureRef.current = future.slice(1);
      pastRef.current = [...pastRef.current, currentSnapshot].slice(-MAX_HISTORY);
      restore(next);
    },
    [],
  );

  const canUndo = () => pastRef.current.length > 0;
  const canRedo = () => futureRef.current.length > 0;

  return { pushSnapshot, undo, redo, canUndo, canRedo };
}
