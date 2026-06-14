# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_route_table_association     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_route_table_association" "this" {

  transit_gateway_attachment_id  = ""     # string | required
  transit_gateway_route_table_id = ""     # string | required
  id                             = ""     # string | optional+computed
  replace_existing_association   = false  # bool | optional

  # resource_id                    = ""     # string | computed
  # resource_type                  = ""     # string | computed

}

