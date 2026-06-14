# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elastic_beanstalk_environment                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elastic_beanstalk_environment" "this" {

  application            = ""     # string | required
  name                   = ""     # string | required
  cname_prefix           = ""     # string | optional+computed
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed
  platform_arn           = ""     # string | optional+computed
  poll_interval          = ""     # string | optional
  solution_stack_name    = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  template_name          = ""     # string | optional
  tier                   = ""     # string | optional
  version_label          = ""     # string | optional+computed
  wait_for_ready_timeout = ""     # string | optional

  # all_settings = [  # set(object)
  #   {
  #     name = ""
  #     namespace = ""
  #     resource = ""
  #     value = ""
  #   }
  # ]
  # arn                    = ""     # string | computed
  # autoscaling_groups     = []     # list(string) | computed
  # cname                  = ""     # string | computed
  # endpoint_url           = ""     # string | computed
  # instances              = []     # list(string) | computed
  # launch_configurations  = []     # list(string) | computed
  # load_balancers         = []     # list(string) | computed
  # queues                 = []     # list(string) | computed
  # triggers               = []     # list(string) | computed

  setting { # set
    name      = ""     # string | required
    namespace = ""     # string | required
    value     = ""     # string | required
    resource  = ""     # string | optional

  }

}

