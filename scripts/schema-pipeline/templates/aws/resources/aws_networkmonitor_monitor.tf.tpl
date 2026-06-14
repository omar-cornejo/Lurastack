# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmonitor_monitor                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmonitor_monitor" "this" {

  monitor_name       = ""     # string | required
  aggregation_period = 0      # number | optional+computed
  tags               = {}     # map(string) | optional

  # arn                = ""     # string | computed
  # id                 = ""     # string | computed
  # tags_all           = {}     # map(string) | computed

}

