# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpointsmsvoicev2_configuration_set            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpointsmsvoicev2_configuration_set" "this" {

  name                 = ""     # string | required
  default_message_type = ""     # string | optional
  default_sender_id    = ""     # string | optional
  tags                 = {}     # map(string) | optional

  # arn                  = ""     # string | computed
  # id                   = ""     # string | computed
  # tags_all             = {}     # map(string) | computed

}

