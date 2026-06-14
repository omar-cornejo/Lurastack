// Generates the 8 gallery templates (.lura + manifest) from an arch spec.
// Run from project root:   node scripts/generate-templates.mjs
//
// For each architecture we define resources as { type, name, attrs, x, y }.
// The script:
//   - Reads the schema's .tf.tpl as hclTemplate (so the canvas restores correctly).
//   - Resolves the icon from a small inline copy of iconRegistry.
//   - Writes public/templates/<provider>/<id>/{manifest.json,project.lura}.
//   - Rewrites public/templates/index.json adding the 8 entries (keeping the 3 empty ones).

import { readFileSync, writeFileSync, mkdirSync, existsSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { randomUUID } from "node:crypto";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const schemasDir = resolve(root, "src/schemas");
const templatesDir = resolve(root, "public/templates");

// Minimal icon map (mirror of iconRegistry — only what these templates use).
const ICONS = {
  // AWS
  aws_vpc: "/icons/Virtual-private-cloud-VPC_32.svg",
  aws_subnet: "/icons/Private-subnet_32.svg",
  aws_internet_gateway: "/icons/Res_Amazon-VPC_Internet-Gateway_48.svg",
  aws_route_table: "/icons/route-table.svg",
  aws_route_table_association: "/icons/route-table.svg",
  aws_security_group: "/icons/aws_security_group.svg",
  aws_instance: "/icons/EC2-instance-contents_32.svg",
  aws_alb: "/icons/aws_alb.svg",
  aws_alb_listener: "/icons/aws_alb.svg",
  aws_alb_target_group: "/icons/aws_alb.svg",
  aws_launch_template: "/icons/EC2-instance-contents_32.svg",
  aws_autoscaling_group: "/icons/aws_autoscaling_group.svg",
  aws_rds_cluster: "/icons/Arch_Amazon-RDS_64.svg",
  aws_s3_bucket: "/icons/Res_Amazon-Simple-Storage-Service_Bucket_48.svg",
  aws_s3_bucket_notification: "/icons/Res_Amazon-Simple-Storage-Service_Bucket_48.svg",
  aws_dynamodb_table: "/icons/aws_dynamodb_table.svg",
  aws_iam_role: "/icons/aws_iam_role.svg",
  aws_iam_role_policy_attachment: "/icons/aws_iam_policy.svg",
  aws_lambda_function: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_lambda_permission: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_lambda_event_source_mapping: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_sqs_queue: "/icons/aws_sqs_queue.svg",
  // GCP
  google_compute_network: "/icons/gcp_networking.svg",
  google_compute_subnetwork: "/icons/gcp_networking.svg",
  google_compute_firewall: "/icons/gcp_security_identity.svg",
  google_compute_instance: "/icons/gcp_compute_engine.svg",
  google_compute_health_check: "/icons/gcp_networking.svg",
  google_compute_instance_template: "/icons/gcp_compute_engine.svg",
  google_compute_instance_group_manager: "/icons/gcp_compute_engine.svg",
  google_compute_backend_service: "/icons/gcp_networking.svg",
  google_compute_url_map: "/icons/gcp_networking.svg",
  google_compute_address: "/icons/gcp_networking.svg",
  google_sql_database_instance: "/icons/gcp_cloud_sql.svg",
  google_storage_bucket: "/icons/gcp_cloud_storage.svg",
  google_service_account: "/icons/gcp_security_identity.svg",
  google_bigquery_dataset: "/icons/gcp_bigquery.svg",
  google_bigquery_table: "/icons/gcp_bigquery.svg",
  google_cloudfunctions2_function: "/icons/gcp_serverless.svg",
  google_pubsub_topic: "/icons/gcp_integration.svg",
  google_pubsub_subscription: "/icons/gcp_integration.svg",
};

const providerOf = (type) =>
  type.startsWith("aws_") ? "aws" : type.startsWith("google_") ? "gcp" : "other";

// ───────────────────────── CONTAINER MODEL ─────────────────────────
// Mirrors src/commands/createCanvasNode.ts so generated nodes match what the
// app produces when a container/child is created interactively.
const HIERARCHICAL_CONTAINER_TYPES = new Set([
  "aws_subnet",
  "aws_vpc",
  "google_compute_network",
  "google_compute_subnetwork",
]);
const ZONE_CONTAINER_TYPES = new Set([
  "aws_security_group",
]);
const isHierarchicalContainer = (type) => HIERARCHICAL_CONTAINER_TYPES.has(type);
const isZoneContainer = (type) => ZONE_CONTAINER_TYPES.has(type);
const isContainerType = (type) => isHierarchicalContainer(type) || isZoneContainer(type);

const CONTAINER_SIZE = { width: 340, height: 230 };
const RESOURCE_SIZE = { width: 176, height: 84 };

// Layout constants for nesting children inside containers.
const PAD_X = 20;            // left/right padding inside a container
const HEADER_SPACE = 58;     // top space reserved for the container header
const PAD_BOTTOM = 20;       // bottom padding inside a container
const CHILD_GAP_X = 24;      // horizontal gap between sibling children
const CHILD_GAP_Y = 24;      // vertical gap between sibling rows
const ROOT_GAP_X = 80;       // gap between top-level columns
const ROOT_GAP_Y = 80;       // gap between top-level rows

// Finds the resources referenced by an entry's attribute values, e.g. a value
// like "aws_vpc.main.id" or "[aws_security_group.ssh.id]" references aws_vpc.main.
const collectReferencedKeys = (attrs) => {
  const keys = new Set();
  const re = /\b((?:aws|google)_[a-z0-9_]+)\.([a-z0-9_]+)\b/gi;
  for (const value of Object.values(attrs ?? {})) {
    if (typeof value !== "string") continue;
    let match;
    while ((match = re.exec(value)) !== null) {
      keys.add(`${match[1]}.${match[2]}`);
    }
  }
  return keys;
};

const readTemplate = (type) => {
  const p = resolve(schemasDir, providerOf(type), "templates/resources", `${type}.tf.tpl`);
  if (!existsSync(p)) throw new Error(`Missing template for ${type}: ${p}`);
  return readFileSync(p, "utf8");
};

// Build a TerraformResource for one entry of an architecture.
const buildResource = (entry) => {
  const id = randomUUID();
  const icon = ICONS[entry.type] ?? "/mock-node.svg";
  // attrs is a flat record of "attribute-path" → value (already in the format
  // the canvas/code-emitter consumes; dotted keys like "boot_disk.initialize_params.image"
  // become nested blocks at HCL render time).
  return {
    id,
    kind: "resource",
    type: entry.type,
    name: entry.name,
    schemaId: entry.type,
    origin: "imported-file",
    hclTemplate: readTemplate(entry.type),
    config: { attributes: entry.attrs ?? {}, blocks: {} },
    ui: { x: entry.x, y: entry.y, icon },
  };
};

// Builds the canvas nodes for a view, deriving container nesting and zone
// memberships from the attribute references between resources.
//
// - Hierarchical containers (VPC/subnet, network/subnetwork) become real
//   containers; resources that reference them are nested inside (relative
//   position + parentNode + extent:"parent"), sized to fit their children.
// - Zone containers (security groups) are positioned to geometrically span the
//   bounding box of the resources that reference them, so the app's geometric
//   zone-membership recompute keeps them as members. zoneContainerIds is also
//   pre-populated to match.
// `fixedLayout` (optional): map of `type.name` → { x, y, width?, height? } in
// ABSOLUTE canvas coordinates. When provided, these positions/sizes override the
// automatic grid layout (parent-relative positions are derived from them), and
// zone memberships are recomputed geometrically against the fixed positions.
const buildNodes = (resources, entryByResourceId, fixedLayout) => {
  const byKey = new Map(resources.map((r) => [`${r.type}.${r.name}`, r]));
  const refsByResourceId = new Map(
    resources.map((r) => [r.id, collectReferencedKeys(entryByResourceId.get(r.id).attrs)]),
  );

  // Resolve each resource's innermost hierarchical-container parent. A subnet
  // referencing a VPC nests in that VPC; an instance referencing a subnet nests
  // in that subnet (preferred over the VPC it may also reference).
  const parentOf = new Map(); // resourceId -> parent resourceId
  for (const resource of resources) {
    if (isZoneContainer(resource.type)) continue; // zones are never nested
    const refs = refsByResourceId.get(resource.id);
    let subnetParent;
    let networkParent;
    for (const refKey of refs) {
      const target = byKey.get(refKey);
      if (!target || target.id === resource.id) continue;
      if (target.type === "aws_subnet" || target.type === "google_compute_subnetwork") {
        subnetParent = target;
      } else if (target.type === "aws_vpc" || target.type === "google_compute_network") {
        networkParent = target;
      }
    }
    const parent = subnetParent ?? networkParent;
    if (parent && parent.id !== resource.id) parentOf.set(resource.id, parent.id);
  }

  const childrenOf = new Map(); // parent resourceId -> child resources[]
  for (const resource of resources) {
    const parentId = parentOf.get(resource.id);
    if (!parentId) continue;
    if (!childrenOf.has(parentId)) childrenOf.set(parentId, []);
    childrenOf.get(parentId).push(resource);
  }

  // Recursively lay out a subtree and return its rendered size. Children are
  // arranged in a grid; container size grows to fit them.
  const sizeOf = new Map();   // resourceId -> { width, height }
  const relPos = new Map();   // resourceId -> { x, y } relative to its parent (or absolute if root)

  const layout = (resource) => {
    const children = childrenOf.get(resource.id) ?? [];
    if (children.length === 0 || !isHierarchicalContainer(resource.type)) {
      const size = isContainerType(resource.type) ? { ...CONTAINER_SIZE } : { ...RESOURCE_SIZE };
      sizeOf.set(resource.id, size);
      return size;
    }

    const childSizes = children.map((child) => ({ child, size: layout(child) }));
    const columns = Math.min(children.length, 3);
    let cursorX = PAD_X;
    let cursorY = HEADER_SPACE;
    let rowHeight = 0;
    let maxRight = PAD_X;
    let col = 0;

    for (const { child, size } of childSizes) {
      relPos.set(child.id, { x: cursorX, y: cursorY });
      maxRight = Math.max(maxRight, cursorX + size.width);
      rowHeight = Math.max(rowHeight, size.height);
      col += 1;
      if (col >= columns) {
        col = 0;
        cursorX = PAD_X;
        cursorY += rowHeight + CHILD_GAP_Y;
        rowHeight = 0;
      } else {
        cursorX += size.width + CHILD_GAP_X;
      }
    }

    const lastRowHeight = col === 0 ? 0 : rowHeight + CHILD_GAP_Y;
    const contentBottom = cursorY + lastRowHeight;
    const size = {
      width: Math.max(CONTAINER_SIZE.width, maxRight + PAD_X),
      height: Math.max(CONTAINER_SIZE.height, contentBottom + PAD_BOTTOM),
    };
    sizeOf.set(resource.id, size);
    return size;
  };

  // Top-level subtree roots: resources without a hierarchical parent that are
  // not zone containers (those are placed separately, overlapping their members).
  const roots = resources.filter(
    (r) => !parentOf.has(r.id) && !isZoneContainer(r.type),
  );
  roots.forEach(layout);

  // Place top-level roots in a row, accumulating absolute positions.
  let rootX = 0;
  const rootY = 0;
  let rowBottom = 0;
  for (const root of roots) {
    relPos.set(root.id, { x: rootX, y: rootY });
    const size = sizeOf.get(root.id);
    rootX += size.width + ROOT_GAP_X;
    rowBottom = Math.max(rowBottom, rootY + size.height);
  }

  // Compute absolute positions for every nested resource (needed to size/place
  // zone containers and to populate zoneContainerIds geometrically).
  const absPos = new Map();
  const computeAbs = (resource, parentAbs) => {
    const rel = relPos.get(resource.id) ?? { x: 0, y: 0 };
    const abs = { x: parentAbs.x + rel.x, y: parentAbs.y + rel.y };
    absPos.set(resource.id, abs);
    for (const child of childrenOf.get(resource.id) ?? []) {
      computeAbs(child, abs);
    }
  };
  for (const root of roots) computeAbs(root, { x: 0, y: 0 });

  // Apply a template-provided fixed layout (absolute positions/sizes), if any.
  // Overrides automatic placement for the resources it lists.
  const hasFixedLayout = fixedLayout && Object.keys(fixedLayout).length > 0;
  if (hasFixedLayout) {
    for (const resource of resources) {
      const fixed = fixedLayout[`${resource.type}.${resource.name}`];
      if (!fixed) continue;
      absPos.set(resource.id, { x: fixed.x, y: fixed.y });
      const current = sizeOf.get(resource.id) ?? { ...RESOURCE_SIZE };
      sizeOf.set(resource.id, {
        width: fixed.width ?? current.width,
        height: fixed.height ?? current.height,
      });
    }
  }

  // Zone containers (security groups): span the bounding box of their members
  // (resources that reference them), with padding, placed below the hierarchy.
  const zoneContainers = resources.filter((r) => isZoneContainer(r.type));
  const zoneMembersOf = new Map(); // zone resourceId -> member resourceIds[]
  for (const zone of zoneContainers) {
    const members = resources.filter((r) => {
      if (r.id === zone.id || isContainerType(r.type)) return false;
      return refsByResourceId.get(r.id).has(`${zone.type}.${zone.name}`);
    });
    zoneMembersOf.set(zone.id, members.map((m) => m.id));

    // A fixed layout already pinned this zone's position/size — keep it.
    if (hasFixedLayout && fixedLayout[`${zone.type}.${zone.name}`]) {
      continue;
    }

    if (members.length === 0) {
      const size = { ...CONTAINER_SIZE };
      sizeOf.set(zone.id, size);
      absPos.set(zone.id, { x: 0, y: rowBottom + ROOT_GAP_Y });
      continue;
    }

    let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
    for (const member of members) {
      const pos = absPos.get(member.id);
      const size = sizeOf.get(member.id);
      minX = Math.min(minX, pos.x);
      minY = Math.min(minY, pos.y);
      maxX = Math.max(maxX, pos.x + size.width);
      maxY = Math.max(maxY, pos.y + size.height);
    }
    const size = {
      width: Math.max(CONTAINER_SIZE.width, maxX - minX + PAD_X * 2),
      height: Math.max(CONTAINER_SIZE.height, maxY - minY + HEADER_SPACE + PAD_BOTTOM),
    };
    sizeOf.set(zone.id, size);
    absPos.set(zone.id, { x: minX - PAD_X, y: minY - HEADER_SPACE });
  }

  // Geometric zone membership: a member belongs to a zone if its center sits
  // inside the zone's rect (matches applyZoneContainerMemberships in the app).
  const centerInside = (memberId, zoneId) => {
    const p = absPos.get(memberId);
    const s = sizeOf.get(memberId);
    const zp = absPos.get(zoneId);
    const zs = sizeOf.get(zoneId);
    const cx = p.x + s.width / 2;
    const cy = p.y + s.height / 2;
    return cx >= zp.x && cx <= zp.x + zs.width && cy >= zp.y && cy <= zp.y + zs.height;
  };

  const zoneIdsByResourceId = new Map(); // resourceId -> zone node ids[]
  for (const resource of resources) {
    // Zone containers themselves never carry zoneContainerIds. With automatic
    // layout, membership is derived from references (so hierarchical containers
    // are skipped); with a fixed layout we mirror the app's purely geometric
    // recompute, which can also nest hierarchical containers inside a zone.
    if (isZoneContainer(resource.type)) continue;
    if (!hasFixedLayout && isContainerType(resource.type)) continue;
    const zoneIds = zoneContainers
      .filter((zone) => hasFixedLayout || (zoneMembersOf.get(zone.id) ?? []).includes(resource.id))
      .filter((zone) => centerInside(resource.id, zone.id))
      .map((zone) => `node-${zone.id}`);
    if (zoneIds.length) zoneIdsByResourceId.set(resource.id, zoneIds);
  }

  // React Flow requires a parent node to appear before its children, so order
  // resources by their depth in the hierarchy (containers first).
  const depthOf = (resourceId) => {
    let depth = 0;
    let current = parentOf.get(resourceId);
    while (current) {
      depth += 1;
      current = parentOf.get(current);
    }
    return depth;
  };
  const orderedResources = [...resources].sort((a, b) => depthOf(a.id) - depthOf(b.id));

  // With a fixed layout, child positions are relative to their parent's
  // absolute position; otherwise the automatic relative positions are used.
  // Automatic positions are rounded; fixed positions are kept verbatim.
  const finalPosition = (resource, parentId) => {
    if (hasFixedLayout) {
      const abs = absPos.get(resource.id);
      if (!parentId) return abs;
      const parentAbs = absPos.get(parentId);
      return { x: abs.x - parentAbs.x, y: abs.y - parentAbs.y };
    }
    const pos = parentId ? relPos.get(resource.id) : absPos.get(resource.id);
    return { x: Math.round(pos.x), y: Math.round(pos.y) };
  };

  // Emit the React Flow nodes.
  return orderedResources.map((resource) => {
    const container = isContainerType(resource.type);
    const zoneContainer = isZoneContainer(resource.type);
    const parentId = parentOf.get(resource.id);
    const position = finalPosition(resource, parentId);
    const size = sizeOf.get(resource.id);
    const node = {
      id: `node-${resource.id}`,
      type: "terraformResource",
      position: { x: position.x, y: position.y },
      ...(container
        ? { style: { width: hasFixedLayout ? size.width : Math.round(size.width), height: hasFixedLayout ? size.height : Math.round(size.height) }, dragHandle: ".container-drag-handle", zIndex: 0 }
        : { zIndex: 10 }),
      // Nested nodes carry a parent + parent-relative position. We omit
      // extent:"parent" to match the app, which manages child bounds itself.
      ...(parentId ? { parentNode: `node-${parentId}` } : {}),
      data: {
        resourceId: resource.id,
        schemaId: resource.schemaId,
        label: resource.name,
        icon: resource.ui.icon,
        terraformType: resource.type,
        terraformKind: "resource",
        isContainer: container,
        ...(container ? { containerKind: zoneContainer ? "zone" : "hierarchical" } : {}),
        zoneContainerIds: zoneContainer ? [] : (zoneIdsByResourceId.get(resource.id) ?? []),
      },
    };
    return node;
  });
};

const buildView = (id, provider, entries, codeFiles, fixedLayout) => {
  const resources = entries.map(buildResource);
  const entryByResourceId = new Map(resources.map((r, i) => [r.id, entries[i]]));
  // Containers must render under their children: parents before descendants.
  const nodes = buildNodes(resources, entryByResourceId, fixedLayout);
  return {
    id,
    name: "View 1",
    activeProvider: provider,
    resources,
    nodes,
    edges: [],
    // Auxiliary view files (output.tf, user_data.sh, …) alongside main.tf.
    codeFiles: (codeFiles ?? []).map((file) => ({
      id: randomUUID(),
      name: file.name,
      content: file.content,
    })),
  };
};

const buildProject = (templateName, provider, entries, codeFiles, fixedLayout) => {
  const now = "2026-01-01T00:00:00.000Z";
  const viewId = `view-${randomUUID()}`;
  return {
    version: "1",
    meta: { name: templateName, createdAt: now, updatedAt: now },
    settings: { autosave: false },
    activeViewId: viewId,
    views: [buildView(viewId, provider, entries, codeFiles, fixedLayout)],
  };
};

const writeTemplate = ({ provider, id, name, description, tags, entries, codeFiles, fixedLayout }) => {
  const dir = resolve(templatesDir, provider, id);
  mkdirSync(dir, { recursive: true });

  const manifest = {
    id: `${provider}/${id}`,
    name,
    description,
    provider,
    resourceCount: entries.length,
    tags,
    icon: provider === "aws" ? "mdi:aws" : "mdi:google-cloud",
  };
  writeFileSync(resolve(dir, "manifest.json"), JSON.stringify(manifest, null, 2) + "\n");

  const project = buildProject(name, provider, entries, codeFiles, fixedLayout);
  writeFileSync(resolve(dir, "project.lura"), JSON.stringify(project, null, 2) + "\n");
  return manifest;
};

// ────────────────────────── ARCHITECTURE SPECS ──────────────────────────

const COL = 280;
const ROW = 200;

// ============== AWS ==============

// Ingress (HTTP 80 + SSH 22) and egress (all), expressed as a SINGLE `ingress`/
// `egress` list attribute rather than repeated inline blocks. Repeated blocks
// collapse to one rule when the project is re-saved through the app (block keys
// like `ingress.from_port` overwrite each other), which silently dropped the
// HTTP rule. A single list attribute survives that round-trip. The provider's
// object type requires every field, so each rule lists them all.
const sgRule = ({ description, from_port, to_port, protocol }) =>
  `{ description = "${description}", from_port = ${from_port}, to_port = ${to_port}, ` +
  `protocol = "${protocol}", cidr_blocks = ["0.0.0.0/0"], ipv6_cidr_blocks = [], ` +
  `prefix_list_ids = [], security_groups = [], self = false }`;
const WEB_SG_INGRESS =
  "[" +
  sgRule({ description: "HTTP", from_port: 80, to_port: 80, protocol: "tcp" }) + ", " +
  sgRule({ description: "SSH", from_port: 22, to_port: 22, protocol: "tcp" }) +
  "]";
const SG_EGRESS_ALL =
  "[" + sgRule({ description: "All outbound", from_port: 0, to_port: 0, protocol: "-1" }) + "]";

const AWS_BASIC = [
  { type: "aws_vpc", name: "main",
    attrs: { cidr_block: "10.0.0.0/16", tags: '{ Name = "lurastack-basic-vpc" }' },
    x: 0, y: 0 },
  { type: "aws_internet_gateway", name: "main",
    attrs: { vpc_id: "aws_vpc.main.id" },
    x: COL, y: 0 },
  { type: "aws_subnet", name: "public_a",
    attrs: { vpc_id: "aws_vpc.main.id", cidr_block: "10.0.1.0/24",
             map_public_ip_on_launch: true, availability_zone: "us-east-1a" },
    x: 2 * COL, y: 0 },
  { type: "aws_route_table", name: "public",
    // Default route to the internet gateway so the public subnet can reach the
    // internet (without it the instance is unreachable even with port 80 open).
    // A single inline `route {}` block survives the app's save round-trip.
    attrs: { vpc_id: "aws_vpc.main.id",
             route: [{ cidr_block: "0.0.0.0/0", gateway_id: "aws_internet_gateway.main.id" }] },
    x: 0, y: ROW },
  { type: "aws_route_table_association", name: "public_a",
    attrs: { subnet_id: "aws_subnet.public_a.id", route_table_id: "aws_route_table.public.id" },
    x: COL, y: ROW },
  { type: "aws_security_group", name: "web",
    attrs: { name: "lurastack-basic-web", vpc_id: "aws_vpc.main.id",
             description: "Allow HTTP (80) and SSH (22)",
             ingress: WEB_SG_INGRESS, egress: SG_EGRESS_ALL,
             tags: '{ Name = "lurastack-basic-web" }' },
    x: 2 * COL, y: ROW },
  { type: "aws_instance", name: "app",
    attrs: { ami: "ami-0c02fb55956c7d316", instance_type: "t3.micro",
             subnet_id: "aws_subnet.public_a.id",
             vpc_security_group_ids: '[aws_security_group.web.id]',
             user_data: 'file("${path.module}/user_data.sh")',
             tags: '{ Name = "lurastack-basic-web" }' },
    x: COL, y: 2 * ROW },
];

// Hand-tuned canvas layout for the basic template (absolute positions/sizes).
// Keys are `type.name`; values are absolute coordinates — child positions are
// derived relative to their parent container at emit time.
const AWS_BASIC_LAYOUT = {
  "aws_vpc.main": { x: 0, y: 0, width: 848, height: 566.6165161214637 },
  "aws_security_group.web": { x: 309.28577421152335, y: 276.5149193193618, width: 340, height: 230 },
  "aws_internet_gateway.main": { x: 286.1464058811032, y: 92.62234682409769 },
  "aws_subnet.public_a": { x: 33.29701613612758, y: 192.6165161214638, width: 668, height: 354 },
  "aws_route_table.public": { x: 652.7161693560213, y: 108.98681450785111 },
  // subnet abs (33.29701613612758, 192.6165161214638) + child rel
  "aws_route_table_association.public_a": { x: 33.29701613612758 + 20, y: 192.6165161214638 + 222.34587096963418 },
  "aws_instance.app": { x: 33.29701613612758 + 358.62970161361284, y: 192.6165161214638 + 192.61651612146397 },
};

// nginx bootstrap (Amazon Linux 2023): installs nginx with dnf and serves a
// welcome page on :80. AL2023 has no amazon-linux-extras, so install via dnf
// directly; falls back to yum for Amazon Linux 2 just in case.
const AWS_BASIC_USER_DATA = `#!/bin/bash
set -uo pipefail

# Install nginx (Amazon Linux 2023 uses dnf; Amazon Linux 2 uses amazon-linux-extras + yum)
if command -v dnf >/dev/null 2>&1; then
  dnf install -y nginx
else
  amazon-linux-extras enable nginx1 || true
  yum clean metadata || true
  yum install -y nginx
fi

cat > /usr/share/nginx/html/index.html <<'HTML'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>LuraStack — nginx</title>
    <style>
      body { font-family: system-ui, sans-serif; display: grid; place-items: center; height: 100vh; margin: 0; background: #0f172a; color: #e2e8f0; }
      .card { text-align: center; padding: 2rem 3rem; border: 1px solid #334155; border-radius: 12px; background: #1e293b; }
      h1 { margin: 0 0 .5rem; }
      code { color: #38bdf8; }
    </style>
  </head>
  <body>
    <div class="card">
      <h1>It works 🎉</h1>
      <p>nginx is running on this EC2 instance, served on <code>port 80</code>.</p>
      <p>Provisioned with <strong>LuraStack</strong>.</p>
    </div>
  </body>
</html>
HTML

systemctl enable nginx
systemctl restart nginx
`;

// Outputs the public IP and the served port (see output.tf in the view).
const AWS_BASIC_OUTPUTS = `output "instance_public_ip" {
  description = "Public IP of the nginx EC2 instance"
  value       = aws_instance.app.public_ip
}

output "instance_port" {
  description = "Port nginx is served on"
  value       = 80
}

output "url" {
  description = "Open this URL in a browser to see the nginx welcome page"
  value       = "http://\${aws_instance.app.public_ip}:80"
}
`;

const AWS_BASIC_CODE_FILES = [
  { name: "user_data.sh", content: AWS_BASIC_USER_DATA },
  { name: "output.tf", content: AWS_BASIC_OUTPUTS },
];

const AWS_WEB = [
  { type: "aws_vpc", name: "main", attrs: { cidr_block: "10.0.0.0/16" }, x: 0, y: 0 },
  { type: "aws_internet_gateway", name: "main", attrs: { vpc_id: "aws_vpc.main.id" }, x: COL, y: 0 },
  { type: "aws_subnet", name: "public_a",
    attrs: { vpc_id: "aws_vpc.main.id", cidr_block: "10.0.1.0/24",
             availability_zone: "us-east-1a", map_public_ip_on_launch: true }, x: 2 * COL, y: 0 },
  { type: "aws_subnet", name: "public_b",
    attrs: { vpc_id: "aws_vpc.main.id", cidr_block: "10.0.2.0/24",
             availability_zone: "us-east-1b", map_public_ip_on_launch: true }, x: 3 * COL, y: 0 },
  { type: "aws_subnet", name: "private_a",
    attrs: { vpc_id: "aws_vpc.main.id", cidr_block: "10.0.11.0/24",
             availability_zone: "us-east-1a" }, x: 2 * COL, y: ROW },
  { type: "aws_subnet", name: "private_b",
    attrs: { vpc_id: "aws_vpc.main.id", cidr_block: "10.0.12.0/24",
             availability_zone: "us-east-1b" }, x: 3 * COL, y: ROW },
  { type: "aws_security_group", name: "alb",
    attrs: { name: "lurastack-web-alb-sg", vpc_id: "aws_vpc.main.id" }, x: 0, y: 2 * ROW },
  { type: "aws_security_group", name: "app",
    attrs: { name: "lurastack-web-app-sg", vpc_id: "aws_vpc.main.id" }, x: COL, y: 2 * ROW },
  { type: "aws_security_group", name: "db",
    attrs: { name: "lurastack-web-db-sg", vpc_id: "aws_vpc.main.id" }, x: 2 * COL, y: 2 * ROW },
  { type: "aws_alb", name: "main",
    attrs: { name: "lurastack-web-alb", load_balancer_type: "application",
             subnets: '[aws_subnet.public_a.id, aws_subnet.public_b.id]',
             security_groups: '[aws_security_group.alb.id]' }, x: 0, y: 3 * ROW },
  { type: "aws_alb_target_group", name: "app",
    attrs: { name: "lurastack-web-tg", port: 80, protocol: "HTTP",
             vpc_id: "aws_vpc.main.id", target_type: "instance" }, x: COL, y: 3 * ROW },
  { type: "aws_alb_listener", name: "http",
    attrs: { load_balancer_arn: "aws_alb.main.arn", port: 80, protocol: "HTTP" },
    x: 2 * COL, y: 3 * ROW },
  { type: "aws_launch_template", name: "app",
    attrs: { name_prefix: "lurastack-web-lt-", image_id: "ami-0c02fb55956c7d316",
             instance_type: "t3.micro",
             vpc_security_group_ids: '[aws_security_group.app.id]' }, x: 3 * COL, y: 3 * ROW },
  { type: "aws_autoscaling_group", name: "app",
    attrs: { name: "lurastack-web-asg", min_size: 2, max_size: 4, desired_capacity: 2,
             vpc_zone_identifier: '[aws_subnet.private_a.id, aws_subnet.private_b.id]',
             target_group_arns: '[aws_alb_target_group.app.arn]' }, x: 4 * COL, y: 3 * ROW },
  { type: "aws_rds_cluster", name: "db",
    attrs: { cluster_identifier: "lurastack-web-aurora", engine: "aurora-mysql",
             master_username: "admin", master_password: "changeme123!",
             vpc_security_group_ids: '[aws_security_group.db.id]',
             skip_final_snapshot: true }, x: 0, y: 4 * ROW },
];

const AWS_SERVERLESS = [
  { type: "aws_s3_bucket", name: "uploads",
    attrs: { bucket: "lurastack-serverless-uploads" }, x: 0, y: 0 },
  { type: "aws_dynamodb_table", name: "items",
    attrs: { name: "lurastack-serverless-items", billing_mode: "PAY_PER_REQUEST",
             hash_key: "id" }, x: COL, y: 0 },
  { type: "aws_iam_role", name: "lambda_exec",
    attrs: { name: "lurastack-serverless-lambda-role",
             assume_role_policy: 'jsonencode({ Version = "2012-10-17", Statement = [{ Effect = "Allow", Principal = { Service = "lambda.amazonaws.com" }, Action = "sts:AssumeRole" }] })' },
    x: 2 * COL, y: 0 },
  { type: "aws_iam_role_policy_attachment", name: "basic",
    attrs: { role: "aws_iam_role.lambda_exec.name",
             policy_arn: "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" },
    x: 3 * COL, y: 0 },
  { type: "aws_lambda_function", name: "processor",
    attrs: { function_name: "lurastack-serverless-processor",
             role: "aws_iam_role.lambda_exec.arn", handler: "index.handler",
             runtime: "nodejs20.x", filename: "lambda.zip" }, x: COL, y: ROW },
  { type: "aws_lambda_permission", name: "from_s3",
    attrs: { statement_id: "AllowS3Invoke", action: "lambda:InvokeFunction",
             function_name: "aws_lambda_function.processor.function_name",
             principal: "s3.amazonaws.com", source_arn: "aws_s3_bucket.uploads.arn" },
    x: 2 * COL, y: ROW },
  { type: "aws_s3_bucket_notification", name: "uploads_notify",
    attrs: { bucket: "aws_s3_bucket.uploads.id" }, x: 0, y: ROW },
];

const AWS_DATA = [
  { type: "aws_sqs_queue", name: "ingest",
    attrs: { name: "lurastack-data-ingest", visibility_timeout_seconds: 60 }, x: 0, y: 0 },
  { type: "aws_s3_bucket", name: "raw",
    attrs: { bucket: "lurastack-data-raw" }, x: COL, y: 0 },
  { type: "aws_dynamodb_table", name: "events",
    attrs: { name: "lurastack-data-events", billing_mode: "PAY_PER_REQUEST",
             hash_key: "id" }, x: 2 * COL, y: 0 },
  { type: "aws_iam_role", name: "lambda_exec",
    attrs: { name: "lurastack-data-lambda-role",
             assume_role_policy: 'jsonencode({ Version = "2012-10-17", Statement = [{ Effect = "Allow", Principal = { Service = "lambda.amazonaws.com" }, Action = "sts:AssumeRole" }] })' },
    x: 0, y: ROW },
  { type: "aws_iam_role_policy_attachment", name: "sqs_exec",
    attrs: { role: "aws_iam_role.lambda_exec.name",
             policy_arn: "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole" },
    x: COL, y: ROW },
  { type: "aws_lambda_function", name: "worker",
    attrs: { function_name: "lurastack-data-worker",
             role: "aws_iam_role.lambda_exec.arn", handler: "index.handler",
             runtime: "nodejs20.x", filename: "worker.zip" }, x: 2 * COL, y: ROW },
  { type: "aws_lambda_event_source_mapping", name: "sqs_to_lambda",
    attrs: { event_source_arn: "aws_sqs_queue.ingest.arn",
             function_name: "aws_lambda_function.worker.arn",
             batch_size: 10 }, x: COL, y: 2 * ROW },
];

// ============== GCP ==============

const GCP_BASIC = [
  { type: "google_compute_network", name: "main",
    attrs: { name: "lurastack-basic-vpc", auto_create_subnetworks: false }, x: 0, y: 0 },
  { type: "google_compute_subnetwork", name: "main",
    attrs: { name: "lurastack-basic-subnet", region: "us-central1",
             network: "google_compute_network.main.id", ip_cidr_range: "10.0.1.0/24" }, x: COL, y: 0 },
  { type: "google_compute_firewall", name: "ssh",
    attrs: { name: "lurastack-basic-allow-ssh", network: "google_compute_network.main.id",
             direction: "INGRESS", source_ranges: '["0.0.0.0/0"]' }, x: 2 * COL, y: 0 },
  { type: "google_compute_instance", name: "vm",
    attrs: { name: "lurastack-basic-vm", zone: "us-central1-a", machine_type: "e2-micro" },
    x: COL, y: ROW },
];

const GCP_WEB = [
  { type: "google_compute_network", name: "main",
    attrs: { name: "lurastack-web-vpc", auto_create_subnetworks: false }, x: 0, y: 0 },
  { type: "google_compute_subnetwork", name: "main",
    attrs: { name: "lurastack-web-subnet", region: "us-central1",
             network: "google_compute_network.main.id", ip_cidr_range: "10.0.1.0/24" }, x: COL, y: 0 },
  { type: "google_compute_firewall", name: "http",
    attrs: { name: "lurastack-web-allow-http", network: "google_compute_network.main.id",
             direction: "INGRESS", source_ranges: '["0.0.0.0/0"]' }, x: 2 * COL, y: 0 },
  { type: "google_compute_health_check", name: "http",
    attrs: { name: "lurastack-web-hc" }, x: 3 * COL, y: 0 },
  { type: "google_compute_instance_template", name: "app",
    attrs: { name: "lurastack-web-tpl", machine_type: "e2-small" }, x: 0, y: ROW },
  { type: "google_compute_instance_group_manager", name: "app",
    attrs: { name: "lurastack-web-mig", base_instance_name: "lurastack-web",
             zone: "us-central1-a", target_size: 2 }, x: COL, y: ROW },
  { type: "google_compute_backend_service", name: "app",
    attrs: { name: "lurastack-web-backend", protocol: "HTTP",
             health_checks: '[google_compute_health_check.http.id]' }, x: 2 * COL, y: ROW },
  { type: "google_compute_url_map", name: "app",
    attrs: { name: "lurastack-web-url-map",
             default_service: "google_compute_backend_service.app.id" }, x: 3 * COL, y: ROW },
  { type: "google_compute_address", name: "lb_ip",
    attrs: { name: "lurastack-web-lb-ip", region: "us-central1" }, x: 0, y: 2 * ROW },
  { type: "google_sql_database_instance", name: "db",
    attrs: { name: "lurastack-web-sql", region: "us-central1",
             database_version: "MYSQL_8_0", deletion_protection: false }, x: COL, y: 2 * ROW },
];

const GCP_SERVERLESS = [
  { type: "google_storage_bucket", name: "uploads",
    attrs: { name: "lurastack-serverless-uploads-bucket", location: "US" }, x: 0, y: 0 },
  { type: "google_storage_bucket", name: "source",
    attrs: { name: "lurastack-serverless-source-bucket", location: "US" }, x: COL, y: 0 },
  { type: "google_service_account", name: "fn",
    attrs: { account_id: "lurastack-serverless-fn",
             display_name: "LuraStack Serverless Function SA" }, x: 2 * COL, y: 0 },
  { type: "google_bigquery_dataset", name: "analytics",
    attrs: { dataset_id: "lurastack_serverless_analytics", location: "US" }, x: 0, y: ROW },
  { type: "google_bigquery_table", name: "events",
    attrs: { dataset_id: "google_bigquery_dataset.analytics.dataset_id",
             table_id: "events", deletion_protection: false }, x: COL, y: ROW },
  { type: "google_cloudfunctions2_function", name: "processor",
    attrs: { name: "lurastack-serverless-processor", location: "us-central1" }, x: 2 * COL, y: ROW },
];

const GCP_DATA = [
  { type: "google_pubsub_topic", name: "ingest",
    attrs: { name: "lurastack-data-ingest" }, x: 0, y: 0 },
  { type: "google_storage_bucket", name: "raw",
    attrs: { name: "lurastack-data-raw", location: "US" }, x: COL, y: 0 },
  { type: "google_storage_bucket", name: "source",
    attrs: { name: "lurastack-data-fn-source", location: "US" }, x: 2 * COL, y: 0 },
  { type: "google_bigquery_dataset", name: "warehouse",
    attrs: { dataset_id: "lurastack_data_warehouse", location: "US" }, x: 3 * COL, y: 0 },
  { type: "google_bigquery_table", name: "events",
    attrs: { dataset_id: "google_bigquery_dataset.warehouse.dataset_id",
             table_id: "events", deletion_protection: false }, x: 0, y: ROW },
  { type: "google_service_account", name: "fn",
    attrs: { account_id: "lurastack-data-fn",
             display_name: "LuraStack Data Function SA" }, x: COL, y: ROW },
  { type: "google_cloudfunctions2_function", name: "worker",
    attrs: { name: "lurastack-data-worker", location: "us-central1" }, x: 2 * COL, y: ROW },
  { type: "google_pubsub_subscription", name: "audit",
    attrs: { name: "lurastack-data-audit-sub", topic: "google_pubsub_topic.ingest.id" }, x: 3 * COL, y: ROW },
];

const TEMPLATES = [
  { provider: "aws", id: "basic-vpc-vm",
    name: "AWS — Basic VPC + EC2 (nginx)",
    description: "VPC con subnet pública y un EC2 con nginx en el puerto 80; output con IP y puerto.",
    tags: ["starter", "networking", "compute", "nginx"],
    entries: AWS_BASIC, codeFiles: AWS_BASIC_CODE_FILES, fixedLayout: AWS_BASIC_LAYOUT },
  { provider: "aws", id: "web-classic-lb",
    name: "AWS — Classic web (ALB + ASG + RDS)",
    description: "ALB + Auto Scaling Group sobre subnets privadas + Aurora.",
    tags: ["web", "load-balancer", "database"], entries: AWS_WEB },
  { provider: "aws", id: "serverless-lambda-s3-dynamo",
    name: "AWS — Serverless (Lambda + S3 + DynamoDB)",
    description: "S3 dispara Lambda que escribe en DynamoDB.",
    tags: ["serverless", "event-driven"], entries: AWS_SERVERLESS },
  { provider: "aws", id: "data-pipeline-sqs-lambda",
    name: "AWS — Data pipeline (SQS + Lambda + DynamoDB)",
    description: "Cola SQS consumida por Lambda hacia DynamoDB+S3.",
    tags: ["data", "queue"], entries: AWS_DATA },
  { provider: "gcp", id: "basic-network-vm",
    name: "GCP — Basic VPC + VM",
    description: "VPC custom + subnet + firewall + Compute Engine.",
    tags: ["starter", "networking", "compute"], entries: GCP_BASIC },
  { provider: "gcp", id: "web-classic-lb",
    name: "GCP — Classic web (LB + MIG + Cloud SQL)",
    description: "MIG detrás de Backend Service + Cloud SQL.",
    tags: ["web", "load-balancer", "database"], entries: GCP_WEB },
  { provider: "gcp", id: "serverless-functions-storage-bq",
    name: "GCP — Serverless (Functions + Storage + BigQuery)",
    description: "Cloud Function gatillada por Storage, datos a BigQuery.",
    tags: ["serverless", "event-driven"], entries: GCP_SERVERLESS },
  { provider: "gcp", id: "data-pipeline-pubsub-bq",
    name: "GCP — Data pipeline (Pub/Sub + Functions + BigQuery)",
    description: "Tema Pub/Sub procesado por Function hacia BigQuery.",
    tags: ["data", "pubsub"], entries: GCP_DATA },
];

const newManifests = TEMPLATES.map(writeTemplate);

// Rewrite index.json: keep the empty entries + add the new ones.
const indexPath = resolve(templatesDir, "index.json");
const existing = JSON.parse(readFileSync(indexPath, "utf8"));
const emptyIds = new Set(existing.templates
  .filter((t) => t.tags?.includes("blank"))
  .map((t) => t.id));
const merged = [
  ...existing.templates.filter((t) => emptyIds.has(t.id)),
  ...newManifests,
];
writeFileSync(indexPath, JSON.stringify({ version: "1", templates: merged }, null, 2) + "\n");

console.log(`Wrote ${newManifests.length} templates and updated index.json (${merged.length} total).`);
