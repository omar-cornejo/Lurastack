# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_route_table_propagation     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_route_table_propagation" "this" {

  transit_gateway_attachment_id  = ""     # string | required
  transit_gateway_route_table_id = ""     # string | required
  id                             = ""     # string | optional+computed

  # resource_id                    = ""     # string | computed
  # resource_type                  = ""     # string | computed

}

