# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_route_table                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_route_table" "this" {

  transit_gateway_id              = ""     # string | required
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # default_association_route_table = false  # bool | computed
  # default_propagation_route_table = false  # bool | computed

}

