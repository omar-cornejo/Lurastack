# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_peering_attachment              │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_peering_attachment" "this" {

  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # peer_account_id         = ""     # string | computed
  # peer_region             = ""     # string | computed
  # peer_transit_gateway_id = ""     # string | computed
  # state                   = ""     # string | computed
  # transit_gateway_id      = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

