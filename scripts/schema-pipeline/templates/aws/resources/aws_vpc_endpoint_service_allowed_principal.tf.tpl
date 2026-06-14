# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_service_allowed_principal          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_service_allowed_principal" "this" {

  principal_arn           = ""     # string | required
  vpc_endpoint_service_id = ""     # string | required
  id                      = ""     # string | optional+computed

}

