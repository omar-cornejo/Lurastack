# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_policy_table                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_policy_table" "this" {

  transit_gateway_id = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # state              = ""     # string | computed

}

