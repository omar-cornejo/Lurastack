# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_notifications_notification_configuration        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_notifications_notification_configuration" "this" {

  description          = ""     # string | required
  name                 = ""     # string | required
  aggregation_duration = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional

  # arn                  = ""     # string | computed
  # tags_all             = {}     # map(string) | computed

}

