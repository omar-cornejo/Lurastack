# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_member                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_member" "this" {

  account_id                            = ""     # string | required
  email                                 = ""     # string | required
  id                                    = ""     # string | optional+computed
  invitation_disable_email_notification = false  # bool | optional
  invitation_message                    = ""     # string | optional
  invite                                = false  # bool | optional+computed
  status                                = ""     # string | optional+computed
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed

  # administrator_account_id              = ""     # string | computed
  # arn                                   = ""     # string | computed
  # invited_at                            = ""     # string | computed
  # master_account_id                     = ""     # string | computed
  # relationship_status                   = ""     # string | computed
  # updated_at                            = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

