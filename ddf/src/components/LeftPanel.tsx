import { useState, useRef, useEffect } from "react";
import { Icon } from '@iconify/react';


export const LeftPanel = () => {
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;

      const rect = panelRef.current.getBoundingClientRect();
      const newWidth = e.clientX - rect.left;

      const minWidth = 200;
      const maxWidth = 600;

      if (newWidth >= minWidth && newWidth <= maxWidth) {
        setWidth(newWidth);
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
      style={{ width: visible ? width : 12 }}
      className={`relative bg-gray-100 border-r flex-none
    ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {visible && (
        <div 
          onMouseDown={() => setIsResizing(true)}
          className="absolute right-0 top-0 h-full w-1 cursor-col-resize bg-transparent hover:bg-gray-300"
        />
      )}

      {visible && (
        <div className="p-2 flex items-center justify-between">
          <strong>Izquierda</strong>
        </div>
      )}

      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible((v) => !v);
        }}
        className="absolute right-0 top-1/2 transform translate-x-1/2 -translate-y-1/2 px-2 py-1 bg-gray-200 rounded z-10 flex items-center justify-center"
        aria-expanded={visible}
        aria-controls="left-panel-content"
        aria-label={visible ? 'Cerrar panel izquierdo' : 'Mostrar panel izquierdo'}
        type="button"
      >
        <Icon
          icon="weui:arrow-filled"
          className={`transition-transform ${visible ? "rotate-180" : ""}`}
          width={10}
          height={18}
          aria-hidden="true"
        />
      </button>

      {visible && (
        <div id="left-panel-content" className="p-2">
          <p>Contenido del panel izquierdo.</p>
        </div>
      )}
    </aside>
  );
}
