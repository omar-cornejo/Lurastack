import { useEffect, useMemo, useState } from "react";
import type { Edge, Node } from "reactflow";
import { getCurrentWebviewWindow } from "@tauri-apps/api/webviewWindow";
import { invoke } from "@tauri-apps/api/core";
import BottomPanel from "./BottomPanel";
import type { CanvasEdgeData, CanvasTerraformNodeData } from "../canvas/types";
import type { TerraformResource } from "../models/terraform";
import { TEST_NODE_SCHEMAS } from "../models/testNodes";
import type { BottomPanelLogEntry } from "../types/logs";

const BOTTOM_PANEL_CHANNEL = "ddf-bottompanel-sync";
const POPOUT_HEARTBEAT_INTERVAL_MS = 300;

const readQueryParam = (key: string) => {
  if (typeof window === "undefined") return "";
  const params = new URLSearchParams(window.location.search);
  return params.get(key) ?? "";
};

export default function DetachedTerminalWindow() {
  const cwd = useMemo(() => readQueryParam("cwd"), []);
  const viewId = useMemo(() => readQueryParam("viewId"), []);
  const [syncedNodes, setSyncedNodes] = useState<Node<CanvasTerraformNodeData>[]>([]);
  const [syncedEdges, setSyncedEdges] = useState<Edge<CanvasEdgeData>[]>([]);
  const [syncedResources, setSyncedResources] = useState<TerraformResource[]>([]);
  const [syncedLogs, setSyncedLogs] = useState<BottomPanelLogEntry[]>([]);
  const [isClosing, setIsClosing] = useState(false);

  const handlePopdown = async () => {
    setIsClosing(true);
    if (typeof BroadcastChannel !== "undefined") {
      const channel = new BroadcastChannel(BOTTOM_PANEL_CHANNEL);
      channel.postMessage({
        type: "popout-close",
        viewId,
      });
      channel.close();
    }

    try {
      const currentWindow = getCurrentWebviewWindow();
      await invoke("close_detached_terminal_window", { label: currentWindow.label });
    } catch {
      // ignore close errors
    }
  };

  useEffect(() => {
    if (typeof BroadcastChannel === "undefined" || !viewId) return;

    const channel = new BroadcastChannel(BOTTOM_PANEL_CHANNEL);

    channel.onmessage = (event: MessageEvent) => {
      const message = event.data as
        | {
            type?: string;
            viewId?: string;
            payload?: {
              nodes?: Node<CanvasTerraformNodeData>[];
              edges?: Edge<CanvasEdgeData>[];
              resources?: TerraformResource[];
              logs?: BottomPanelLogEntry[];
            };
          }
        | undefined;

      if (!message || message.viewId !== viewId) return;
      if (message.type !== "state-sync") return;

      const payload = message.payload;
      if (!payload) return;

      setSyncedNodes(Array.isArray(payload.nodes) ? payload.nodes : []);
      setSyncedEdges(Array.isArray(payload.edges) ? payload.edges : []);
      setSyncedResources(Array.isArray(payload.resources) ? payload.resources : []);
      setSyncedLogs(Array.isArray(payload.logs) ? payload.logs : []);
    };

    channel.postMessage({ type: "popout-open", viewId, timestamp: Date.now() });
    channel.postMessage({ type: "state-request", viewId });

    const heartbeatInterval = window.setInterval(() => {
      channel.postMessage({
        type: "heartbeat",
        viewId,
        timestamp: Date.now(),
      });
    }, POPOUT_HEARTBEAT_INTERVAL_MS);

    return () => {
      window.clearInterval(heartbeatInterval);
      channel.postMessage({ type: "popout-close", viewId });
      channel.close();
    };
  }, [viewId]);

  return (
    <div className="h-screen w-screen overflow-hidden bg-gray-100">
      <div className="h-9 flex items-center justify-end border-b border-gray-300 bg-white px-2">
        <button
          type="button"
          onClick={() => void handlePopdown()}
          className="px-2 py-1 rounded text-xs border border-gray-300 text-gray-600 hover:text-gray-800 bg-white"
          title="Return BottomPanel to main window"
        >
          Popdown
        </button>
      </div>
      {!isClosing ? (
        <BottomPanel
          mode="canvas"
          nodes={syncedNodes}
          edges={syncedEdges}
          resources={syncedResources}
          logs={syncedLogs}
          schemas={TEST_NODE_SCHEMAS}
          projectDir={cwd}
          viewId={viewId}
          showPopoutButton={false}
          onHeightChange={() => {
            // no-op in detached window
          }}
        />
      ) : (
        <div className="h-[calc(100vh-2.25rem)] w-full bg-gray-100" />
      )}
    </div>
  );
}
