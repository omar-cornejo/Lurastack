import React from "react";

export default function Header() {
  return (
    <header className="bg-gray-800 text-white p-2 flex items-center justify-between">
      <div className="text-lg font-semibold">Mi aplicación</div>
      <nav className="space-x-2">
        <button className="px-2 py-1 bg-gray-700 hover:bg-gray-600 rounded">Opción 1</button>
        <button className="px-2 py-1 bg-gray-700 hover:bg-gray-600 rounded">Opción 2</button>
      </nav>
    </header>
  );
}
