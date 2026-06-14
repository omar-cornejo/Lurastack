# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_environment                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_environment" "this" {

  kms_key_id                = ""     # string | required
  name                      = ""     # string | required
  description               = ""     # string | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # availability_zones        = []     # list(string) | computed
  # created_timestamp         = ""     # string | computed
  # id                        = ""     # string | computed
  # infrastructure_account_id = ""     # string | computed
  # last_modified_timestamp   = ""     # string | computed
  # status                    = ""     # string | computed

  custom_dns_configuration { # list
    custom_dns_server_ip   = ""     # string | required
    custom_dns_server_name = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  transit_gateway_configuration { # list [0..1]
    routable_cidr_space = ""     # string | required
    transit_gateway_id  = ""     # string | required

    attachment_network_acl_configuration { # list [0..100]
      cidr_block  = ""     # string | required
      protocol    = ""     # string | required
      rule_action = ""     # string | required
      rule_number = 0      # number | required

      icmp_type_code { # list [0..1]
        code = 0      # number | required
        type = 0      # number | required

      }

      port_range { # list [0..1]
        from = 0      # number | required
        to   = 0      # number | required

      }

    }

  }

}

