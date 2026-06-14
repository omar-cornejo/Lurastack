# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_gamelift_game_server_group                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_gamelift_game_server_group" "this" {

  game_server_group_name        = ""     # string | required
  max_size                      = 0      # number | required
  min_size                      = 0      # number | required
  role_arn                      = ""     # string | required
  balancing_strategy            = ""     # string | optional+computed
  game_server_protection_policy = ""     # string | optional+computed
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  vpc_subnets                   = []     # set(string) | optional

  # arn                           = ""     # string | computed
  # auto_scaling_group_arn        = ""     # string | computed

  auto_scaling_policy { # list [0..1]
    estimated_instance_warmup = 0      # number | optional+computed

    target_tracking_configuration { # list [1..1]
      target_value = 0      # number | required

    }

  }

  instance_definition { # set [2..20]
    instance_type     = ""     # string | required
    weighted_capacity = ""     # string | optional

  }

  launch_template { # list [1..1]
    id      = ""     # string | optional+computed
    name    = ""     # string | optional+computed
    version = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

