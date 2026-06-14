# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpn_connection_route                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpn_connection_route" "this" {

  destination_cidr_block = ""     # string | required
  vpn_connection_id      = ""     # string | required
  id                     = ""     # string | optional+computed

}

