# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkfirewall_firewall                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkfirewall_firewall" "this" {

  firewall_policy_arn               = ""     # string | required
  name                              = ""     # string | required
  vpc_id                            = ""     # string | required
  delete_protection                 = false  # bool | optional
  description                       = ""     # string | optional
  enabled_analysis_types            = []     # set(string) | optional
  firewall_policy_change_protection = false  # bool | optional
  id                                = ""     # string | optional+computed
  subnet_change_protection          = false  # bool | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # firewall_status = [  # list(object)
  #   {
  #     sync_states = [  # set(object)
  #       {
  #         attachment = [  # list(object)
  #           {
  #             endpoint_id = ""
  #             subnet_id = ""
  #           }
  #         ]
  #         availability_zone = ""
  #       }
  #     ]
  #   }
  # ]
  # update_token                      = ""     # string | computed

  encryption_configuration { # list [0..1]
    type   = ""     # string | required
    key_id = ""     # string | optional

  }

  subnet_mapping { # set [1..*]
    subnet_id       = ""     # string | required
    ip_address_type = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

