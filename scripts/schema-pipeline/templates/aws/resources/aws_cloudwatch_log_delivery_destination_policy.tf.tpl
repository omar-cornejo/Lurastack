# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_delivery_destination_policy      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_delivery_destination_policy" "this" {

  delivery_destination_name   = ""     # string | required
  delivery_destination_policy = ""     # string | required

}

