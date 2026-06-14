# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sqs_queue                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_sqs_queue" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional+computed

  # arn  = ""     # string | computed
  # url  = ""     # string | computed

}

