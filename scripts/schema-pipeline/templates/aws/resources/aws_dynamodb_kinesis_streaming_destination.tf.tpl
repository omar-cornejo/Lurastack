# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_kinesis_streaming_destination          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_kinesis_streaming_destination" "this" {

  stream_arn                               = ""     # string | required
  table_name                               = ""     # string | required
  approximate_creation_date_time_precision = ""     # string | optional+computed
  id                                       = ""     # string | optional+computed

}

