# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_endpoint                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_endpoint" "this" {

  endpoint_config_name = ""     # string | required
  id                   = ""     # string | optional+computed
  name                 = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  deployment_config { # list [0..1]

    auto_rollback_configuration { # list [0..1]

      alarms { # set [0..10]
        alarm_name = ""     # string | required

      }

    }

    blue_green_update_policy { # list [0..1]
      maximum_execution_timeout_in_seconds = 0      # number | optional
      termination_wait_in_seconds          = 0      # number | optional

      traffic_routing_configuration { # list [1..1]
        type                     = ""     # string | required
        wait_interval_in_seconds = 0      # number | required

        canary_size { # list [0..1]
          type  = ""     # string | required
          value = 0      # number | required

        }

        linear_step_size { # list [0..1]
          type  = ""     # string | required
          value = 0      # number | required

        }

      }

    }

    rolling_update_policy { # list [0..1]
      wait_interval_in_seconds             = 0      # number | required
      maximum_execution_timeout_in_seconds = 0      # number | optional

      maximum_batch_size { # list [1..1]
        type  = ""     # string | required
        value = 0      # number | required

      }

      rollback_maximum_batch_size { # list [0..1]
        type  = ""     # string | required
        value = 0      # number | required

      }

    }

  }

}

