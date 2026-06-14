# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_connection_notification            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_connection_notification" "this" {

  connection_events           = []     # set(string) | required
  connection_notification_arn = ""     # string | required
  id                          = ""     # string | optional+computed
  vpc_endpoint_id             = ""     # string | optional
  vpc_endpoint_service_id     = ""     # string | optional

  # notification_type           = ""     # string | computed
  # state                       = ""     # string | computed

}

