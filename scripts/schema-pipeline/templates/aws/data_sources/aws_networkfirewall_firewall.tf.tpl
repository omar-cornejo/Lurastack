# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkfirewall_firewall                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkfirewall_firewall" "this" {

  arn                               = ""     # string | optional+computed
  id                                = ""     # string | optional+computed
  name                              = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional+computed

  # delete_protection                 = false  # bool | computed
  # description                       = ""     # string | computed
  # enabled_analysis_types            = []     # set(string) | computed
  # encryption_configuration = [  # set(object)
  #   {
  #     key_id = ""
  #     type = ""
  #   }
  # ]
  # firewall_policy_arn               = ""     # string | computed
  # firewall_policy_change_protection = false  # bool | computed
  # firewall_status = [  # list(object)
  #   {
  #     capacity_usage_summary = [  # set(object)
  #       {
  #         cidrs = [  # set(object)
  #           {
  #             available_cidr_count = 0
  #             ip_set_references = [  # set(object)
  #               {
  #                 resolved_cidr_count = 0
  #               }
  #             ]
  #             utilized_cidr_count = 0
  #           }
  #         ]
  #       }
  #     ]
  #     configuration_sync_state_summary = ""
  #     status = ""
  #     sync_states = [  # set(object)
  #       {
  #         attachment = [  # list(object)
  #           {
  #             endpoint_id = ""
  #             status = ""
  #             subnet_id = ""
  #           }
  #         ]
  #         availability_zone = ""
  #       }
  #     ]
  #   }
  # ]
  # subnet_change_protection          = false  # bool | computed
  # subnet_mapping = [  # set(object)
  #   {
  #     subnet_id = ""
  #   }
  # ]
  # update_token                      = ""     # string | computed
  # vpc_id                            = ""     # string | computed

}

