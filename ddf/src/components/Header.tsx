type HeaderProps = {
  onClearCanvas: () => void;
  activeSection: "canvas" | "code";
  onSectionChange?: (section: "canvas" | "code") => void;
};

export default function Header({
  onClearCanvas,
  activeSection,
  onSectionChange,
}: HeaderProps) {
  return (
    <header className="bg-gray-800 text-white p-2 flex items-center justify-between">
      <div className="flex items-center gap-3">
        <div className="text-lg font-semibold">Workspace</div>
        <nav className="flex items-center gap-1 rounded bg-gray-700 p-1">
          <button
            type="button"
            onClick={() => onSectionChange?.("canvas")}
            className={`rounded px-3 py-1 text-sm font-medium ${
              activeSection === "canvas"
                ? "bg-white text-gray-800"
                : "text-gray-200 hover:bg-gray-600"
            }`}
          >
            Canvas
          </button>
          <button
            type="button"
            onClick={() => onSectionChange?.("code")}
            className={`rounded px-3 py-1 text-sm font-medium ${
              activeSection === "code"
                ? "bg-white text-gray-800"
                : "text-gray-200 hover:bg-gray-600"
            }`}
          >
            Code
          </button>
        </nav>
      </div>
      <nav className="space-x-2">
        <button
          type="button"
          onClick={onClearCanvas}
          className="rounded bg-red-600 px-3 py-1 text-sm font-medium text-white hover:bg-red-500"
        >
          Borrar canvas
        </button>
      </nav>
    </header>
  );
}
