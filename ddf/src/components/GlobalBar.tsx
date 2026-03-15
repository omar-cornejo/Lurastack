import { useState, useRef, useEffect } from "react";
import { Icon } from "@iconify/react";
import { ViewInfo } from "../types/views";

type GlobalBarProps = {
  views: ViewInfo[];
  activeViewId: string;
  onSwitchView: (id: string) => void;
  onCreateView: () => void;
  onCloseView: (id: string) => void;
};

type MenuEntry =
  | { label: string; action: () => void; disabled?: false }
  | { label: string; disabled: true; action?: never };

export default function GlobalBar({
  views,
  activeViewId,
  onSwitchView,
  onCreateView,
  onCloseView,
}: GlobalBarProps) {
  const [openMenu, setOpenMenu] = useState<string | null>(null);
  const barRef = useRef<HTMLDivElement>(null);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (barRef.current && !barRef.current.contains(e.target as Node)) {
        setOpenMenu(null);
      }
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  const toggleMenu = (name: string) =>
    setOpenMenu((prev) => (prev === name ? null : name));

  const menus: { name: string; entries: MenuEntry[] }[] = [
    {
      name: "File",
      entries: [
        {
          label: "New view",
          action: () => {
            onCreateView();
            setOpenMenu(null);
          },
        },
        { label: "Open project…", disabled: true },
        { label: "Save project", disabled: true },
        { label: "Export HCL", disabled: true },
      ],
    },
    {
      name: "View",
      entries: [
        { label: "Zoom +", disabled: true },
        { label: "Zoom −", disabled: true },
        { label: "Fit to canvas", disabled: true },
      ],
    },
    {
      name: "Tools",
      entries: [
        { label: "Validate Terraform", disabled: true },
        { label: "Plan", disabled: true },
        { label: "Apply", disabled: true },
      ],
    },
  ];

  return (
    <div
      ref={barRef}
      className="flex items-stretch bg-gray-950 text-gray-300 text-xs select-none z-50"
      style={{ height: 26 }}
    >
      {/* App brand */}
      <div className="flex items-center px-3 text-white font-bold tracking-widest border-r border-gray-800 text-[11px]">
        ddf
      </div>

      {/* Dropdown menus */}
      <div className="flex items-stretch">
        {menus.map((menu) => (
          <div key={menu.name} className="relative">
            <button
              onClick={() => toggleMenu(menu.name)}
              className={`h-full px-3 hover:bg-gray-800 transition-colors ${
                openMenu === menu.name ? "bg-gray-800 text-white" : ""
              }`}
            >
              {menu.name}
            </button>

            {openMenu === menu.name && (
              <div className="absolute left-0 top-full mt-0 bg-gray-900 border border-gray-700 shadow-xl z-50 min-w-[180px] py-1">
                {menu.entries.map((entry) =>
                  entry.disabled ? (
                    <div
                      key={entry.label}
                      className="px-4 py-1.5 text-gray-600 cursor-not-allowed"
                    >
                              {entry.label}
                    </div>
                  ) : (
                    <button
                      key={entry.label}
                      onClick={entry.action}
                      className="w-full text-left px-4 py-1.5 hover:bg-gray-700 hover:text-white transition-colors"
                    >
                      {entry.label}
                    </button>
                  )
                )}
              </div>
            )}
          </div>
        ))}
      </div>

      {/* Separator */}
      <div className="w-px bg-gray-800 mx-1 self-stretch" />

      {/* View tabs */}
      <div className="flex items-stretch flex-1 overflow-x-auto">
        {views.map((view) => {
          const isActive = view.id === activeViewId;
          return (
            <div
              key={view.id}
              onClick={() => onSwitchView(view.id)}
              className={`
                group flex items-center gap-1.5 px-3 cursor-pointer border-r border-gray-800
                transition-colors whitespace-nowrap
                ${
                  isActive
                    ? "bg-gray-700 text-white border-b-2 border-b-blue-400"
                    : "hover:bg-gray-800 text-gray-400 hover:text-gray-200"
                }
              `}
              style={{ minWidth: 90, maxWidth: 180 }}
            >
              <Icon
                icon="mdi:layers-outline"
                className="text-[13px] shrink-0 opacity-60"
              />
              <span className="truncate text-[11px] flex-1">{view.name}</span>
              {views.length > 1 && (
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    onCloseView(view.id);
                  }}
                  className="opacity-0 group-hover:opacity-100 hover:text-red-400 transition-opacity ml-1 shrink-0"
                  title="Close view"
                >
                  <Icon icon="mdi:close" className="text-[12px]" />
                </button>
              )}
            </div>
          );
        })}

        {/* New view button */}
        <button
          onClick={onCreateView}
          title="Nueva vista"
          className="flex items-center px-2.5 hover:bg-gray-800 hover:text-white transition-colors text-gray-500"
        >
          <Icon icon="mdi:plus" className="text-[14px]" />
        </button>
      </div>
    </div>
  );
}
