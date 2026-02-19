import "./App.css";
import { useState } from "react";
import Header from "./components/Header";
import { LeftPanel } from "./components/LeftPanel";
import CenterPanel from "./components/CenterPanel";
import { RightPanel } from "./components/RightPanel";
import BottomPanel from "./components/BottomPanel";

function App() {
  const [bottomHeight, setBottomHeight] = useState(288);

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      <Header />

      <div className="flex flex-1 overflow-hidden">
        <LeftPanel bottomHeight={bottomHeight} />

        <main className="flex-1 overflow-auto bg-white">
          <CenterPanel />
        </main>

        <RightPanel/>
      </div>

      <BottomPanel onHeightChange={setBottomHeight} />
    </div>
  );
}

export default App;
