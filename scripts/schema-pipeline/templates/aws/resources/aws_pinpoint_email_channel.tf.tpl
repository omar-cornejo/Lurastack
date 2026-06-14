# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_email_channel                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_email_channel" "this" {

  application_id                 = ""     # string | required
  from_address                   = ""     # string | required
  identity                       = ""     # string | required
  configuration_set              = ""     # string | optional
  enabled                        = false  # bool | optional
  id                             = ""     # string | optional+computed
  orchestration_sending_role_arn = ""     # string | optional
  role_arn                       = ""     # string | optional

  # messages_per_second            = 0      # number | computed

}

