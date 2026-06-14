# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route                                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route" "this" {

  route_table_id              = ""     # string | required
  carrier_gateway_id          = ""     # string | optional
  core_network_arn            = ""     # string | optional
  destination_cidr_block      = ""     # string | optional
  destination_ipv6_cidr_block = ""     # string | optional
  destination_prefix_list_id  = ""     # string | optional
  egress_only_gateway_id      = ""     # string | optional
  gateway_id                  = ""     # string | optional
  id                          = ""     # string | optional+computed
  local_gateway_id            = ""     # string | optional
  nat_gateway_id              = ""     # string | optional
  network_interface_id        = ""     # string | optional+computed
  transit_gateway_id          = ""     # string | optional
  vpc_endpoint_id             = ""     # string | optional
  vpc_peering_connection_id   = ""     # string | optional

  # instance_id                 = ""     # string | computed
  # instance_owner_id           = ""     # string | computed
  # origin                      = ""     # string | computed
  # state                       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

