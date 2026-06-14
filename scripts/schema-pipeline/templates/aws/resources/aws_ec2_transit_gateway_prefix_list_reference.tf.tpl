# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_prefix_list_reference       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_prefix_list_reference" "this" {

  prefix_list_id                 = ""     # string | required
  transit_gateway_route_table_id = ""     # string | required
  blackhole                      = false  # bool | optional
  id                             = ""     # string | optional+computed
  transit_gateway_attachment_id  = ""     # string | optional

  # prefix_list_owner_id           = ""     # string | computed

}

