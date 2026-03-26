import { useMemo } from "react";
import type { TerraformResource } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/testNodes";
import { getInspectorPropertiesForSchema } from "../commands/schemaInspector";

type CodePanelProps = {
  resources: TerraformResource[];
  schemas: TerraformNodeSchema[];
  cloudProvider: "aws";
  region: string;
  onUpdateAttribute: (resourceId: string, attribute: string, value: unknown) => void;
};

const TERRAFORM_REF_PATTERN = /^(?:data\.)?[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+$/;

const parseHclInputToAttribute = (input: string): unknown => {
  const trimmed = input.trim();
  if (!trimmed) return "";
  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (/^-?\d+(\.\d+)?$/.test(trimmed)) return Number(trimmed);
  if (trimmed.startsWith('"') && trimmed.endsWith('"')) {
    return trimmed.slice(1, -1);
  }
  return trimmed;
};

const toEditableLiteral = (value: unknown): string => {
  if (typeof value === "boolean" || typeof value === "number") {
    return String(value);
  }

  if (typeof value === "string") {
    const trimmed = value.trim();
    if (TERRAFORM_REF_PATTERN.test(trimmed) || trimmed.startsWith("var.")) {
      return trimmed;
    }
    return `"${trimmed.replace(/"/g, '\\"')}"`;
  }

  if (value === null || value === undefined) {
    return '""';
  }

  return `"${String(value).replace(/"/g, '\\"')}"`;
};

export default function CodePanel({
  resources,
  schemas,
  cloudProvider,
  region,
  onUpdateAttribute,
}: CodePanelProps) {
  const resourcesWithSchemas = useMemo(
    () =>
      resources.map((resource) => ({
        resource,
        schema: schemas.find((schema) => schema.id === resource.schemaId),
      })),
    [resources, schemas],
  );

  return (
    <section className="h-full min-h-0 w-full overflow-auto bg-slate-100 p-4">
      <div className="mx-auto w-full max-w-6xl rounded-xl border border-slate-300 bg-white shadow-sm">
        <div className="border-b border-slate-200 px-4 py-3">
          <h2 className="text-sm font-semibold text-slate-800">main.tf</h2>
          <p className="text-xs text-slate-500">Generated from this canvas view. Only attribute values are editable.</p>
        </div>

        <div className="space-y-4 p-4 font-mono text-xs text-slate-800">
          <div className="rounded border border-slate-200 bg-slate-50 p-3">
            <div>terraform {'{'}</div>
            <div className="pl-4">required_providers {'{'}</div>
            <div className="pl-8">{cloudProvider} = {'{'}</div>
            <div className="pl-12">source = "hashicorp/{cloudProvider}"</div>
            <div className="pl-12">version = "~&gt; 5.0"</div>
            <div className="pl-8">{'}'}</div>
            <div className="pl-4">{'}'}</div>
            <div>{'}'}</div>
            <div className="mt-2">provider "{cloudProvider}" {'{'}</div>
            <div className="pl-4">region = "{region}"</div>
            <div>{'}'}</div>
          </div>

          {resourcesWithSchemas.length === 0 ? (
            <div className="rounded border border-dashed border-slate-300 bg-white p-4 text-center text-slate-500">
              No resources in canvas yet.
            </div>
          ) : (
            resourcesWithSchemas.map(({ resource, schema }) => {
              const inspectorProperties = getInspectorPropertiesForSchema(schema);
              const requiredAttributes = inspectorProperties
                .filter((property) => property.required)
                .map((property) => property.name);

              const currentKeys = Object.keys(resource.config.attributes ?? {});
              const mergedAttributeKeys = Array.from(
                new Set([...currentKeys, ...requiredAttributes]),
              ).sort((left, right) => left.localeCompare(right));

              return (
                <div key={resource.id} className="rounded border border-slate-200 bg-white p-3">
                  <div>
                    {(resource.kind ?? "resource")} "{resource.type}" "{resource.name}" {'{'}
                  </div>

                  <div className="space-y-1 pl-4 pt-2">
                    {mergedAttributeKeys.map((attributeKey) => {
                      const currentValue = resource.config.attributes?.[attributeKey] ?? "";
                      const displayValue = toEditableLiteral(currentValue);
                      const isRequired = requiredAttributes.includes(attributeKey);

                      return (
                        <label
                          key={`${resource.id}-${attributeKey}`}
                          className="flex items-center gap-2"
                        >
                          <span className="min-w-[180px] break-all text-slate-700">
                            {attributeKey}
                            {isRequired ? <span className="ml-1 text-red-500">*</span> : null}
                            <span className="ml-1">=</span>
                          </span>
                          <input
                            value={displayValue}
                            onChange={(event) =>
                              onUpdateAttribute(
                                resource.id,
                                attributeKey,
                                parseHclInputToAttribute(event.target.value),
                              )
                            }
                            className="w-full rounded border border-slate-300 bg-slate-50 px-2 py-1 text-xs text-slate-800 focus:border-blue-400 focus:bg-white focus:outline-none"
                          />
                        </label>
                      );
                    })}
                  </div>

                  <div className="pt-2">{'}'}</div>
                </div>
              );
            })
          )}
        </div>
      </div>
    </section>
  );
}
