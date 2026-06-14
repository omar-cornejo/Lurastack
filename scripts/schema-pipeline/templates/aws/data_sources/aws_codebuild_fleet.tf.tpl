# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codebuild_fleet                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_codebuild_fleet" "this" {

  name                  = ""     # string | required
  tags                  = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # base_capacity         = 0      # number | computed
  # compute_configuration = [  # list(object)
  #   {
  #     disk = 0
  #     machine_type = ""
  #     memory = 0
  #     vcpu = 0
  #   }
  # ]
  # compute_type          = ""     # string | computed
  # created               = ""     # string | computed
  # environment_type      = ""     # string | computed
  # fleet_service_role    = ""     # string | computed
  # id                    = ""     # string | computed
  # image_id              = ""     # string | computed
  # last_modified         = ""     # string | computed
  # overflow_behavior     = ""     # string | computed
  # scaling_configuration = [  # list(object)
  #   {
  #     desired_capacity = 0
  #     max_capacity = 0
  #     scaling_type = ""
  #     target_tracking_scaling_configs = [  # list(object)
  #       {
  #         metric_type = ""
  #         target_value = 0
  #       }
  #     ]
  #   }
  # ]
  # status = [  # set(object)
  #   {
  #     context = ""
  #     message = ""
  #     status_code = ""
  #   }
  # ]
  # vpc_config = [  # list(object)
  #   {
  #     security_group_ids = []  # set(string)
  #     subnets = []  # set(string)
  #     vpc_id = ""
  #   }
  # ]

}

