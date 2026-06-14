# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_subscription_filter              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_subscription_filter" "this" {

  destination_arn = ""     # string | required
  filter_pattern  = ""     # string | required
  log_group_name  = ""     # string | required
  name            = ""     # string | required
  distribution    = ""     # string | optional
  id              = ""     # string | optional+computed
  role_arn        = ""     # string | optional+computed

}

