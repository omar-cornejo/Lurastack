# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_invite_accepter                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_invite_accepter" "this" {

  detector_id       = ""     # string | required
  master_account_id = ""     # string | required
  id                = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional

  }

}

