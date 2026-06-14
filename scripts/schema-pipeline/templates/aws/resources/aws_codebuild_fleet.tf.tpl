# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codebuild_fleet                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codebuild_fleet" "this" {

  base_capacity      = 0      # number | required
  compute_type       = ""     # string | required
  environment_type   = ""     # string | required
  name               = ""     # string | required
  fleet_service_role = ""     # string | optional
  image_id           = ""     # string | optional
  overflow_behavior  = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created            = ""     # string | computed
  # id                 = ""     # string | computed
  # last_modified      = ""     # string | computed
  # status = [  # set(object)
  #   {
  #     context = ""
  #     message = ""
  #     status_code = ""
  #   }
  # ]

  compute_configuration { # list [0..1]
    disk         = 0      # number | optional+computed
    machine_type = ""     # string | optional
    memory       = 0      # number | optional+computed
    vcpu         = 0      # number | optional+computed

  }

  scaling_configuration { # list [0..1]
    max_capacity     = 0      # number | optional
    scaling_type     = ""     # string | optional

    # desired_capacity = 0      # number | computed

    target_tracking_scaling_configs { # list
      metric_type  = ""     # string | optional
      target_value = 0      # number | optional

    }

  }

  vpc_config { # list
    security_group_ids = []     # set(string) | required
    subnets            = []     # set(string) | required
    vpc_id             = ""     # string | required

  }

}

