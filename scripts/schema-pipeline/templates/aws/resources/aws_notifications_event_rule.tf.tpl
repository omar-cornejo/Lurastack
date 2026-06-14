# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_notifications_event_rule                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_notifications_event_rule" "this" {

  event_type                     = ""     # string | required
  notification_configuration_arn = ""     # string | required
  regions                        = []     # set(string) | required
  source                         = ""     # string | required
  event_pattern                  = ""     # string | optional

  # arn                            = ""     # string | computed

}

