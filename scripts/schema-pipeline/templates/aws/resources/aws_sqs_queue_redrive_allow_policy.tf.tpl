# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sqs_queue_redrive_allow_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sqs_queue_redrive_allow_policy" "this" {

  queue_url            = ""     # string | required
  redrive_allow_policy = ""     # string | required
  id                   = ""     # string | optional+computed

}

