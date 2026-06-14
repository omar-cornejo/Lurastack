# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_member                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_member" "this" {

  account_id    = ""     # string | required
  email         = ""     # string | optional
  id            = ""     # string | optional+computed
  invite        = false  # bool | optional

  # master_id     = ""     # string | computed
  # member_status = ""     # string | computed

}

