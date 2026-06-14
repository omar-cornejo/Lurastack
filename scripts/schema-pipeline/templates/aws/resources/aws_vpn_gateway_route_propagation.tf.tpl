# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpn_gateway_route_propagation                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpn_gateway_route_propagation" "this" {

  route_table_id = ""     # string | required
  vpn_gateway_id = ""     # string | required
  id             = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

