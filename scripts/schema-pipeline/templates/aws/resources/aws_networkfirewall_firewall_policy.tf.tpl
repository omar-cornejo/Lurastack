# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkfirewall_firewall_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkfirewall_firewall_policy" "this" {

  name         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # update_token = ""     # string | computed

  encryption_configuration { # list [0..1]
    type   = ""     # string | required
    key_id = ""     # string | optional

  }

  firewall_policy { # list [1..1]
    stateless_default_actions          = []     # set(string) | required
    stateless_fragment_default_actions = []     # set(string) | required
    stateful_default_actions           = []     # set(string) | optional
    tls_inspection_configuration_arn   = ""     # string | optional

    policy_variables { # list [0..1]

      rule_variables { # set
        key = ""     # string | required

        ip_set { # list [1..1]
          definition = []     # set(string) | required

        }

      }

    }

    stateful_engine_options { # list [0..1]
      rule_order              = ""     # string | optional
      stream_exception_policy = ""     # string | optional

      flow_timeouts { # list [0..1]
        tcp_idle_timeout_seconds = 0      # number | optional

      }

    }

    stateful_rule_group_reference { # set
      resource_arn = ""     # string | required
      priority     = 0      # number | optional

      override { # list [0..1]
        action = ""     # string | optional

      }

    }

    stateless_custom_action { # set
      action_name = ""     # string | required

      action_definition { # list [1..1]

        publish_metric_action { # list [1..1]

          dimension { # set [1..*]
            value = ""     # string | required

          }

        }

      }

    }

    stateless_rule_group_reference { # set
      priority     = 0      # number | required
      resource_arn = ""     # string | required

    }

  }

}

