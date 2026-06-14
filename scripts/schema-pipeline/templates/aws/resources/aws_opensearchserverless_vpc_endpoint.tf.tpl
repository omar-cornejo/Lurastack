# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearchserverless_vpc_endpoint               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearchserverless_vpc_endpoint" "this" {

  name               = ""     # string | required | Name of the interface endpoint.
  subnet_ids         = []     # set(string) | required | One or more subnet IDs from which you'll access OpenSearch S…
  vpc_id             = ""     # string | required | ID of the VPC from which you'll access OpenSearch Serverless…
  security_group_ids = []     # set(string) | optional+computed | One or more security groups that define the ports, protocols…

  # id                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

