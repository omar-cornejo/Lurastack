# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codedeploy_deployment_config                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codedeploy_deployment_config" "this" {

  deployment_config_name = ""     # string | required
  compute_platform       = ""     # string | optional
  id                     = ""     # string | optional+computed

  # arn                    = ""     # string | computed
  # deployment_config_id   = ""     # string | computed

  minimum_healthy_hosts { # list [0..1]
    type  = ""     # string | optional
    value = 0      # number | optional

  }

  traffic_routing_config { # list [0..1]
    type = ""     # string | optional

    time_based_canary { # list [0..1]
      interval   = 0      # number | optional
      percentage = 0      # number | optional

    }

    time_based_linear { # list [0..1]
      interval   = 0      # number | optional
      percentage = 0      # number | optional

    }

  }

  zonal_config { # list [0..1]
    first_zone_monitor_duration_in_seconds = 0      # number | optional
    monitor_duration_in_seconds            = 0      # number | optional

    minimum_healthy_hosts_per_zone { # list [0..1]
      type  = ""     # string | optional
      value = 0      # number | optional

    }

  }

}

