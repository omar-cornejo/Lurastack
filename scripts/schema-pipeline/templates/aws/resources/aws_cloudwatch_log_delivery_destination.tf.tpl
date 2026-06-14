# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_delivery_destination             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_delivery_destination" "this" {

  name                      = ""     # string | required
  output_format             = ""     # string | optional
  tags                      = {}     # map(string) | optional

  # arn                       = ""     # string | computed
  # delivery_destination_type = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed

  delivery_destination_configuration { # list
    destination_resource_arn = ""     # string | required

  }

}

