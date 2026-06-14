# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sqs_queue_policy                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sqs_queue_policy" "this" {

  policy    = ""     # string | required
  queue_url = ""     # string | required
  id        = ""     # string | optional+computed

}

