# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_connect_peer                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_connect_peer" "this" {

  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional+computed
  transit_gateway_connect_peer_id = ""     # string | optional+computed

  # arn                             = ""     # string | computed
  # bgp_asn                         = ""     # string | computed
  # bgp_peer_address                = ""     # string | computed
  # bgp_transit_gateway_addresses   = []     # set(string) | computed
  # inside_cidr_blocks              = []     # list(string) | computed
  # peer_address                    = ""     # string | computed
  # transit_gateway_address         = ""     # string | computed
  # transit_gateway_attachment_id   = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

