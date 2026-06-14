# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_event_stream                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_event_stream" "this" {

  application_id         = ""     # string | required
  destination_stream_arn = ""     # string | required
  role_arn               = ""     # string | required
  id                     = ""     # string | optional+computed

}

