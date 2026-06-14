# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_composite_alarm                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_composite_alarm" "this" {

  alarm_name                = ""     # string | required
  alarm_rule                = ""     # string | required
  actions_enabled           = false  # bool | optional
  alarm_actions             = []     # set(string) | optional
  alarm_description         = ""     # string | optional
  id                        = ""     # string | optional+computed
  insufficient_data_actions = []     # set(string) | optional
  ok_actions                = []     # set(string) | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed

  actions_suppressor { # list [0..1]
    alarm            = ""     # string | required
    extension_period = 0      # number | required
    wait_period      = 0      # number | required

  }

}

