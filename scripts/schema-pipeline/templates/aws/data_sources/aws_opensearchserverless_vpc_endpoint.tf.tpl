# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearchserverless_vpc_endpoint                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearchserverless_vpc_endpoint" "this" {

  vpc_endpoint_id    = ""     # string | required | The unique identifier of the endpoint.
  id                 = ""     # string | optional+computed

  # created_date       = ""     # string | computed | The date the endpoint was created.
  # name               = ""     # string | computed | The name of the endpoint.
  # security_group_ids = []     # list(string) | computed | The IDs of the security groups that define the ports, protoc…
  # subnet_ids         = []     # list(string) | computed | The IDs of the subnets from which you access OpenSearch Serv…
  # vpc_id             = ""     # string | computed | The ID of the VPC from which you access OpenSearch Serverles…

}

