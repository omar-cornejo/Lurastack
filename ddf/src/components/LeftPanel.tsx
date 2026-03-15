import { useState, useRef, useEffect } from "react";
import { Icon } from '@iconify/react';

type IconGroups = {
  [folder: string]: string[];
};

type LeftPanelProps = {
  bottomHeight: number;
  addResource: (type: string, icon: string) => void;
};

export const LeftPanel = ({ bottomHeight, addResource }: LeftPanelProps) => {
  const [visible, setVisible] = useState(false);
  const [width, setWidth] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const [icons, setIcons] = useState<IconGroups>({});
  const [search, setSearch] = useState("");

  useEffect(() => {
    fetch("/icons/manifest.json")
      .then(res => res.json())
      .then(data => setIcons(data));
  }, []);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing || !panelRef.current) return;
      const rect = panelRef.current.getBoundingClientRect();
      const newWidth = e.clientX - rect.left;
      if (newWidth >= 200 && newWidth <= 600) setWidth(newWidth);
    };
    const handleMouseUp = () => {
      document.body.style.userSelect = "";
      document.body.style.cursor = "";
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
      style={{
        width: visible ? width : 12,
        height: `calc(100vh - ${bottomHeight}px)`, 
      }}
      className={`relative bg-gray-100 border-r flex-none ${isResizing ? "" : "transition-all duration-200"}`}
    >
      {visible && (
        <div
          onMouseDown={(e) => {
            e.preventDefault();
            document.body.style.userSelect = "none";
            document.body.style.cursor = "col-resize";
            setIsResizing(true);
          }}
          className="absolute right-0 top-0 h-full w-1 cursor-col-resize bg-transparent hover:bg-gray-300"
        />
      )}

      {visible && (
        <div className="p-2">
          <div className="relative">
            <input
              type="text"
              placeholder="Search icon..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="w-full pl-8 pr-2 py-1.5 text-sm rounded bg-white border border-gray-300 focus:outline-none focus:ring-1 focus:ring-blue-400"
            />
            <Icon icon="mdi:magnify" className="absolute left-2 top-1/2 -translate-y-1/2 text-gray-400" width={16} />
          </div>
        </div>
      )}

      <button
        onClick={(e) => {
          e.stopPropagation();
          setVisible(v => !v);
        }}
        className="absolute right-0 top-1/2 transform translate-x-1/2 -translate-y-1/2 px-2 py-1 bg-gray-200 rounded z-10 flex items-center justify-center"
        aria-expanded={visible}
        aria-controls="left-panel-content"
        aria-label={visible ? 'Close left panel' : 'Show left panel'}
        type="button"
      >
        <Icon icon="weui:arrow-filled" className={`transition-transform ${visible ? "rotate-180" : ""}`} width={10} height={18} aria-hidden="true" />
      </button>

      {visible && (
        <div
          id="left-panel-content"
          className="p-2 overflow-auto box-border"
          style={{ maxHeight: '100%' }}
        >
          {Object.entries(icons).map(([folder, files]) => {
            const filteredFiles = files.filter(file => file.toLowerCase().includes(search.toLowerCase()));
            if (!filteredFiles.length) return null;

            return (
              <div key={folder} className="mb-4">
                <h3 className="text-xs font-semibold text-gray-500 mb-2">
                  {folder.replace("Arch_", "").replace(/-/g, " ")}
                </h3>

                <div
                  className="grid gap-2"
                  style={{
                    gridTemplateColumns: `repeat(auto-fill, minmax(${Math.min(60, width / 4)}px, 1fr))`,
                  }}
                >
                  {filteredFiles.map(file => (
                    <img
                      key={file}
                      src={`/icons/${folder}/${file}`}
                      alt={file}
                      className="w-full max-w-full aspect-square mx-auto hover:scale-110 transition-transform cursor-pointer"
                      style={{ objectFit: 'contain' }}
                      onClick={() => addResource(file.replace(".svg", ""), `/icons/${folder}/${file}`)}
                    />
                  ))}
                </div>
              </div>
            );
          })}
        </div>
      )}
    </aside>
  );
};
