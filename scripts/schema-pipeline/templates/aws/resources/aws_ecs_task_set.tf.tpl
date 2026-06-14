# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_task_set                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_task_set" "this" {

  cluster                   = ""     # string | required
  service                   = ""     # string | required
  task_definition           = ""     # string | required
  external_id               = ""     # string | optional+computed
  force_delete              = false  # bool | optional
  id                        = ""     # string | optional+computed
  launch_type               = ""     # string | optional+computed
  platform_version          = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed
  wait_until_stable         = false  # bool | optional
  wait_until_stable_timeout = ""     # string | optional

  # arn                       = ""     # string | computed
  # stability_status          = ""     # string | computed
  # status                    = ""     # string | computed
  # task_set_id               = ""     # string | computed

  capacity_provider_strategy { # set
    capacity_provider = ""     # string | required
    weight            = 0      # number | required
    base              = 0      # number | optional

  }

  load_balancer { # set
    container_name     = ""     # string | required
    container_port     = 0      # number | optional
    load_balancer_name = ""     # string | optional
    target_group_arn   = ""     # string | optional

  }

  network_configuration { # list [0..1]
    subnets          = []     # set(string) | required
    assign_public_ip = false  # bool | optional
    security_groups  = []     # set(string) | optional

  }

  scale { # list [0..1]
    unit  = ""     # string | optional
    value = 0      # number | optional

  }

  service_registries { # list [0..1]
    registry_arn   = ""     # string | required
    container_name = ""     # string | optional
    container_port = 0      # number | optional
    port           = 0      # number | optional

  }

}

