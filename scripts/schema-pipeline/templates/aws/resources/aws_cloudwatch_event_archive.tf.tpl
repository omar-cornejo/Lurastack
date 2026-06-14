# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_archive                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_archive" "this" {

  event_source_arn = ""     # string | required
  name             = ""     # string | required
  description      = ""     # string | optional
  event_pattern    = ""     # string | optional
  id               = ""     # string | optional+computed
  retention_days   = 0      # number | optional

  # arn              = ""     # string | computed

}

