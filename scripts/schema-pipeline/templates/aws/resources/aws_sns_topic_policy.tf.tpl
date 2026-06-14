# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sns_topic_policy                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sns_topic_policy" "this" {

  arn    = ""     # string | required
  policy = ""     # string | required
  id     = ""     # string | optional+computed

  # owner  = ""     # string | computed

}

