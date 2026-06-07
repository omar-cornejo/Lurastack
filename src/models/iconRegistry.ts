// Icon resolution for canvas nodes.
//
// All icons are drawn from open-licensed sets (Material Design Icons, Apache-2.0;
// the `logos` brand pack, MIT) and shipped under public/icons/open/ so the whole
// repository is freely redistributable. They are intentionally generic — a clear
// category/service glyph rather than each provider's official, non-redistributable
// service icon. See public/icons/ATTRIBUTIONS.md.

const DEFAULT_ICON_PATH = "/mock-node.svg";

// Subnet has a public/private split driven by an attribute, so its two icons are
// exported and recognized explicitly by callers.
export const SUBNET_PUBLIC_ICON_PATH = "/icons/open/service-subnet-public.svg";
export const SUBNET_PRIVATE_ICON_PATH = "/icons/open/service-subnet-private.svg";

// Shared generic glyphs, keyed by intent so multiple resource types can reuse one.
const ICON = {
  compute: "/icons/open/category-compute.svg",
  networking: "/icons/open/category-networking.svg",
  database: "/icons/open/category-database.svg",
  security: "/icons/open/category-security.svg",
  serverless: "/icons/open/category-serverless.svg",
  integration: "/icons/open/category-integration.svg",
  other: "/icons/open/category-other.svg",
  instance: "/icons/open/service-instance.svg",
  vpc: "/icons/open/service-vpc.svg",
  loadBalancer: "/icons/open/service-loadbalancer.svg",
  storageBucket: "/icons/open/service-storage-bucket.svg",
  queue: "/icons/open/service-queue.svg",
  topic: "/icons/open/service-topic.svg",
  region: "/icons/open/service-region.svg",
  az: "/icons/open/service-az.svg",
} as const;

const ICON_BY_TERRAFORM_TYPE: Record<string, string> = {
  // --- AWS ---
  aws_instance: ICON.instance,
  aws_internet_gateway: ICON.networking,
  aws_lambda_function: ICON.serverless,
  aws_network_interface: ICON.networking,
  aws_eip: ICON.networking,
  aws_rds_cluster: ICON.database,
  aws_route_table: ICON.networking,
  aws_route_table_association: ICON.networking,
  aws_s3_bucket: ICON.storageBucket,
  aws_security_group: ICON.security,
  aws_vpc: ICON.vpc,
  aws_region: ICON.region,
  aws_availability_zone: ICON.az,

  aws_alb: ICON.loadBalancer,
  aws_alb_listener: ICON.loadBalancer,
  aws_alb_target_group: ICON.loadBalancer,
  aws_autoscaling_group: ICON.compute,
  aws_launch_template: ICON.instance,
  aws_dynamodb_table: ICON.database,
  aws_iam_role: ICON.security,
  aws_iam_policy: ICON.security,
  aws_iam_role_policy_attachment: ICON.security,
  aws_lambda_permission: ICON.serverless,
  aws_lambda_event_source_mapping: ICON.serverless,
  aws_sqs_queue: ICON.queue,
  aws_sns_topic: ICON.topic,
  aws_s3_bucket_notification: ICON.storageBucket,
  aws_cloudwatch_event_rule: ICON.integration,
  aws_cloudwatch_event_target: ICON.integration,

  // --- GCP ---
  google_compute_instance: ICON.instance,
  google_compute_network: ICON.networking,
  google_compute_subnetwork: ICON.networking,
  google_compute_firewall: ICON.security,
  google_compute_address: ICON.networking,
  google_compute_health_check: ICON.networking,
  google_compute_instance_template: ICON.instance,
  google_compute_instance_group_manager: ICON.compute,
  google_compute_backend_service: ICON.loadBalancer,
  google_compute_url_map: ICON.loadBalancer,
  google_storage_bucket: ICON.storageBucket,
  google_sql_database_instance: ICON.database,
  google_bigquery_dataset: ICON.database,
  google_bigquery_table: ICON.database,
  google_cloudfunctions_function: ICON.serverless,
  google_cloudfunctions2_function: ICON.serverless,
  google_pubsub_topic: ICON.topic,
  google_pubsub_subscription: ICON.integration,
  google_service_account: ICON.security,
};

const isTruthy = (value: unknown): boolean => {
  if (typeof value === "boolean") return value;
  if (typeof value === "number") return value !== 0;
  if (typeof value === "string") {
    const normalized = value.trim().toLowerCase();
    return normalized === "true" || normalized === "1" || normalized === "yes";
  }
  return false;
};

const resolveSubnetIcon = (attributes?: Record<string, unknown>) => {
  const isPublicSubnet = isTruthy(attributes?.map_public_ip_on_launch);
  return isPublicSubnet
    ? SUBNET_PUBLIC_ICON_PATH
    : SUBNET_PRIVATE_ICON_PATH;
};

export const isSubnetIconPath = (iconPath: string | undefined): boolean => {
  if (!iconPath) return false;
  return iconPath === SUBNET_PUBLIC_ICON_PATH || iconPath === SUBNET_PRIVATE_ICON_PATH;
};

export const resolveTerraformIcon = (
  terraformType: string,
  attributes?: Record<string, unknown>,
): string => {
  if (terraformType === "aws_subnet") {
    return resolveSubnetIcon(attributes);
  }

  return ICON_BY_TERRAFORM_TYPE[terraformType] ?? DEFAULT_ICON_PATH;
};
