# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_transit_gateway_route_table_attachment  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_transit_gateway_route_table_attachment" "this" {

  peering_id                      = ""     # string | required
  transit_gateway_route_table_arn = ""     # string | required
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # attachment_policy_rule_number   = 0      # number | computed
  # attachment_type                 = ""     # string | computed
  # core_network_arn                = ""     # string | computed
  # core_network_id                 = ""     # string | computed
  # edge_location                   = ""     # string | computed
  # owner_account_id                = ""     # string | computed
  # resource_arn                    = ""     # string | computed
  # segment_name                    = ""     # string | computed
  # state                           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

