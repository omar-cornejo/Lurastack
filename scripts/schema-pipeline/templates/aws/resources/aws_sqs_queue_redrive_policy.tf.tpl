# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sqs_queue_redrive_policy                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sqs_queue_redrive_policy" "this" {

  queue_url      = ""     # string | required
  redrive_policy = ""     # string | required
  id             = ""     # string | optional+computed

}

