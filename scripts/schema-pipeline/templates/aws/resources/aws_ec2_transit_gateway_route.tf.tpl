# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_route                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_route" "this" {

  destination_cidr_block         = ""     # string | required
  transit_gateway_route_table_id = ""     # string | required
  blackhole                      = false  # bool | optional
  id                             = ""     # string | optional+computed
  transit_gateway_attachment_id  = ""     # string | optional

}

