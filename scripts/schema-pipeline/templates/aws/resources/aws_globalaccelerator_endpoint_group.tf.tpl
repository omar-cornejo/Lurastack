# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_globalaccelerator_endpoint_group                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_globalaccelerator_endpoint_group" "this" {

  listener_arn                  = ""     # string | required
  endpoint_group_region         = ""     # string | optional+computed
  health_check_interval_seconds = 0      # number | optional
  health_check_path             = ""     # string | optional+computed
  health_check_port             = 0      # number | optional+computed
  health_check_protocol         = ""     # string | optional
  id                            = ""     # string | optional+computed
  threshold_count               = 0      # number | optional
  traffic_dial_percentage       = 0      # number | optional

  # arn                           = ""     # string | computed

  endpoint_configuration { # set
    attachment_arn                 = ""     # string | optional
    client_ip_preservation_enabled = false  # bool | optional+computed
    endpoint_id                    = ""     # string | optional
    weight                         = 0      # number | optional

  }

  port_override { # set [0..10]
    endpoint_port = 0      # number | required
    listener_port = 0      # number | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

