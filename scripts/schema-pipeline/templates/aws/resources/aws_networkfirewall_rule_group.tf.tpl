# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkfirewall_rule_group                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkfirewall_rule_group" "this" {

  capacity     = 0      # number | required
  name         = ""     # string | required
  type         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  rules        = ""     # string | optional
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # update_token = ""     # string | computed

  encryption_configuration { # list [0..1]
    type   = ""     # string | required
    key_id = ""     # string | optional

  }

  rule_group { # list [0..1]

    reference_sets { # list [0..1]

      ip_set_references { # set [0..5]
        key = ""     # string | required

        ip_set_reference { # list [1..*]
          reference_arn = ""     # string | required

        }

      }

    }

    rule_variables { # list [0..1]

      ip_sets { # set
        key = ""     # string | required

        ip_set { # list [1..1]
          definition = []     # set(string) | required

        }

      }

      port_sets { # set
        key = ""     # string | required

        port_set { # list [1..1]
          definition = []     # set(string) | required

        }

      }

    }

    rules_source { # list [1..1]
      rules_string = ""     # string | optional

      rules_source_list { # list [0..1]
        generated_rules_type = ""     # string | required
        target_types         = []     # set(string) | required
        targets              = []     # set(string) | required

      }

      stateful_rule { # list
        action = ""     # string | required

        header { # list [1..1]
          destination      = ""     # string | required
          destination_port = ""     # string | required
          direction        = ""     # string | required
          protocol         = ""     # string | required
          source           = ""     # string | required
          source_port      = ""     # string | required

        }

        rule_option { # set [1..*]
          keyword  = ""     # string | required
          settings = []     # set(string) | optional

        }

      }

      stateless_rules_and_custom_actions { # list [0..1]

        custom_action { # set
          action_name = ""     # string | required

          action_definition { # list [1..1]

            publish_metric_action { # list [1..1]

              dimension { # set [1..*]
                value = ""     # string | required

              }

            }

          }

        }

        stateless_rule { # set [1..*]
          priority = 0      # number | required

          rule_definition { # list [1..1]
            actions = []     # set(string) | required

            match_attributes { # list [1..1]
              protocols = []     # set(number) | optional

              destination { # set
                address_definition = ""     # string | required

              }

              destination_port { # set
                from_port = 0      # number | required
                to_port   = 0      # number | optional

              }

              source { # set
                address_definition = ""     # string | required

              }

              source_port { # set
                from_port = 0      # number | required
                to_port   = 0      # number | optional

              }

              tcp_flag { # set
                flags = []     # set(string) | required
                masks = []     # set(string) | optional

              }

            }

          }

        }

      }

    }

    stateful_rule_options { # list [0..1]
      rule_order = ""     # string | required

    }

  }

}

