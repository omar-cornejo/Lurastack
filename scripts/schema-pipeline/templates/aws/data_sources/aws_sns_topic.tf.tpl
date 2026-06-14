# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sns_topic                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_sns_topic" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional+computed

  # arn  = ""     # string | computed

}

