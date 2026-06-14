# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ce_anomaly_monitor                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ce_anomaly_monitor" "this" {

  monitor_type          = ""     # string | required
  name                  = ""     # string | required
  id                    = ""     # string | optional+computed
  monitor_dimension     = ""     # string | optional
  monitor_specification = ""     # string | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed

}

