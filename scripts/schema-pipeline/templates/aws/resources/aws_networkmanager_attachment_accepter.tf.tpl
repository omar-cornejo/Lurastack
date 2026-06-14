# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_attachment_accepter              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_attachment_accepter" "this" {

  attachment_id                 = ""     # string | required
  attachment_type               = ""     # string | required
  id                            = ""     # string | optional+computed

  # attachment_policy_rule_number = 0      # number | computed
  # core_network_arn              = ""     # string | computed
  # core_network_id               = ""     # string | computed
  # edge_location                 = ""     # string | computed
  # edge_locations                = []     # list(string) | computed
  # owner_account_id              = ""     # string | computed
  # resource_arn                  = ""     # string | computed
  # segment_name                  = ""     # string | computed
  # state                         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

