# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_site_to_site_vpn_attachment      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_site_to_site_vpn_attachment" "this" {

  core_network_id               = ""     # string | required
  vpn_connection_arn            = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # attachment_policy_rule_number = 0      # number | computed
  # attachment_type               = ""     # string | computed
  # core_network_arn              = ""     # string | computed
  # edge_location                 = ""     # string | computed
  # owner_account_id              = ""     # string | computed
  # resource_arn                  = ""     # string | computed
  # segment_name                  = ""     # string | computed
  # state                         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

