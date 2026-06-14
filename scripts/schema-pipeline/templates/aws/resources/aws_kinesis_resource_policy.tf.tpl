# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesis_resource_policy                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesis_resource_policy" "this" {

  policy       = ""     # string | required
  resource_arn = ""     # string | required

  # id           = ""     # string | computed

}

