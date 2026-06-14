# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_connect_peer                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_connect_peer" "this" {

  inside_cidr_blocks            = []     # set(string) | required
  peer_address                  = ""     # string | required
  transit_gateway_attachment_id = ""     # string | required
  bgp_asn                       = ""     # string | optional+computed
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  transit_gateway_address       = ""     # string | optional+computed

  # arn                           = ""     # string | computed
  # bgp_peer_address              = ""     # string | computed
  # bgp_transit_gateway_addresses = []     # set(string) | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

