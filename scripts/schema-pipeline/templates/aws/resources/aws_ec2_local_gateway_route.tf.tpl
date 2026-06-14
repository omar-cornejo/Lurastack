# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_local_gateway_route                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_local_gateway_route" "this" {

  destination_cidr_block                   = ""     # string | required
  local_gateway_route_table_id             = ""     # string | required
  local_gateway_virtual_interface_group_id = ""     # string | required
  id                                       = ""     # string | optional+computed

}

