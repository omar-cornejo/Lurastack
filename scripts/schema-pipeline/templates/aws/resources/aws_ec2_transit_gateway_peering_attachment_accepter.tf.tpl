# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_peering_attachment_accepter  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "this" {

  transit_gateway_attachment_id = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # peer_account_id               = ""     # string | computed
  # peer_region                   = ""     # string | computed
  # peer_transit_gateway_id       = ""     # string | computed
  # transit_gateway_id            = ""     # string | computed

}

