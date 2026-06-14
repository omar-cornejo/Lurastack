# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route_table                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route_table" "this" {

  vpc_id           = ""     # string | required
  id               = ""     # string | optional+computed
  propagating_vgws = []     # set(string) | optional+computed
  route            = []     # set(object({ carrier_gateway_id: string, cidr_block: string, core_network_arn: string, destination_prefix_list_id: string, egress_only_gateway_id: string, gateway_id: string, ipv6_cidr_block: string, local_gateway_id: string, nat_gateway_id: string, network_interface_id: string, transit_gateway_id: string, vpc_endpoint_id: string, vpc_peering_connection_id: string })) | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # owner_id         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

