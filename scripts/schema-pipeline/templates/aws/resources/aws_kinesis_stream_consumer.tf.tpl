# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesis_stream_consumer                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesis_stream_consumer" "this" {

  name               = ""     # string | required
  stream_arn         = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed
  # creation_timestamp = ""     # string | computed

}

