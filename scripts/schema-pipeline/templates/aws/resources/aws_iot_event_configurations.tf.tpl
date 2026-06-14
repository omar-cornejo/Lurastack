# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_event_configurations                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_event_configurations" "this" {

  event_configurations = {}     # map(bool) | required
  id                   = ""     # string | optional+computed

}

