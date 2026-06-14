# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kinesis_stream_consumer                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_kinesis_stream_consumer" "this" {

  stream_arn         = ""     # string | required
  arn                = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  name               = ""     # string | optional+computed

  # creation_timestamp = ""     # string | computed
  # status             = ""     # string | computed

}

