# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fms_policy                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fms_policy" "this" {

  exclude_resource_tags              = false  # bool | required
  name                               = ""     # string | required
  delete_all_policy_resources        = false  # bool | optional
  delete_unused_fm_managed_resources = false  # bool | optional
  description                        = ""     # string | optional
  id                                 = ""     # string | optional+computed
  remediation_enabled                = false  # bool | optional
  resource_set_ids                   = []     # set(string) | optional+computed
  resource_tags                      = {}     # map(string) | optional
  resource_type                      = ""     # string | optional+computed
  resource_type_list                 = []     # set(string) | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed

  # arn                                = ""     # string | computed
  # policy_update_token                = ""     # string | computed

  exclude_map { # list [0..1]
    account = []     # set(string) | optional
    orgunit = []     # set(string) | optional

  }

  include_map { # list [0..1]
    account = []     # set(string) | optional
    orgunit = []     # set(string) | optional

  }

  security_service_policy_data { # list [1..1]
    type                 = ""     # string | required
    managed_service_data = ""     # string | optional

    policy_option { # list [0..1]

      network_acl_common_policy { # list [0..1]

        network_acl_entry_set { # list [0..1]
          force_remediate_for_first_entries = false  # bool | required
          force_remediate_for_last_entries  = false  # bool | required

          first_entry { # set
            egress          = false  # bool | required
            protocol        = ""     # string | required
            rule_action     = ""     # string | required
            cidr_block      = ""     # string | optional
            ipv6_cidr_block = ""     # string | optional

            icmp_type_code { # list
              code = 0      # number | optional
              type = 0      # number | optional

            }

            port_range { # list
              from = 0      # number | optional
              to   = 0      # number | optional

            }

          }

          last_entry { # set
            egress          = false  # bool | required
            protocol        = ""     # string | required
            rule_action     = ""     # string | required
            cidr_block      = ""     # string | optional
            ipv6_cidr_block = ""     # string | optional

            icmp_type_code { # list
              code = 0      # number | optional
              type = 0      # number | optional

            }

            port_range { # list
              from = 0      # number | optional
              to   = 0      # number | optional

            }

          }

        }

      }

      network_firewall_policy { # list [0..1]
        firewall_deployment_model = ""     # string | optional

      }

      third_party_firewall_policy { # list [0..1]
        firewall_deployment_model = ""     # string | optional

      }

    }

  }

}

