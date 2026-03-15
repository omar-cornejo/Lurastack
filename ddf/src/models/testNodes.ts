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
    hclTemplate: `resource "aws_instance" "web" {
  ami                    = "ami-xxxxxxxx"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "ec2-web"
  }
}`,
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
    hclTemplate: `resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}`,
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
    hclTemplate: `resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zone.selected.name

  tags = {
    Name = "public-subnet"
  }
}`,
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
    hclTemplate: `resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}`,
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
    hclTemplate: `resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Security group for web instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}`,
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
    id: "region",
    label: "Region",
    schemaGroup: "data_sources",
    terraformType: "aws_region",
    terraformKind: "data",
    icon: MOCK_ICON_PATH,
    hclTemplate: `data "aws_region" "current" {}`,
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
    hclTemplate: `data "aws_availability_zone" "selected" {
  name = "us-east-1a"
}`,
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
