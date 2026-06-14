# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_delivery_source                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_delivery_source" "this" {

  log_type     = ""     # string | required
  name         = ""     # string | required
  resource_arn = ""     # string | required
  tags         = {}     # map(string) | optional

  # arn          = ""     # string | computed
  # service      = ""     # string | computed
  # tags_all     = {}     # map(string) | computed

}

