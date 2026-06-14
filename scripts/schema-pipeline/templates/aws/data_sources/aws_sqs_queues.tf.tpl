# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sqs_queues                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_sqs_queues" "this" {

  id                = ""     # string | optional+computed
  queue_name_prefix = ""     # string | optional

  # queue_urls        = []     # set(string) | computed

}

