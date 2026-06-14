# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_api_destination                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_api_destination" "this" {

  connection_arn                   = ""     # string | required
  http_method                      = ""     # string | required
  invocation_endpoint              = ""     # string | required
  name                             = ""     # string | required
  description                      = ""     # string | optional
  id                               = ""     # string | optional+computed
  invocation_rate_limit_per_second = 0      # number | optional

  # arn                              = ""     # string | computed

}

