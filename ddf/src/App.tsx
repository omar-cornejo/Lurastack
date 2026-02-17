import "./App.css";
import Header from "./components/Header";
import { LeftPanel } from "./components/LeftPanel";
import CenterPanel from "./components/CenterPanel";
import { RightPanel } from "./components/RightPanel";
import BottomPanel from "./components/BottomPanel";

function App() {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />

      <div className="flex flex-1 overflow-hidden">
        <LeftPanel/>

        <main className="flex-1 overflow-auto bg-white">
          <CenterPanel />
        </main>

        <RightPanel/>
      </div>

      <BottomPanel />
    </div>
  );
}

export default App;
