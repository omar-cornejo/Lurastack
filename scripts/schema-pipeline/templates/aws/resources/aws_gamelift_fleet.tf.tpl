# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_gamelift_fleet                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_gamelift_fleet" "this" {

  ec2_instance_type                  = ""     # string | required
  name                               = ""     # string | required
  build_id                           = ""     # string | optional
  description                        = ""     # string | optional
  fleet_type                         = ""     # string | optional
  id                                 = ""     # string | optional+computed
  instance_role_arn                  = ""     # string | optional
  metric_groups                      = []     # list(string) | optional+computed
  new_game_session_protection_policy = ""     # string | optional
  script_id                          = ""     # string | optional
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed

  # arn                                = ""     # string | computed
  # build_arn                          = ""     # string | computed
  # log_paths                          = []     # list(string) | computed
  # operating_system                   = ""     # string | computed
  # script_arn                         = ""     # string | computed

  certificate_configuration { # list [0..1]
    certificate_type = ""     # string | optional

  }

  ec2_inbound_permission { # set [0..50]
    from_port = 0      # number | required
    ip_range  = ""     # string | required
    protocol  = ""     # string | required
    to_port   = 0      # number | required

  }

  resource_creation_limit_policy { # list [0..1]
    new_game_sessions_per_creator = 0      # number | optional
    policy_period_in_minutes      = 0      # number | optional

  }

  runtime_configuration { # list [0..1]
    game_session_activation_timeout_seconds = 0      # number | optional
    max_concurrent_game_session_activations = 0      # number | optional

    server_process { # list [0..50]
      concurrent_executions = 0      # number | required
      launch_path           = ""     # string | required
      parameters            = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

