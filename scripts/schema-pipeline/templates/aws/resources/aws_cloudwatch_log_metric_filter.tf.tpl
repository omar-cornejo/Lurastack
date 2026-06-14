# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_metric_filter                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_metric_filter" "this" {

  log_group_name = ""     # string | required
  name           = ""     # string | required
  pattern        = ""     # string | required
  id             = ""     # string | optional+computed

  metric_transformation { # list [1..1]
    name          = ""     # string | required
    namespace     = ""     # string | required
    value         = ""     # string | required
    default_value = ""     # string | optional
    dimensions    = {}     # map(string) | optional
    unit          = ""     # string | optional

  }

}

