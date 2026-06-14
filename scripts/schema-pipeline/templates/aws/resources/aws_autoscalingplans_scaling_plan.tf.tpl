# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscalingplans_scaling_plan                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscalingplans_scaling_plan" "this" {

  name                 = ""     # string | required
  id                   = ""     # string | optional+computed

  # scaling_plan_version = 0      # number | computed

  application_source { # list [1..1]
    cloudformation_stack_arn = ""     # string | optional

    tag_filter { # set [0..50]
      key    = ""     # string | required
      values = []     # set(string) | optional

    }

  }

  scaling_instruction { # set [1..*]
    max_capacity                             = 0      # number | required
    min_capacity                             = 0      # number | required
    resource_id                              = ""     # string | required
    scalable_dimension                       = ""     # string | required
    service_namespace                        = ""     # string | required
    disable_dynamic_scaling                  = false  # bool | optional
    predictive_scaling_max_capacity_behavior = ""     # string | optional
    predictive_scaling_max_capacity_buffer   = 0      # number | optional+computed
    predictive_scaling_mode                  = ""     # string | optional
    scaling_policy_update_behavior           = ""     # string | optional
    scheduled_action_buffer_time             = 0      # number | optional

    customized_load_metric_specification { # list [0..1]
      metric_name = ""     # string | required
      namespace   = ""     # string | required
      statistic   = ""     # string | required
      dimensions  = {}     # map(string) | optional
      unit        = ""     # string | optional

    }

    predefined_load_metric_specification { # list [0..1]
      predefined_load_metric_type = ""     # string | required
      resource_label              = ""     # string | optional

    }

    target_tracking_configuration { # set [1..10]
      target_value              = 0      # number | required
      disable_scale_in          = false  # bool | optional
      estimated_instance_warmup = 0      # number | optional
      scale_in_cooldown         = 0      # number | optional
      scale_out_cooldown        = 0      # number | optional

      customized_scaling_metric_specification { # list [0..1]
        metric_name = ""     # string | required
        namespace   = ""     # string | required
        statistic   = ""     # string | required
        dimensions  = {}     # map(string) | optional
        unit        = ""     # string | optional

      }

      predefined_scaling_metric_specification { # list [0..1]
        predefined_scaling_metric_type = ""     # string | required
        resource_label                 = ""     # string | optional

      }

    }

  }

}

