# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_scheduler_schedule                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_scheduler_schedule" "this" {

  schedule_expression          = ""     # string | required
  description                  = ""     # string | optional
  end_date                     = ""     # string | optional
  group_name                   = ""     # string | optional+computed
  id                           = ""     # string | optional+computed
  kms_key_arn                  = ""     # string | optional
  name                         = ""     # string | optional+computed
  name_prefix                  = ""     # string | optional+computed
  schedule_expression_timezone = ""     # string | optional
  start_date                   = ""     # string | optional
  state                        = ""     # string | optional

  # arn                          = ""     # string | computed

  flexible_time_window { # list [1..1]
    mode                      = ""     # string | required
    maximum_window_in_minutes = 0      # number | optional

  }

  target { # list [1..1]
    arn      = ""     # string | required
    role_arn = ""     # string | required
    input    = ""     # string | optional

    dead_letter_config { # list [0..1]
      arn = ""     # string | required

    }

    ecs_parameters { # list [0..1]
      task_definition_arn     = ""     # string | required
      enable_ecs_managed_tags = false  # bool | optional
      enable_execute_command  = false  # bool | optional
      group                   = ""     # string | optional
      launch_type             = ""     # string | optional
      platform_version        = ""     # string | optional
      propagate_tags          = ""     # string | optional
      reference_id            = ""     # string | optional
      tags                    = {}     # map(string) | optional
      task_count              = 0      # number | optional

      capacity_provider_strategy { # set [0..6]
        capacity_provider = ""     # string | required
        base              = 0      # number | optional
        weight            = 0      # number | optional

      }

      network_configuration { # list [0..1]
        subnets          = []     # set(string) | required
        assign_public_ip = false  # bool | optional
        security_groups  = []     # set(string) | optional

      }

      placement_constraints { # set [0..10]
        type       = ""     # string | required
        expression = ""     # string | optional

      }

      placement_strategy { # set [0..5]
        type  = ""     # string | required
        field = ""     # string | optional

      }

    }

    eventbridge_parameters { # list [0..1]
      detail_type = ""     # string | required
      source      = ""     # string | required

    }

    kinesis_parameters { # list [0..1]
      partition_key = ""     # string | required

    }

    retry_policy { # list [0..1]
      maximum_event_age_in_seconds = 0      # number | optional
      maximum_retry_attempts       = 0      # number | optional

    }

    sagemaker_pipeline_parameters { # list [0..1]

      pipeline_parameter { # set [0..200]
        name  = ""     # string | required
        value = ""     # string | required

      }

    }

    sqs_parameters { # list [0..1]
      message_group_id = ""     # string | optional

    }

  }

}

