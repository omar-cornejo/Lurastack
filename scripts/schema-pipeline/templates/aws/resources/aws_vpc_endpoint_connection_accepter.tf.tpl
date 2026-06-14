# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_connection_accepter                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_connection_accepter" "this" {

  vpc_endpoint_id         = ""     # string | required
  vpc_endpoint_service_id = ""     # string | required
  id                      = ""     # string | optional+computed

  # vpc_endpoint_state      = ""     # string | computed

}

