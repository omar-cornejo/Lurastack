# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_alb_target_group                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_alb_target_group" "this" {

  connection_termination             = false  # bool | optional+computed
  deregistration_delay               = ""     # string | optional
  id                                 = ""     # string | optional+computed
  ip_address_type                    = ""     # string | optional+computed
  lambda_multi_value_headers_enabled = false  # bool | optional
  load_balancing_algorithm_type      = ""     # string | optional+computed
  load_balancing_anomaly_mitigation  = ""     # string | optional+computed
  load_balancing_cross_zone_enabled  = ""     # string | optional+computed
  name                               = ""     # string | optional+computed
  name_prefix                        = ""     # string | optional+computed
  port                               = 0      # number | optional
  preserve_client_ip                 = ""     # string | optional+computed
  protocol                           = ""     # string | optional
  protocol_version                   = ""     # string | optional+computed
  proxy_protocol_v2                  = false  # bool | optional
  slow_start                         = 0      # number | optional
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  target_type                        = ""     # string | optional
  vpc_id                             = ""     # string | optional

  # arn                                = ""     # string | computed
  # arn_suffix                         = ""     # string | computed
  # load_balancer_arns                 = []     # set(string) | computed

  health_check { # list [0..1]
    enabled             = false  # bool | optional
    healthy_threshold   = 0      # number | optional
    interval            = 0      # number | optional
    matcher             = ""     # string | optional+computed
    path                = ""     # string | optional+computed
    port                = ""     # string | optional
    protocol            = ""     # string | optional
    timeout             = 0      # number | optional+computed
    unhealthy_threshold = 0      # number | optional

  }

  stickiness { # list [0..1]
    type            = ""     # string | required
    cookie_duration = 0      # number | optional
    cookie_name     = ""     # string | optional
    enabled         = false  # bool | optional

  }

  target_failover { # list
    on_deregistration = ""     # string | required
    on_unhealthy      = ""     # string | required

  }

  target_group_health { # list [0..1]

    dns_failover { # list [0..1]
      minimum_healthy_targets_count      = ""     # string | optional
      minimum_healthy_targets_percentage = ""     # string | optional

    }

    unhealthy_state_routing { # list [0..1]
      minimum_healthy_targets_count      = 0      # number | optional
      minimum_healthy_targets_percentage = ""     # string | optional

    }

  }

  target_health_state { # list
    enable_unhealthy_connection_termination = false  # bool | required
    unhealthy_draining_interval             = 0      # number | optional

  }

}

