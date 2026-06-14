# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elb                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_elb" "this" {

  name                        = ""     # string | required
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional+computed

  # access_logs = [  # list(object)
  #   {
  #     bucket = ""
  #     bucket_prefix = ""
  #     enabled = false
  #     interval = 0
  #   }
  # ]
  # arn                         = ""     # string | computed
  # availability_zones          = []     # set(string) | computed
  # connection_draining         = false  # bool | computed
  # connection_draining_timeout = 0      # number | computed
  # cross_zone_load_balancing   = false  # bool | computed
  # desync_mitigation_mode      = ""     # string | computed
  # dns_name                    = ""     # string | computed
  # health_check = [  # list(object)
  #   {
  #     healthy_threshold = 0
  #     interval = 0
  #     target = ""
  #     timeout = 0
  #     unhealthy_threshold = 0
  #   }
  # ]
  # idle_timeout                = 0      # number | computed
  # instances                   = []     # set(string) | computed
  # internal                    = false  # bool | computed
  # listener = [  # set(object)
  #   {
  #     instance_port = 0
  #     instance_protocol = ""
  #     lb_port = 0
  #     lb_protocol = ""
  #     ssl_certificate_id = ""
  #   }
  # ]
  # security_groups             = []     # set(string) | computed
  # source_security_group       = ""     # string | computed
  # source_security_group_id    = ""     # string | computed
  # subnets                     = []     # set(string) | computed
  # zone_id                     = ""     # string | computed

}

