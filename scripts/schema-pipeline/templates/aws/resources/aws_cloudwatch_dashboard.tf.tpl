# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_dashboard                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_dashboard" "this" {

  dashboard_body = ""     # string | required
  dashboard_name = ""     # string | required
  id             = ""     # string | optional+computed

  # dashboard_arn  = ""     # string | computed

}

