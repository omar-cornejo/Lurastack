# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appautoscaling_policy                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appautoscaling_policy" "this" {

  name               = ""     # string | required
  resource_id        = ""     # string | required
  scalable_dimension = ""     # string | required
  service_namespace  = ""     # string | required
  id                 = ""     # string | optional+computed
  policy_type        = ""     # string | optional

  # alarm_arns         = []     # list(string) | computed
  # arn                = ""     # string | computed

  step_scaling_policy_configuration { # list [0..1]
    adjustment_type          = ""     # string | optional
    cooldown                 = 0      # number | optional
    metric_aggregation_type  = ""     # string | optional
    min_adjustment_magnitude = 0      # number | optional

    step_adjustment { # set
      scaling_adjustment          = 0      # number | required
      metric_interval_lower_bound = ""     # string | optional
      metric_interval_upper_bound = ""     # string | optional

    }

  }

  target_tracking_scaling_policy_configuration { # list [0..1]
    target_value       = 0      # number | required
    disable_scale_in   = false  # bool | optional
    scale_in_cooldown  = 0      # number | optional
    scale_out_cooldown = 0      # number | optional

    customized_metric_specification { # list [0..1]
      metric_name = ""     # string | optional
      namespace   = ""     # string | optional
      statistic   = ""     # string | optional
      unit        = ""     # string | optional

      dimensions { # set
        name  = ""     # string | required
        value = ""     # string | required

      }

      metrics { # set
        id          = ""     # string | required
        expression  = ""     # string | optional
        label       = ""     # string | optional
        return_data = false  # bool | optional

        metric_stat { # list [0..1]
          stat = ""     # string | required
          unit = ""     # string | optional

          metric { # list [1..1]
            metric_name = ""     # string | required
            namespace   = ""     # string | required

            dimensions { # set
              name  = ""     # string | required
              value = ""     # string | required

            }

          }

        }

      }

    }

    predefined_metric_specification { # list [0..1]
      predefined_metric_type = ""     # string | required
      resource_label         = ""     # string | optional

    }

  }

}

