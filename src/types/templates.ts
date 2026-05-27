export type TemplateProvider = "aws" | "azure" | "gcp";

export type TemplateManifest = {
  id: string;
  name: string;
  description: string;
  provider: TemplateProvider;
  resourceCount: number;
  tags: string[];
  icon?: string;
  preview?: string;
};

export type TemplateIndex = {
  version: "1";
  templates: TemplateManifest[];
};
