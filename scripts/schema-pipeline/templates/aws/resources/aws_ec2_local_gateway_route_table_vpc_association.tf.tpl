# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_local_gateway_route_table_vpc_association   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_local_gateway_route_table_vpc_association" "this" {

  local_gateway_route_table_id = ""     # string | required
  vpc_id                       = ""     # string | required
  id                           = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed

  # local_gateway_id             = ""     # string | computed

}

