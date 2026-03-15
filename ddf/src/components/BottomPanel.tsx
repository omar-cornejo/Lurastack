import { useState, useRef, useEffect } from "react";
import { Terminal } from "xterm";
import { FitAddon } from "xterm-addon-fit";
import "xterm/css/xterm.css";
import { Icon } from '@iconify/react';
import { invoke } from "@tauri-apps/api/core";
import { listen } from "@tauri-apps/api/event";

type BottomPanelProps = {
  onHeightChange?: (height: number) => void;
};


export default function BottomPanel({ onHeightChange }: BottomPanelProps) {
  const [open, setOpen] = useState(true);
  const [height, setHeight] = useState(288);
  const [isResizing, setIsResizing] = useState(false);
  const panelRef = useRef<HTMLDivElement>(null);
  const terminalRef = useRef<HTMLDivElement>(null);
  const term = useRef<Terminal | null>(null);
  const fitAddon = useRef<FitAddon | null>(null);


  useEffect(() => {
    if (onHeightChange) onHeightChange(open ? height : 25);
  }, [height, open]);

  useEffect(() => {
    if (!terminalRef.current) return;

    term.current = new Terminal({
      cursorBlink: true,
      theme: {
        background: "#111827",
      },
    });

    fitAddon.current = new FitAddon();
    term.current.loadAddon(fitAddon.current);

    term.current.open(terminalRef.current);
    setTimeout(() => {
      fitAddon.current?.fit();
      term.current?.focus();
    }, 0);

    term.current.onData((data: string) => {
      invoke("write_to_pty", { input: data });
    });

    const unlisten = listen<string>("pty-output", (event) => {
      term.current?.write(event.payload);
    });

    const onWindowResize = () => fitAddon.current?.fit();
    window.addEventListener('resize', onWindowResize);

    return () => {
      unlisten.then((f) => f());
      window.removeEventListener('resize', onWindowResize);
      term.current?.dispose();
    };
  }, []);

  useEffect(() => {
    fitAddon.current?.fit();
  }, [height]);

  useEffect(() => {
    if (!panelRef.current) return;

    const resizeObserver = new ResizeObserver(() => {
      fitAddon.current?.fit();
    });

    resizeObserver.observe(panelRef.current);

    return () => {
      resizeObserver.disconnect();
    };
  }, []);



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
      style={{ height: open ? height : 35 }}
      className={`relative bg-gray-100 border-l flex-none overflow-hidden
    ${isResizing ? "" : "transition-[height] duration-200"}`}
    >
      {open && (
        <div
          onMouseDown={(e) => {
            e.preventDefault();
            document.body.style.userSelect = "none";
            document.body.style.cursor = "row-resize";
            setIsResizing(true);
          }}
          className="absolute top-0 left-0 w-full h-1 cursor-row-resize bg-transparent hover:bg-gray-300"
        />
      )}

        <div className="p-2 flex items-center justify-between transition-opacity duration-150"
        style={{ opacity: open ? 1 : 0 }}>
        <strong>Bottom</strong>
      </div>


      <div
        className="h-full w-full transition-opacity duration-200"
        style={{
          opacity: open ? 1 : 0,
          pointerEvents: open ? "auto" : "none",
        }}
      >
        <div ref={terminalRef} className="h-full w-full" />
      </div>




      <button
        onClick={(e) => {
          e.stopPropagation();
          setOpen((o) => !o);
        }}
        className="absolute left-1/2 top-0 transform -translate-x-1/2  px-2 py-1 m-1 bg-gray-200 rounded z-10 flex items-center justify-center"
        aria-expanded={open}
        aria-controls="bottom-panel-content"
        aria-label={open ? 'Close bottom panel' : 'Show bottom panel'}
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
