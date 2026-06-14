# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_dx_gateway_attachment            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_dx_gateway_attachment" "this" {

  core_network_id               = ""     # string | required
  direct_connect_gateway_arn    = ""     # string | required
  edge_locations                = []     # list(string) | required
  tags                          = {}     # map(string) | optional

  # arn                           = ""     # string | computed
  # attachment_policy_rule_number = 0      # number | computed
  # attachment_type               = ""     # string | computed
  # core_network_arn              = ""     # string | computed
  # id                            = ""     # string | computed
  # owner_account_id              = ""     # string | computed
  # segment_name                  = ""     # string | computed
  # state                         = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

