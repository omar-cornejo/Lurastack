# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkfirewall_firewall_policy                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkfirewall_firewall_policy" "this" {

  arn             = ""     # string | optional
  id              = ""     # string | optional+computed
  name            = ""     # string | optional
  tags            = {}     # map(string) | optional+computed

  # description     = ""     # string | computed
  # firewall_policy = [  # list(object)
  #   {
  #     policy_variables = [  # list(object)
  #       {
  #         rule_variables = [  # set(object)
  #           {
  #             ip_set = [  # list(object)
  #               {
  #                 definition = []  # set(string)
  #               }
  #             ]
  #             key = ""
  #           }
  #         ]
  #       }
  #     ]
  #     stateful_default_actions = []  # set(string)
  #     stateful_engine_options = [  # list(object)
  #       {
  #         rule_order = ""
  #         stream_exception_policy = ""
  #       }
  #     ]
  #     stateful_rule_group_reference = [  # set(object)
  #       {
  #         override = [  # list(object)
  #           {
  #             action = ""
  #           }
  #         ]
  #         priority = 0
  #         resource_arn = ""
  #       }
  #     ]
  #     stateless_custom_action = [  # set(object)
  #       {
  #         action_definition = [  # list(object)
  #           {
  #             publish_metric_action = [  # list(object)
  #               {
  #                 dimension = [  # set(object)
  #                   {
  #                     value = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #           }
  #         ]
  #         action_name = ""
  #       }
  #     ]
  #     stateless_default_actions = []  # set(string)
  #     stateless_fragment_default_actions = []  # set(string)
  #     stateless_rule_group_reference = [  # set(object)
  #       {
  #         priority = 0
  #         resource_arn = ""
  #       }
  #     ]
  #     tls_inspection_configuration_arn = ""
  #   }
  # ]
  # update_token    = ""     # string | computed

}

