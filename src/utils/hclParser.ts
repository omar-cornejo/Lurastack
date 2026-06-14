export type ProviderInfo = {
  name: "aws" | "gcp" | "azure";
  region: string;
  customConfig: string; // Additional provider block configuration (e.g., "project_id = ...")
};

export type ManualSegments = {
  comments: string[];
  customProviderConfig: string;
  preProviderContent: string; // Any content before provider block
  postResourcesContent: string; // Any content after resources (custom resources, locals, etc.)
};

/**
 * Extract provider information from HCL terraform block
 * Returns provider name, region, and any custom configuration
 */
export function extractProviderFromHcl(
  hcl: string,
): ProviderInfo | null {
  const providerRegex = /provider\s+"(aws|gcp|google|azure)"\s*\{([^}]*)\}/s;
  const match = hcl.match(providerRegex);

  if (!match) return null;

  const name = (match[1] === "google" ? "gcp" : match[1]) as "aws" | "gcp" | "azure";
  const configBlock = match[2] || "";

  const regionMatch = configBlock.match(/region\s*=\s*"([^"]+)"/);
  const region = regionMatch ? regionMatch[1] : "";

  const customConfig = configBlock
    .split("\n")
    .filter((line) => !line.match(/region\s*=/))
    .map((line) => line.trim())
    .filter(Boolean)
    .join("\n");

  return { name, region, customConfig };
}

/**
 * Extract manual code segments that should be preserved
 * Compares full HCL with generated HCL to find user additions
 */
export function extractManualSegments(
  fullHcl: string,
  _generatedHcl: string,
): ManualSegments {
  const comments: string[] = [];
  const lines = fullHcl.split("\n");

  lines.forEach((line) => {
    const trimmed = line.trim();
    if (trimmed.startsWith("#")) {
      comments.push(line);
    }
  });

  const providerInfo = extractProviderFromHcl(fullHcl);
  const customProviderConfig = providerInfo?.customConfig || "";

  const providerStartIndex = fullHcl.indexOf('provider "');
  const preProviderContent =
    providerStartIndex > 0
      ? fullHcl
          .substring(0, providerStartIndex)
          .split("\n")
          .map((line) => line.trim())
          .filter((line) => line && !line.startsWith("#"))
          .join("\n")
      : "";

  const resourcesStartIndex = Math.max(
    fullHcl.indexOf("resource "),
    fullHcl.indexOf("data "),
  );
  const lastResourceEndIndex = fullHcl.lastIndexOf("}");

  let postResourcesContent = "";
  if (resourcesStartIndex >= 0 && lastResourceEndIndex > resourcesStartIndex) {
    // Find the end of the last resource block
    let braceDepth = 0;
    let i = lastResourceEndIndex;

    while (i >= resourcesStartIndex) {
      if (fullHcl[i] === "}") braceDepth++;
      else if (fullHcl[i] === "{") {
        braceDepth--;
        if (braceDepth === 0) break;
      }
      i--;
    }

    // Find the actual end of last resource by looking for closing brace at depth 0
    i = lastResourceEndIndex + 1;
    postResourcesContent = fullHcl
      .substring(i)
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => line && !line.startsWith("#"))
      .join("\n");
  }

  return {
    comments,
    customProviderConfig,
    preProviderContent,
    postResourcesContent,
  };
}

/**
 * Merge generated HCL with manual code segments
 * Inserts manual comments and custom config while preserving structure
 */
export function mergeWithManualCode(
  generatedHcl: string,
  manualSegments: ManualSegments,
): string {
  let result = generatedHcl;

  if (manualSegments.comments.length > 0) {
    const commentBlock = manualSegments.comments.join("\n");
    result = `${commentBlock}\n\n${result}`;
  }

  if (manualSegments.customProviderConfig) {
    const providerRegex = /provider\s+"[^"]+"\s*\{\s*region\s*=\s*"[^"]+"\s*\n\s*\}/;
    const customConfig = manualSegments.customProviderConfig
      .split("\n")
      .map((line) => `  ${line}`)
      .join("\n");

    result = result.replace(
      providerRegex,
      (match) => {
        const beforeClosing = match.substring(0, match.lastIndexOf("\n"));
        return `${beforeClosing}\n${customConfig}\n}`;
      },
    );
  }

  if (manualSegments.postResourcesContent) {
    result = `${result}\n\n${manualSegments.postResourcesContent}`;
  }

  return result;
}

/**
 * Determine if HCL looks like it has been manually edited (has custom content)
 */
export function hasManualContent(hcl: string): boolean {
  const lines = hcl.split("\n");
  const hasComments = lines.some((line) => line.trim().startsWith("#"));
  const customResourceCount = lines.filter(
    (line) => line.includes("resource ") || line.includes("data "),
  ).length;

  // If more than typical terraform+provider+resources structure, likely has manual content
  return hasComments || customResourceCount > 10;
}

/**
 * Extract just the resource blocks from HCL
 */
export function extractResourceBlocks(hcl: string): string {
  const lines = hcl.split("\n");
  const resourceLines: string[] = [];
  let inResourceBlock = false;
  let braceDepth = 0;

  lines.forEach((line) => {
    const isResourceStart = line.trim().startsWith("resource ");
    if (isResourceStart) {
      inResourceBlock = true;
    }

    if (inResourceBlock) {
      resourceLines.push(line);
      braceDepth += (line.match(/{/g) || []).length;
      braceDepth -= (line.match(/}/g) || []).length;

      if (braceDepth === 0 && isResourceStart) {
        inResourceBlock = false;
      }
    }
  });

  return resourceLines.join("\n");
}
