# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_invite_accepter                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_invite_accepter" "this" {

  master_id     = ""     # string | required
  id            = ""     # string | optional+computed

  # invitation_id = ""     # string | computed

}

