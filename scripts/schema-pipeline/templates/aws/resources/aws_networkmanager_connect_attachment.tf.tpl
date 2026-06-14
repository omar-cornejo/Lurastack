# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_connect_attachment               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_connect_attachment" "this" {

  core_network_id               = ""     # string | required
  edge_location                 = ""     # string | required
  transport_attachment_id       = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # attachment_id                 = ""     # string | computed
  # attachment_policy_rule_number = 0      # number | computed
  # attachment_type               = ""     # string | computed
  # core_network_arn              = ""     # string | computed
  # owner_account_id              = ""     # string | computed
  # resource_arn                  = ""     # string | computed
  # segment_name                  = ""     # string | computed
  # state                         = ""     # string | computed

  options { # list [1..1]
    protocol = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

