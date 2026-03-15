type HeaderProps = {
  onClearCanvas: () => void;
};

export default function Header({ onClearCanvas }: HeaderProps) {
  return (
    <header className="bg-gray-800 text-white p-2 flex items-center justify-between">
      <div className="text-lg font-semibold">Workspace</div>
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
