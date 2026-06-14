# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_destination_policy               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_destination_policy" "this" {

  access_policy    = ""     # string | required
  destination_name = ""     # string | required
  force_update     = false  # bool | optional
  id               = ""     # string | optional+computed

}

