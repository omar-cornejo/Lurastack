const DEFAULT_ICON_PATH = "/mock-node.svg";
export const SUBNET_PUBLIC_ICON_PATH = "/icons/Public-subnet_32.svg";
export const SUBNET_PRIVATE_ICON_PATH = "/icons/Private-subnet_32.svg";

const ICON_BY_TERRAFORM_TYPE: Record<string, string> = {
  aws_instance: "/icons/EC2-instance-contents_32.svg",
  aws_internet_gateway: "/icons/Res_Amazon-VPC_Internet-Gateway_48.svg",
  aws_lambda_function: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_network_interface: "/icons/Res_Amazon-VPC_Elastic-Network-Interface_48.svg",
  aws_eip: "/icons/Res_Amazon-EC2_Elastic-IP-Address_48.svg",
  aws_rds_cluster: "/icons/Arch_Amazon-RDS_64.svg",
  aws_route_table: "/icons/route-table.svg",
  aws_route_table_association: "/icons/route-table.svg",
  aws_s3_bucket: "/icons/Res_Amazon-Simple-Storage-Service_Bucket_48.svg",
  aws_security_group: "/icons/aws_security_group.svg",
  aws_vpc: "/icons/Virtual-private-cloud-VPC_32.svg",
  aws_region: "/icons/Region_32.svg",
  aws_availability_zone: "/icons/AWS_Availability_Zone.png",

  aws_alb: "/icons/aws_alb.svg",
  aws_alb_listener: "/icons/aws_alb.svg",
  aws_alb_target_group: "/icons/aws_alb.svg",
  aws_autoscaling_group: "/icons/aws_autoscaling_group.svg",
  aws_launch_template: "/icons/EC2-instance-contents_32.svg",
  aws_dynamodb_table: "/icons/aws_dynamodb_table.svg",
  aws_iam_role: "/icons/aws_iam_role.svg",
  aws_iam_policy: "/icons/aws_iam_policy.svg",
  aws_iam_role_policy_attachment: "/icons/aws_iam_policy.svg",
  aws_lambda_permission: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_lambda_event_source_mapping: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_sqs_queue: "/icons/aws_sqs_queue.svg",
  aws_sns_topic: "/icons/aws_sns_topic.svg",
  aws_s3_bucket_notification: "/icons/Res_Amazon-Simple-Storage-Service_Bucket_48.svg",
  aws_cloudwatch_event_rule: "/icons/aws_cloudwatch_event_rule.svg",
  aws_cloudwatch_event_target: "/icons/aws_cloudwatch_event_rule.svg",

  google_compute_instance: "/icons/gcp_compute_engine.svg",
  google_compute_network: "/icons/gcp_networking.svg",
  google_compute_subnetwork: "/icons/gcp_networking.svg",
  google_compute_firewall: "/icons/gcp_security_identity.svg",
  google_compute_address: "/icons/gcp_networking.svg",
  google_compute_health_check: "/icons/gcp_networking.svg",
  google_compute_instance_template: "/icons/gcp_compute_engine.svg",
  google_compute_instance_group_manager: "/icons/gcp_compute_engine.svg",
  google_compute_backend_service: "/icons/gcp_networking.svg",
  google_compute_url_map: "/icons/gcp_networking.svg",
  google_storage_bucket: "/icons/gcp_cloud_storage.svg",
  google_sql_database_instance: "/icons/gcp_cloud_sql.svg",
  google_bigquery_dataset: "/icons/gcp_bigquery.svg",
  google_bigquery_table: "/icons/gcp_bigquery.svg",
  google_cloudfunctions_function: "/icons/gcp_serverless.svg",
  google_cloudfunctions2_function: "/icons/gcp_serverless.svg",
  google_pubsub_topic: "/icons/gcp_integration.svg",
  google_pubsub_subscription: "/icons/gcp_integration.svg",
  google_service_account: "/icons/gcp_security_identity.svg",
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
