# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_route_table_routes              │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_route_table_routes" "this" {

  transit_gateway_route_table_id = ""     # string | required
  id                             = ""     # string | optional+computed

  # routes = [  # list(object)
  #   {
  #     destination_cidr_block = ""
  #     prefix_list_id = ""
  #     state = ""
  #     transit_gateway_route_table_announcement_id = ""
  #     type = ""
  #   }
  # ]

  filter { # set [1..*]
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

