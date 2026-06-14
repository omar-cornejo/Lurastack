# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_stream                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_stream" "this" {

  log_group_name = ""     # string | required
  name           = ""     # string | required
  id             = ""     # string | optional+computed

  # arn            = ""     # string | computed

}

