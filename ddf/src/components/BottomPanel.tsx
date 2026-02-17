import { useState, useRef, useEffect } from "react";
import { Icon } from '@iconify/react';



export default function BottomPanel() {
  const [open, setOpen] = useState(true);
  const [height, setHeight] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;

      const rect = panelRef.current.getBoundingClientRect();
      const newHeight = rect.bottom - e.clientY;

      const minHeight = 100;
      const maxHeight = 300;

      if (newHeight >= minHeight && newHeight <= maxHeight) {
        setHeight(newHeight);
      }
    };

    const handleMouseUp = () => {
      setIsResizing(false);
    };

    if (isResizing) {
      document.addEventListener("mousemove", handleMouseMove);
      document.addEventListener("mouseup", handleMouseUp);
    }

    return () => {
      document.removeEventListener("mousemove", handleMouseMove);
      document.removeEventListener("mouseup", handleMouseUp);
    };
  }, [isResizing]);

  return (
    <aside
      ref={panelRef}
      style={{ height: open ? height : 12 }}
      className={`relative bg-gray-100 border-l flex-none
    ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {open && (
        <div
          onMouseDown={() => setIsResizing(true)}
          className="absolute top-0 left-0 w-full h-1 cursor-row-resize bg-transparent hover:bg-gray-300"
        />
      )}

      {open && (
      <div className="p-2 flex items-center justify-between">
        <strong>Abajo</strong>
      </div>
      )}

      {open && (
        <div className="p-2">
          <p>Contenido del panel inferior (no muy grande).</p>
        </div>
      )}

      <button
        onClick={(e) => {
          e.stopPropagation();
          setOpen((o) => !o);
        }}
        className="absolute left-1/2 top-0 transform -translate-x-1/2 -translate-y-1/2 px-2 py-1 bg-gray-200 rounded z-10 flex items-center justify-center"
        aria-expanded={open}
        aria-controls="bottom-panel-content"
        aria-label={open ? 'Cerrar panel inferior' : 'Mostrar panel inferior'}
        type="button"
      >
          <Icon
            icon="weui:more-filled"
            className={`transition-transform ${open ? 'rotate-180' : ''}`}
            width={14}
            height={14}
            aria-hidden="true"
          />
      </button>
    </aside>
  );
}
