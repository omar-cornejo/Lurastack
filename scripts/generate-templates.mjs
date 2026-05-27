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

const buildNode = (resource) => ({
  id: `node-${resource.id}`,
  type: "terraformResource",
  position: { x: resource.ui.x, y: resource.ui.y },
  data: {
    resourceId: resource.id,
    schemaId: resource.schemaId,
    label: resource.name,
    icon: resource.ui.icon,
    terraformType: resource.type,
    terraformKind: "resource",
    isContainer: false,
  },
});

const buildView = (id, provider, entries) => {
  const resources = entries.map(buildResource);
  return {
    id,
    name: "View 1",
    activeProvider: provider,
    resources,
    nodes: resources.map(buildNode),
    edges: [],
    codeFiles: [],
  };
};

const buildProject = (templateName, provider, entries) => {
  const now = "2026-01-01T00:00:00.000Z";
  const viewId = `view-${randomUUID()}`;
  return {
    version: "1",
    meta: { name: templateName, createdAt: now, updatedAt: now },
    settings: { autosave: false },
    activeViewId: viewId,
    views: [buildView(viewId, provider, entries)],
  };
};

const writeTemplate = ({ provider, id, name, description, tags, entries }) => {
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

  const project = buildProject(name, provider, entries);
  writeFileSync(resolve(dir, "project.lura"), JSON.stringify(project, null, 2) + "\n");
  return manifest;
};

// ────────────────────────── ARCHITECTURE SPECS ──────────────────────────

const COL = 280;
const ROW = 200;

// ============== AWS ==============

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
    attrs: { vpc_id: "aws_vpc.main.id" },
    x: 0, y: ROW },
  { type: "aws_route_table_association", name: "public_a",
    attrs: { subnet_id: "aws_subnet.public_a.id", route_table_id: "aws_route_table.public.id" },
    x: COL, y: ROW },
  { type: "aws_security_group", name: "ssh",
    attrs: { name: "lurastack-basic-ssh", vpc_id: "aws_vpc.main.id" },
    x: 2 * COL, y: ROW },
  { type: "aws_instance", name: "app",
    attrs: { ami: "ami-0c02fb55956c7d316", instance_type: "t3.micro",
             subnet_id: "aws_subnet.public_a.id",
             vpc_security_group_ids: '[aws_security_group.ssh.id]',
             tags: '{ Name = "lurastack-basic-vm" }' },
    x: COL, y: 2 * ROW },
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
    name: "AWS — Basic VPC + EC2",
    description: "VPC con subnet pública, un EC2 y security group.",
    tags: ["starter", "networking", "compute"], entries: AWS_BASIC },
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
