import awsInstanceTpl from "../schemas/aws/templates/resources/aws_instance.tf.tpl?raw";
import awsInternetGatewayTpl from "../schemas/aws/templates/resources/aws_internet_gateway.tf.tpl?raw";
import awsNetworkInterfaceTpl from "../schemas/aws/templates/resources/aws_network_interface.tf.tpl?raw";
import awsSecurityGroupTpl from "../schemas/aws/templates/resources/aws_security_group.tf.tpl?raw";
import awsSubnetTpl from "../schemas/aws/templates/resources/aws_subnet.tf.tpl?raw";
import awsVpcTpl from "../schemas/aws/templates/resources/aws_vpc.tf.tpl?raw";
import awsAvailabilityZoneTpl from "../schemas/aws/templates/data_sources/aws_availability_zone.tf.tpl?raw";
import awsRegionTpl from "../schemas/aws/templates/data_sources/aws_region.tf.tpl?raw";

export type TerraformNodeProperty = {
  name: string;
  type: string;
  required?: boolean;
  computed?: boolean;
};

export type TerraformNodeSchema = {
  id: string;
  label: string;
  schemaGroup: "resources" | "data_sources" | "ephemeral_resources" | "functions" | "provider";
  terraformType: string;
  terraformKind: "resource" | "data";
  icon: string;
  hclTemplate: string;
  properties: TerraformNodeProperty[];
  searchTerms?: string[];
  sourceSchemaPath: string;
  sourceTemplatePath: string;
};

const MOCK_ICON_PATH = "/mock-node.svg";

export const TEST_NODE_SCHEMAS: TerraformNodeSchema[] = [
  {
    id: "ec2",
    label: "EC2",
    schemaGroup: "resources",
    terraformType: "aws_instance",
    terraformKind: "resource",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsInstanceTpl,
    properties: [
      { name: "ami", type: "string", required: true },
      { name: "instance_type", type: "string", required: true },
      { name: "subnet_id", type: "string" },
      { name: "vpc_security_group_ids", type: "set(string)" },
      { name: "availability_zone", type: "string", computed: true },
    ],
    searchTerms: ["instance", "vm", "compute", "ec2 instance"],
    sourceSchemaPath:
      "src/schemas/aws/resources/aws_instance.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/resources/aws_instance.tf.tpl",
  },
  {
    id: "igw",
    label: "IGW",
    schemaGroup: "resources",
    terraformType: "aws_internet_gateway",
    terraformKind: "resource",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsInternetGatewayTpl,
    properties: [
      { name: "vpc_id", type: "string" },
      { name: "tags", type: "map(string)" },
      { name: "id", type: "string", computed: true },
    ],
    searchTerms: ["internet gateway", "gateway", "igw aws"],
    sourceSchemaPath:
      "src/schemas/aws/resources/aws_internet_gateway.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/resources/aws_internet_gateway.tf.tpl",
  },
  {
    id: "subnet",
    label: "Subnet",
    schemaGroup: "resources",
    terraformType: "aws_subnet",
    terraformKind: "resource",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsSubnetTpl,
    properties: [
      { name: "vpc_id", type: "string", required: true },
      { name: "cidr_block", type: "string" },
      { name: "availability_zone", type: "string" },
      { name: "map_public_ip_on_launch", type: "bool" },
    ],
    searchTerms: ["network", "private subnet", "public subnet"],
    sourceSchemaPath:
      "src/schemas/aws/resources/aws_subnet.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/resources/aws_subnet.tf.tpl",
  },
  {
    id: "vpc",
    label: "VPC",
    schemaGroup: "resources",
    terraformType: "aws_vpc",
    terraformKind: "resource",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsVpcTpl,
    properties: [
      { name: "cidr_block", type: "string" },
      { name: "enable_dns_support", type: "bool" },
      { name: "enable_dns_hostnames", type: "bool" },
      { name: "instance_tenancy", type: "string" },
    ],
    searchTerms: ["virtual private cloud", "network"],
    sourceSchemaPath:
      "src/schemas/aws/resources/aws_vpc.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/resources/aws_vpc.tf.tpl",
  },
  {
    id: "securitygroup",
    label: "Security Group",
    schemaGroup: "resources",
    terraformType: "aws_security_group",
    terraformKind: "resource",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsSecurityGroupTpl,
    properties: [
      { name: "name", type: "string" },
      { name: "description", type: "string" },
      { name: "vpc_id", type: "string" },
      { name: "ingress", type: "set(object)", computed: true },
      { name: "egress", type: "set(object)", computed: true },
    ],
    searchTerms: ["sg", "firewall", "security"],
    sourceSchemaPath:
      "src/schemas/aws/resources/aws_security_group.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/resources/aws_security_group.tf.tpl",
  },
  {
    id: "network-interface",
    label: "Network Interface",
    schemaGroup: "resources",
    terraformType: "aws_network_interface",
    terraformKind: "resource",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsNetworkInterfaceTpl,
    properties: [
      { name: "subnet_id", type: "string", required: true },
      { name: "private_ips", type: "set(string)" },
      { name: "private_ip", type: "string" },
      { name: "security_groups", type: "set(string)" },
      { name: "description", type: "string" },
      { name: "source_dest_check", type: "bool" },
      { name: "tags", type: "map(string)" },
      { name: "id", type: "string", computed: true },
    ],
    searchTerms: ["eni", "network interface", "elastic network interface", "nic"],
    sourceSchemaPath:
      "src/schemas/aws/resources/aws_network_interface.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/resources/aws_network_interface.tf.tpl",
  },
  {
    id: "region",
    label: "Region",
    schemaGroup: "data_sources",
    terraformType: "aws_region",
    terraformKind: "data",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsRegionTpl,
    properties: [
      { name: "name", type: "string", computed: true },
      { name: "endpoint", type: "string", computed: true },
      { name: "description", type: "string", computed: true },
    ],
    searchTerms: ["aws region", "location", "current region"],
    sourceSchemaPath:
      "src/schemas/aws/data_sources/aws_region.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/data_sources/aws_region.tf.tpl",
  },
  {
    id: "availability-zone",
    label: "Availability Zone",
    schemaGroup: "data_sources",
    terraformType: "aws_availability_zone",
    terraformKind: "data",
    icon: MOCK_ICON_PATH,
    hclTemplate: awsAvailabilityZoneTpl,
    properties: [
      { name: "name", type: "string" },
      { name: "state", type: "string", computed: true },
      { name: "zone_id", type: "string", computed: true },
      { name: "group_name", type: "string", computed: true },
    ],
    searchTerms: ["az", "availability", "zone", "availability zone"],
    sourceSchemaPath:
      "src/schemas/aws/data_sources/aws_availability_zone.json",
    sourceTemplatePath:
      "src/schemas/aws/templates/data_sources/aws_availability_zone.tf.tpl",
  },
];
