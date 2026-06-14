# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_capacity_provider                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_capacity_provider" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  auto_scaling_group_provider { # list [1..1]
    auto_scaling_group_arn         = ""     # string | required
    managed_draining               = ""     # string | optional+computed
    managed_termination_protection = ""     # string | optional+computed

    managed_scaling { # list [0..1]
      instance_warmup_period    = 0      # number | optional+computed
      maximum_scaling_step_size = 0      # number | optional+computed
      minimum_scaling_step_size = 0      # number | optional+computed
      status                    = ""     # string | optional+computed
      target_capacity           = 0      # number | optional+computed

    }

  }

}

