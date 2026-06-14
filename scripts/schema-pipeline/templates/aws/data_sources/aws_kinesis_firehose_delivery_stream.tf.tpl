# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kinesis_firehose_delivery_stream                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_kinesis_firehose_delivery_stream" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

}

