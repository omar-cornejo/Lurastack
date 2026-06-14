# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_vpc_attachment                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_vpc_attachment" "this" {

  core_network_id               = ""     # string | required
  subnet_arns                   = []     # set(string) | required
  vpc_arn                       = ""     # string | required
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

  options { # list [0..1]
    appliance_mode_support = false  # bool | optional
    ipv6_support           = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

