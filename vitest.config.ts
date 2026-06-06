import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";

// Separate from vite.config.ts on purpose: that config carries a Tauri-only
// `server` block (fixed port 1420, HMR) that is irrelevant — and would just
// add noise — during tests. We only need the React plugin so that JSX and
// `import.meta.glob` (used by src/models/nodeRegistry.ts) resolve the same way
// they do in the real build.
export default defineConfig({
  plugins: [react()],
  test: {
    // Default to the fast Node environment. Component tests opt into jsdom
    // per-file with `// @vitest-environment jsdom`.
    environment: "node",
    globals: true,
    setupFiles: ["./vitest.setup.ts"],
    coverage: {
      provider: "v8",
      // Report only — no thresholds yet (see testing plan). Keeps the suite
      // contributor-friendly while we build coverage up.
      reporter: ["text", "html"],
      include: ["src/**/*.{ts,tsx}"],
      exclude: ["src/**/*.test.{ts,tsx}", "src/**/*.d.ts"],
    },
  },
});
