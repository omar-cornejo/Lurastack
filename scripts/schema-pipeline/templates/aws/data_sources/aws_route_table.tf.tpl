# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route_table                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_route_table" "this" {

  gateway_id     = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  route_table_id = ""     # string | optional+computed
  subnet_id      = ""     # string | optional+computed
  tags           = {}     # map(string) | optional+computed
  vpc_id         = ""     # string | optional+computed

  # arn            = ""     # string | computed
  # associations = [  # list(object)
  #   {
  #     gateway_id = ""
  #     main = false
  #     route_table_association_id = ""
  #     route_table_id = ""
  #     subnet_id = ""
  #   }
  # ]
  # owner_id       = ""     # string | computed
  # routes = [  # list(object)
  #   {
  #     carrier_gateway_id = ""
  #     cidr_block = ""
  #     core_network_arn = ""
  #     destination_prefix_list_id = ""
  #     egress_only_gateway_id = ""
  #     gateway_id = ""
  #     instance_id = ""
  #     ipv6_cidr_block = ""
  #     local_gateway_id = ""
  #     nat_gateway_id = ""
  #     network_interface_id = ""
  #     transit_gateway_id = ""
  #     vpc_endpoint_id = ""
  #     vpc_peering_connection_id = ""
  #   }
  # ]

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

