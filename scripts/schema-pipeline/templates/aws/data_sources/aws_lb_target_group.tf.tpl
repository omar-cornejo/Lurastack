# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lb_target_group                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_lb_target_group" "this" {

  arn                                = ""     # string | optional+computed
  id                                 = ""     # string | optional+computed
  load_balancing_anomaly_mitigation  = ""     # string | optional+computed
  name                               = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional+computed

  # arn_suffix                         = ""     # string | computed
  # connection_termination             = false  # bool | computed
  # deregistration_delay               = ""     # string | computed
  # health_check = [  # list(object)
  #   {
  #     enabled = false
  #     healthy_threshold = 0
  #     interval = 0
  #     matcher = ""
  #     path = ""
  #     port = ""
  #     protocol = ""
  #     timeout = 0
  #     unhealthy_threshold = 0
  #   }
  # ]
  # lambda_multi_value_headers_enabled = false  # bool | computed
  # load_balancer_arns                 = []     # set(string) | computed
  # load_balancing_algorithm_type      = ""     # string | computed
  # load_balancing_cross_zone_enabled  = ""     # string | computed
  # port                               = 0      # number | computed
  # preserve_client_ip                 = ""     # string | computed
  # protocol                           = ""     # string | computed
  # protocol_version                   = ""     # string | computed
  # proxy_protocol_v2                  = false  # bool | computed
  # slow_start                         = 0      # number | computed
  # stickiness = [  # list(object)
  #   {
  #     cookie_duration = 0
  #     cookie_name = ""
  #     enabled = false
  #     type = ""
  #   }
  # ]
  # target_type                        = ""     # string | computed
  # vpc_id                             = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

