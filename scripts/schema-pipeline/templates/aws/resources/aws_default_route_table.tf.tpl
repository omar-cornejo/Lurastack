# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_default_route_table                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_default_route_table" "this" {

  default_route_table_id = ""     # string | required
  id                     = ""     # string | optional+computed
  propagating_vgws       = []     # set(string) | optional
  route                  = []     # set(object({ cidr_block: string, core_network_arn: string, destination_prefix_list_id: string, egress_only_gateway_id: string, gateway_id: string, instance_id: string, ipv6_cidr_block: string, nat_gateway_id: string, network_interface_id: string, transit_gateway_id: string, vpc_endpoint_id: string, vpc_peering_connection_id: string })) | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # owner_id               = ""     # string | computed
  # vpc_id                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

