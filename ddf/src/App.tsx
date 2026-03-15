import "./App.css";
import { useState, useRef } from "react";
import GlobalBar from "./components/GlobalBar";
import WorkspaceView from "./components/WorkspaceView";
import { ViewInfo } from "./types/views";
import { Toaster } from "sileo";

let viewCounter = 1;

function createView(): ViewInfo {
  return {
    id: crypto.randomUUID(),
    name: `View ${viewCounter++}`,
  };
}

function App() {
  const initialView = useRef<ViewInfo | null>(null);
  if (!initialView.current) initialView.current = createView();

  const [views, setViews] = useState<ViewInfo[]>([initialView.current]);
  const [activeViewId, setActiveViewId] = useState<string>(initialView.current.id);

  const handleCreateView = () => {
    const newView = createView();
    setViews((prev) => [...prev, newView]);
    setActiveViewId(newView.id);
  };

  const handleCloseView = (id: string) => {
    setViews((prev) => {
      const closedIndex = prev.findIndex((v) => v.id === id);
      const updated = prev.filter((v) => v.id !== id);

      // Re-index names so they stay in order and the counter doesn't grow infinitely
      const reindexed = updated.map((v, i) => ({ ...v, name: `View ${i + 1}` }));
      // Keep counter one above the current number of views
      viewCounter = reindexed.length + 1;

      if (activeViewId === id && reindexed.length > 0) {
        const nextIndex = Math.min(closedIndex, reindexed.length - 1);
        setActiveViewId(reindexed[nextIndex].id);
      }

      return reindexed;
    });
  };

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      <Toaster
        position="top-center"
        offset={{ top: 56 }}
      />

      {/* Global bar: always visible, above all views */}
      <GlobalBar
        views={views}
        activeViewId={activeViewId}
        onSwitchView={setActiveViewId}
        onCreateView={handleCreateView}
        onCloseView={handleCloseView}
      />

      {/* Render all views but only show the active one — preserves their state */}
      <div className="flex flex-1 overflow-hidden relative">
        {views.map((view) => (
          <div
            key={view.id}
            className="absolute inset-0 flex flex-col"
            style={{ display: view.id === activeViewId ? "flex" : "none" }}
          >
            <WorkspaceView viewId={view.id} />
          </div>
        ))}
      </div>
    </div>
  );
}

export default App;
