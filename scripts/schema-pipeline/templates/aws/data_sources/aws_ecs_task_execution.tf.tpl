# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecs_task_execution                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecs_task_execution" "this" {

  cluster                 = ""     # string | required
  task_definition         = ""     # string | required
  client_token            = ""     # string | optional
  desired_count           = 0      # number | optional
  enable_ecs_managed_tags = false  # bool | optional
  enable_execute_command  = false  # bool | optional
  group                   = ""     # string | optional
  id                      = ""     # string | optional+computed
  launch_type             = ""     # string | optional
  platform_version        = ""     # string | optional
  propagate_tags          = ""     # string | optional
  reference_id            = ""     # string | optional
  started_by              = ""     # string | optional
  tags                    = {}     # map(string) | optional

  # task_arns               = []     # list(string) | computed

  capacity_provider_strategy { # set
    capacity_provider = ""     # string | required
    base              = 0      # number | optional
    weight            = 0      # number | optional

  }

  network_configuration { # list [0..1]
    subnets          = []     # set(string) | required
    assign_public_ip = false  # bool | optional
    security_groups  = []     # set(string) | optional

  }

  overrides { # list [0..1]
    cpu                = ""     # string | optional
    execution_role_arn = ""     # string | optional
    memory             = ""     # string | optional
    task_role_arn      = ""     # string | optional

    container_overrides { # list
      name               = ""     # string | required
      command            = []     # list(string) | optional
      cpu                = 0      # number | optional
      memory             = 0      # number | optional
      memory_reservation = 0      # number | optional

      environment { # set
        key   = ""     # string | required
        value = ""     # string | required

      }

      resource_requirements { # set
        type  = ""     # string | required
        value = ""     # string | required

      }

    }

    inference_accelerator_overrides { # set DEPRECATED
      device_name = ""     # string | optional
      device_type = ""     # string | optional

    }

  }

  placement_constraints { # set [0..10]
    type       = ""     # string | required
    expression = ""     # string | optional

  }

  placement_strategy { # list [0..5]
    type  = ""     # string | required
    field = ""     # string | optional

  }

}

