import type { Node } from "reactflow";
import type { TerraformResource, ResourceOrigin } from "../models/terraform";
import type { TerraformNodeSchema } from "../models/nodeRegistry";
import type { CanvasTerraformNodeData } from "../canvas/types";
import { createTerraformResourceFromSchema } from "../models/terraform/createTerraformResource";
import { createCanvasNodeFromUserAction } from "./createCanvasNode";

type ParsedMainTfBlock = {
  kind: "resource" | "data";
  type: string;
  name: string;
  attributes: Record<string, unknown>;
};

export type HclImportResult = {
  newResources: TerraformResource[];
  newNodes: Node<CanvasTerraformNodeData>[];
  updatedResourceIds: Set<string>;
  updatedNodeIds: Set<string>;
  warnings: Array<{
    resourceKey: string;
    reason: string;
  }>;
  conflicts: Array<{
    resourceKey: string;
    existingOrigin: ResourceOrigin;
    importedOrigin: ResourceOrigin;
  }>;
  deletedResourceIds: string[];
};

export type HclImportInput = {
  parsedBlocks: ParsedMainTfBlock[];
  existingResources: TerraformResource[];
  existingNodes: Node<CanvasTerraformNodeData>[];
  schemas: TerraformNodeSchema[];
  ignoreOrigins?: ResourceOrigin[];
  currentNodeIndex?: number;
  overrideCanvas?: boolean;
};

/**
 * Importa bloques HCL parseados y devuelve los recursos y nodos que deben crearse/actualizarse.
 * Respeta las reglas de precedencia: canvas > imported-file > imported-hcl
 */
export function importHclBlocksToResources(
  input: HclImportInput,
): HclImportResult {
  const {
    parsedBlocks,
    existingResources,
    existingNodes,
    schemas,
    ignoreOrigins = [],
    currentNodeIndex = 0,
    overrideCanvas = false,
  } = input;

  const newResources: TerraformResource[] = [];
  const newNodes: Node<CanvasTerraformNodeData>[] = [];
  const updatedResourceIds = new Set<string>();
  const updatedNodeIds = new Set<string>();
  const warnings: Array<{ resourceKey: string; reason: string }> = [];
  const conflicts: Array<{
    resourceKey: string;
    existingOrigin: ResourceOrigin;
    importedOrigin: ResourceOrigin;
  }> = [];
  const deletedResourceIds: string[] = [];

  // Agrupar bloques por type.name para detectar duplicados
  const blocksByKey = new Map<string, ParsedMainTfBlock[]>();
  for (const block of parsedBlocks) {
    const key = `${block.type}.${block.name}`;
    if (!blocksByKey.has(key)) {
      blocksByKey.set(key, []);
    }
    blocksByKey.get(key)!.push(block);
  }

  // Detectar duplicados en HCL
  for (const [key, blocks] of blocksByKey) {
    if (blocks.length > 1) {
      warnings.push({
        resourceKey: key,
        reason: `Múltiples bloques con el mismo tipo y nombre: ${blocks.length}. Solo se importará el primero.`,
      });
    }
  }

  // Procesar cada bloque único
  const processedKeys = new Set<string>();
  for (const block of parsedBlocks) {
    const key = `${block.type}.${block.name}`;
    if (processedKeys.has(key)) continue; // Ya procesamos un bloque con este key
    processedKeys.add(key);

    // Buscar schema para este tipo
    const schema = schemas.find((s) => s.terraformType === block.type);
    if (!schema) {
      warnings.push({
        resourceKey: key,
        reason: `Recurso "${block.type}" no encontrado en el catálogo. Será ignorado.`,
      });
      continue;
    }

    // Buscar recurso existente con el mismo type.name
    const existingResource = existingResources.find(
      (r) => r.type === block.type && r.name === block.name,
    );

    const importedOrigin: ResourceOrigin = "imported-hcl";

    if (existingResource) {
      const existingOrigin = existingResource.origin ?? "canvas";

      if (!overrideCanvas) {
        // Aplicar regla de precedencia
        if (ignoreOrigins.includes(existingOrigin)) {
          conflicts.push({
            resourceKey: key,
            existingOrigin,
            importedOrigin,
          });
          warnings.push({
            resourceKey: key,
            reason: `Conflicto: recurso de tipo "${existingOrigin}" existente. El bloque HCL será ignorado.`,
          });
          continue;
        }

        // Si el recurso existente es "canvas" y estamos importando, emitir conflicto
        if (existingOrigin === "canvas") {
          conflicts.push({
            resourceKey: key,
            existingOrigin,
            importedOrigin,
          });
          warnings.push({
            resourceKey: key,
            reason: `El recurso fue creado en canvas. Los cambios en HCL no se aplicarán para evitar conflictos.`,
          });
          continue;
        }
      }

      // Actualizar atributos del recurso existente
      updatedResourceIds.add(existingResource.id);
      existingResource.config.attributes = { ...block.attributes };
      existingResource.kind = block.kind;

      // Warn about attributes that are not in the schema
      const knownKeys = new Set(schema.properties.map((p) => p.name));
      const unknownKeys = Object.keys(block.attributes).filter((k) => {
        const topLevel = k.split(".")[0];
        return topLevel !== undefined && !knownKeys.has(topLevel);
      });
      if (unknownKeys.length > 0) {
        warnings.push({
          resourceKey: key,
          reason: `Atributo(s) desconocido(s) en el schema: ${unknownKeys.join(", ")}. Se guardarán en el HCL pero no aparecerán en el inspector.`,
        });
      }

      // Buscar si hay nodo correspondiente y marcarlo como actualizado
      const nodeForResource = existingNodes.find(
        (n) => n.data.resourceId === existingResource.id,
      );
      if (nodeForResource) {
        updatedNodeIds.add(nodeForResource.id);
      }
    } else {
      // Crear recurso nuevo
      const newResource = createTerraformResourceFromSchema(
        schema,
        block.name,
        importedOrigin,
      );
      newResource.config.attributes = { ...block.attributes };
      newResource.kind = block.kind;

      // Warn about unknown attributes for new resources too
      const knownKeysNew = new Set(schema.properties.map((p) => p.name));
      const unknownKeysNew = Object.keys(block.attributes).filter((k) => {
        const topLevel = k.split(".")[0];
        return topLevel !== undefined && !knownKeysNew.has(topLevel);
      });
      if (unknownKeysNew.length > 0) {
        warnings.push({
          resourceKey: key,
          reason: `Atributo(s) desconocido(s) en el schema: ${unknownKeysNew.join(", ")}. Se guardarán en el HCL pero no aparecerán en el inspector.`,
        });
      }

      newResources.push(newResource);

      // Crear nodo para el nuevo recurso
      const newNode = createCanvasNodeFromUserAction(
        schema,
        currentNodeIndex + newNodes.length,
        undefined, // position: se calcula dinámicamente
        newResource.id,
        newResource.name,
      );
      newNodes.push(newNode);
    }
  }

  // Detectar recursos importados que fueron eliminados del HCL
  for (const resource of existingResources) {
    const origin = resource.origin ?? "canvas";
    if (
      (origin === "imported-hcl" || origin === "imported-file") &&
      !processedKeys.has(`${resource.type}.${resource.name}`)
    ) {
      deletedResourceIds.push(resource.id);
    }
  }

  return {
    newResources,
    newNodes,
    updatedResourceIds,
    updatedNodeIds,
    warnings,
    conflicts,
    deletedResourceIds,
  };
}
