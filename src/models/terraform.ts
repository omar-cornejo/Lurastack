export type TerraformBlock = {
  attributes: Record<string, any>;
  blocks: Record<string, TerraformBlock[]>;
};

export type ResourceOrigin = "canvas" | "imported-hcl" | "imported-file";

export type TerraformResource = {
  id: string;              
  kind?: "resource" | "data";
  type: string;            
  name: string;            
  hclTemplate?: string;
  schemaId?: string;
  origin?: ResourceOrigin;

  config: {
    attributes: Record<string, any>;
    blocks: Record<string, TerraformBlock[]>;
  };

  ui: {
    x: number;
    y: number;
    icon: string;
  };
};

export type TerraformProject = {
  provider: string; 
  resources: TerraformResource[];
};
