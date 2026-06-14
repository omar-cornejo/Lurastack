# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_fleet                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_fleet" "this" {

  instance_type                      = ""     # string | required
  name                               = ""     # string | required
  description                        = ""     # string | optional+computed
  disconnect_timeout_in_seconds      = 0      # number | optional+computed
  display_name                       = ""     # string | optional+computed
  enable_default_internet_access     = false  # bool | optional+computed
  fleet_type                         = ""     # string | optional+computed
  iam_role_arn                       = ""     # string | optional+computed
  id                                 = ""     # string | optional+computed
  idle_disconnect_timeout_in_seconds = 0      # number | optional
  image_arn                          = ""     # string | optional+computed
  image_name                         = ""     # string | optional+computed
  max_sessions_per_instance          = 0      # number | optional
  max_user_duration_in_seconds       = 0      # number | optional+computed
  stream_view                        = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed

  # arn                                = ""     # string | computed
  # created_time                       = ""     # string | computed
  # state                              = ""     # string | computed

  compute_capacity { # list [1..1]
    desired_instances = 0      # number | optional
    desired_sessions  = 0      # number | optional

    # available         = 0      # number | computed
    # in_use            = 0      # number | computed
    # running           = 0      # number | computed

  }

  domain_join_info { # list [0..1]
    directory_name                         = ""     # string | optional+computed
    organizational_unit_distinguished_name = ""     # string | optional+computed

  }

  vpc_config { # list [0..1]
    security_group_ids = []     # list(string) | optional+computed
    subnet_ids         = []     # list(string) | optional+computed

  }

}

