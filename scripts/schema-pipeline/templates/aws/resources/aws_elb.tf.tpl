# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elb                                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elb" "this" {

  availability_zones          = []     # set(string) | optional+computed
  connection_draining         = false  # bool | optional
  connection_draining_timeout = 0      # number | optional
  cross_zone_load_balancing   = false  # bool | optional
  desync_mitigation_mode      = ""     # string | optional
  id                          = ""     # string | optional+computed
  idle_timeout                = 0      # number | optional
  instances                   = []     # set(string) | optional+computed
  internal                    = false  # bool | optional+computed
  name                        = ""     # string | optional+computed
  name_prefix                 = ""     # string | optional+computed
  security_groups             = []     # set(string) | optional+computed
  source_security_group       = ""     # string | optional+computed
  subnets                     = []     # set(string) | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # dns_name                    = ""     # string | computed
  # source_security_group_id    = ""     # string | computed
  # zone_id                     = ""     # string | computed

  access_logs { # list [0..1]
    bucket        = ""     # string | required
    bucket_prefix = ""     # string | optional
    enabled       = false  # bool | optional
    interval      = 0      # number | optional

  }

  health_check { # list [0..1]
    healthy_threshold   = 0      # number | required
    interval            = 0      # number | required
    target              = ""     # string | required
    timeout             = 0      # number | required
    unhealthy_threshold = 0      # number | required

  }

  listener { # set [1..*]
    instance_port      = 0      # number | required
    instance_protocol  = ""     # string | required
    lb_port            = 0      # number | required
    lb_protocol        = ""     # string | required
    ssl_certificate_id = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

