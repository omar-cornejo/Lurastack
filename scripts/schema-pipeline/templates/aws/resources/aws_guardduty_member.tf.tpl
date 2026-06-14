# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_member                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_member" "this" {

  account_id                 = ""     # string | required
  detector_id                = ""     # string | required
  email                      = ""     # string | required
  disable_email_notification = false  # bool | optional
  id                         = ""     # string | optional+computed
  invitation_message         = ""     # string | optional
  invite                     = false  # bool | optional

  # relationship_status        = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

