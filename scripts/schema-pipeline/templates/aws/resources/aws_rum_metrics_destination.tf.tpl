# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rum_metrics_destination                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rum_metrics_destination" "this" {

  app_monitor_name = ""     # string | required
  destination      = ""     # string | required
  destination_arn  = ""     # string | optional
  iam_role_arn     = ""     # string | optional
  id               = ""     # string | optional+computed

}

