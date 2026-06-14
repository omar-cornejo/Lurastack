# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_transit_gateway_connect_peer_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_transit_gateway_connect_peer_association" "this" {

  device_id                        = ""     # string | required
  global_network_id                = ""     # string | required
  transit_gateway_connect_peer_arn = ""     # string | required
  id                               = ""     # string | optional+computed
  link_id                          = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

