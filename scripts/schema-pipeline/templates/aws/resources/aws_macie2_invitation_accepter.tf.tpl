# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_invitation_accepter                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_invitation_accepter" "this" {

  administrator_account_id = ""     # string | required
  id                       = ""     # string | optional+computed

  # invitation_id            = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

