const DEFAULT_ICON_PATH = "/mock-node.svg";
export const SUBNET_PUBLIC_ICON_PATH = "/icons/Public-subnet_32.svg";
export const SUBNET_PRIVATE_ICON_PATH = "/icons/Private-subnet_32.svg";

const ICON_BY_TERRAFORM_TYPE: Record<string, string> = {
  aws_instance: "/icons/EC2-instance-contents_32.svg",
  aws_internet_gateway: "/icons/Res_Amazon-VPC_Internet-Gateway_48.svg",
  aws_lambda_function: "/icons/Res_AWS-Lambda_Lambda-Function_48.svg",
  aws_network_interface: "/icons/Res_Amazon-VPC_Elastic-Network-Interface_48.svg",
  aws_rds_cluster: "/icons/Arch_Amazon-RDS_64.svg",
  aws_s3_bucket: "/icons/Res_Amazon-Simple-Storage-Service_Bucket_48.svg",
  aws_security_group: "/icons/aws_security_group.svg",
  aws_vpc: "/icons/Virtual-private-cloud-VPC_32.svg",
  aws_region: "/icons/Region_32.svg",
  aws_availability_zone: "/icons/AWS_Availability_Zone.png",
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
