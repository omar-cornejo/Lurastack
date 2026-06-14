# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_notifications_channel_association               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_notifications_channel_association" "this" {

  arn                            = ""     # string | required
  notification_configuration_arn = ""     # string | required

}

