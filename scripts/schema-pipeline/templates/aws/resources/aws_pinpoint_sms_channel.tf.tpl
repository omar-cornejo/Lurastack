# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_sms_channel                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_sms_channel" "this" {

  application_id                    = ""     # string | required
  enabled                           = false  # bool | optional
  id                                = ""     # string | optional+computed
  sender_id                         = ""     # string | optional
  short_code                        = ""     # string | optional

  # promotional_messages_per_second   = 0      # number | computed
  # transactional_messages_per_second = 0      # number | computed

}

