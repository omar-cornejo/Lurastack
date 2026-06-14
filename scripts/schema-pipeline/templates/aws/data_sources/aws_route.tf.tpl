# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route                                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_route" "this" {

  route_table_id              = ""     # string | required
  carrier_gateway_id          = ""     # string | optional+computed
  core_network_arn            = ""     # string | optional+computed
  destination_cidr_block      = ""     # string | optional+computed
  destination_ipv6_cidr_block = ""     # string | optional+computed
  destination_prefix_list_id  = ""     # string | optional+computed
  egress_only_gateway_id      = ""     # string | optional+computed
  gateway_id                  = ""     # string | optional+computed
  id                          = ""     # string | optional+computed
  instance_id                 = ""     # string | optional+computed
  local_gateway_id            = ""     # string | optional+computed
  nat_gateway_id              = ""     # string | optional+computed
  network_interface_id        = ""     # string | optional+computed
  transit_gateway_id          = ""     # string | optional+computed
  vpc_peering_connection_id   = ""     # string | optional+computed

  timeouts { # single
    read = ""     # string | optional

  }

}

