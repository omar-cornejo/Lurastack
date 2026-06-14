# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_target_group                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_target_group" "this" {

  name     = ""     # string | required
  type     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # status   = ""     # string | computed

  config { # list [0..1]
    ip_address_type                = ""     # string | optional+computed
    lambda_event_structure_version = ""     # string | optional+computed
    port                           = 0      # number | optional+computed
    protocol                       = ""     # string | optional+computed
    protocol_version               = ""     # string | optional+computed
    vpc_identifier                 = ""     # string | optional

    health_check { # list [0..1]
      enabled                       = false  # bool | optional
      health_check_interval_seconds = 0      # number | optional
      health_check_timeout_seconds  = 0      # number | optional
      healthy_threshold_count       = 0      # number | optional
      path                          = ""     # string | optional
      port                          = 0      # number | optional+computed
      protocol                      = ""     # string | optional+computed
      protocol_version              = ""     # string | optional
      unhealthy_threshold_count     = 0      # number | optional

      matcher { # list [0..1]
        value = ""     # string | optional

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

