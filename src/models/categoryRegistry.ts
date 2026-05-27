export type ServiceCategory =
  | "compute"
  | "networking"
  | "storage"
  | "database"
  | "security"
  | "serverless"
  | "integration"
  | "observability"
  | "other";

export const CATEGORY_LABELS: Record<ServiceCategory, string> = {
  compute: "Compute",
  networking: "Networking",
  storage: "Storage",
  database: "Database",
  security: "Security & Identity",
  serverless: "Serverless",
  integration: "Integration",
  observability: "Observability",
  other: "Other / Terraform",
};

export const CATEGORY_ORDER: ServiceCategory[] = [
  "compute",
  "networking",
  "storage",
  "database",
  "security",
  "serverless",
  "integration",
  "observability",
  "other",
];

export const CATEGORY_BY_TERRAFORM_TYPE: Record<string, ServiceCategory> = {
  aws_instance: "compute",
  aws_launch_template: "compute",
  aws_autoscaling_group: "compute",
  aws_vpc: "networking",
  aws_subnet: "networking",
  aws_internet_gateway: "networking",
  aws_route_table: "networking",
  aws_route_table_association: "networking",
  aws_network_interface: "networking",
  aws_eip: "networking",
  aws_alb: "networking",
  aws_alb_listener: "networking",
  aws_alb_target_group: "networking",
  aws_s3_bucket: "storage",
  aws_s3_bucket_notification: "storage",
  aws_rds_cluster: "database",
  aws_dynamodb_table: "database",
  aws_security_group: "security",
  aws_iam_role: "security",
  aws_iam_policy: "security",
  aws_iam_role_policy_attachment: "security",
  aws_lambda_function: "serverless",
  aws_lambda_permission: "serverless",
  aws_lambda_event_source_mapping: "serverless",
  aws_sqs_queue: "integration",
  aws_sns_topic: "integration",
  aws_cloudwatch_event_rule: "observability",
  aws_cloudwatch_event_target: "observability",
  aws_availability_zone: "networking",
  aws_region: "networking",

  google_compute_instance: "compute",
  google_compute_instance_template: "compute",
  google_compute_instance_group_manager: "compute",
  google_compute_network: "networking",
  google_compute_subnetwork: "networking",
  google_compute_firewall: "networking",
  google_compute_address: "networking",
  google_compute_health_check: "networking",
  google_compute_backend_service: "networking",
  google_compute_url_map: "networking",
  google_storage_bucket: "storage",
  google_sql_database_instance: "database",
  google_bigquery_dataset: "database",
  google_bigquery_table: "database",
  google_service_account: "security",
  google_cloudfunctions_function: "serverless",
  google_cloudfunctions2_function: "serverless",
  google_pubsub_topic: "integration",
  google_pubsub_subscription: "integration",
  google_client_config: "security",
  google_project: "other",
};

export const getCategoryForType = (type: string): ServiceCategory =>
  CATEGORY_BY_TERRAFORM_TYPE[type] ?? "other";
