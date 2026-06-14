# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_transit_gateway_peering          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_transit_gateway_peering" "this" {

  core_network_id                       = ""     # string | required
  transit_gateway_arn                   = ""     # string | required
  id                                    = ""     # string | optional+computed
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed

  # arn                                   = ""     # string | computed
  # core_network_arn                      = ""     # string | computed
  # edge_location                         = ""     # string | computed
  # owner_account_id                      = ""     # string | computed
  # peering_type                          = ""     # string | computed
  # resource_arn                          = ""     # string | computed
  # transit_gateway_peering_attachment_id = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

