# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_peering_attachment          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_peering_attachment" "this" {

  peer_region             = ""     # string | required
  peer_transit_gateway_id = ""     # string | required
  transit_gateway_id      = ""     # string | required
  id                      = ""     # string | optional+computed
  peer_account_id         = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # state                   = ""     # string | computed

  options { # list [0..1]
    dynamic_routing = ""     # string | optional

  }

}

