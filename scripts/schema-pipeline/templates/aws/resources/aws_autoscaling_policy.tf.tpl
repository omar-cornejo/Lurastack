# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_policy                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_policy" "this" {

  autoscaling_group_name    = ""     # string | required
  name                      = ""     # string | required
  adjustment_type           = ""     # string | optional
  cooldown                  = 0      # number | optional
  enabled                   = false  # bool | optional
  estimated_instance_warmup = 0      # number | optional
  id                        = ""     # string | optional+computed
  metric_aggregation_type   = ""     # string | optional+computed
  min_adjustment_magnitude  = 0      # number | optional
  policy_type               = ""     # string | optional
  scaling_adjustment        = 0      # number | optional

  # arn                       = ""     # string | computed

  predictive_scaling_configuration { # list [0..1]
    max_capacity_breach_behavior = ""     # string | optional
    max_capacity_buffer          = ""     # string | optional
    mode                         = ""     # string | optional
    scheduling_buffer_time       = ""     # string | optional

    metric_specification { # list [1..1]
      target_value = 0      # number | required

      customized_capacity_metric_specification { # list [0..1]

        metric_data_queries { # list [1..10]
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

      customized_load_metric_specification { # list [0..1]

        metric_data_queries { # list [1..10]
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

      customized_scaling_metric_specification { # list [0..1]

        metric_data_queries { # list [1..10]
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

      predefined_load_metric_specification { # list [0..1]
        predefined_metric_type = ""     # string | required
        resource_label         = ""     # string | optional

      }

      predefined_metric_pair_specification { # list [0..1]
        predefined_metric_type = ""     # string | required
        resource_label         = ""     # string | optional

      }

      predefined_scaling_metric_specification { # list [0..1]
        predefined_metric_type = ""     # string | required
        resource_label         = ""     # string | optional

      }

    }

  }

  step_adjustment { # set
    scaling_adjustment          = 0      # number | required
    metric_interval_lower_bound = ""     # string | optional
    metric_interval_upper_bound = ""     # string | optional

  }

  target_tracking_configuration { # list [0..1]
    target_value     = 0      # number | required
    disable_scale_in = false  # bool | optional

    customized_metric_specification { # list [0..1]
      metric_name = ""     # string | optional
      namespace   = ""     # string | optional
      period      = 0      # number | optional
      statistic   = ""     # string | optional
      unit        = ""     # string | optional

      metric_dimension { # list
        name  = ""     # string | required
        value = ""     # string | required

      }

      metrics { # set
        id          = ""     # string | required
        expression  = ""     # string | optional
        label       = ""     # string | optional
        return_data = false  # bool | optional

        metric_stat { # list [0..1]
          stat   = ""     # string | required
          period = 0      # number | optional
          unit   = ""     # string | optional

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

