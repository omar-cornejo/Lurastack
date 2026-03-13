export type TerraformBlock = {
  attributes: Record<string, any>;
  blocks: Record<string, TerraformBlock[]>;
};

export type TerraformResource = {
  id: string;              
  type: string;            
  name: string;            

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
