# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_bus_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_bus_policy" "this" {

  policy         = ""     # string | required
  event_bus_name = ""     # string | optional
  id             = ""     # string | optional+computed

}

