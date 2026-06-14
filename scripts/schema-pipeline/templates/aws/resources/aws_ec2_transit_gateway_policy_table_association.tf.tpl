# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_policy_table_association    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_policy_table_association" "this" {

  transit_gateway_attachment_id   = ""     # string | required
  transit_gateway_policy_table_id = ""     # string | required
  id                              = ""     # string | optional+computed

  # resource_id                     = ""     # string | computed
  # resource_type                   = ""     # string | computed

}

