# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sns_topic_data_protection_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sns_topic_data_protection_policy" "this" {

  arn    = ""     # string | required
  policy = ""     # string | required
  id     = ""     # string | optional+computed

}

