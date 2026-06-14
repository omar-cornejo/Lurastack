# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftserverless_usage_limit                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftserverless_usage_limit" "this" {

  amount        = 0      # number | required
  resource_arn  = ""     # string | required
  usage_type    = ""     # string | required
  breach_action = ""     # string | optional
  id            = ""     # string | optional+computed
  period        = ""     # string | optional

  # arn           = ""     # string | computed

}

