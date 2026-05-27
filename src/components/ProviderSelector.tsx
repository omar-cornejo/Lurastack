import { useCallback } from "react";

type ProviderSelectorProps = {
  selectedProvider: "aws" | "gcp" | "azure";
  onProviderChange: (provider: "aws" | "gcp" | "azure") => void;
};

export function ProviderSelector({
  selectedProvider,
  onProviderChange,
}: ProviderSelectorProps) {
  const handleChange = useCallback(
    (e: React.ChangeEvent<HTMLSelectElement>) => {
      const value = e.target.value as "aws" | "gcp" | "azure";
      onProviderChange(value);
    },
    [onProviderChange],
  );

  return (
    <div className="border-b border-slate-700 p-3">
      <label className="block text-xs font-semibold uppercase tracking-wide text-slate-400 mb-2">
        Cloud Provider
      </label>
      <select
        value={selectedProvider}
        onChange={handleChange}
        className="w-full rounded border border-slate-600 bg-[#252526] px-2 py-1.5 text-sm text-slate-100 hover:border-slate-500 focus:border-slate-400 focus:outline-none"
      >
        <option value="aws">AWS (Amazon Web Services)</option>
        <option value="gcp">GCP (Google Cloud Platform)</option>
        <option value="azure">Azure (Microsoft Azure)</option>
      </select>
      <p className="mt-2 text-xs text-slate-500">
        {selectedProvider === "aws"
          ? "Using AWS provider with default region eu-south-2"
          : selectedProvider === "gcp"
            ? "Using GCP provider with default region europe-west1"
            : "Using Azure provider with default region westeurope"}
      </p>
    </div>
  );
}
