# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_transit_gateway_registration     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_transit_gateway_registration" "this" {

  global_network_id   = ""     # string | required
  transit_gateway_arn = ""     # string | required
  id                  = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

