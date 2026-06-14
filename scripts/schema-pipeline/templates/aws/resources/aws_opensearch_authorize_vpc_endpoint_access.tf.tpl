# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearch_authorize_vpc_endpoint_access        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearch_authorize_vpc_endpoint_access" "this" {

  account              = ""     # string | required
  domain_name          = ""     # string | required

  # authorized_principal = [  # list(object)
  #   {
  #     principal = ""
  #     principal_type = ""
  #   }
  # ]

}

