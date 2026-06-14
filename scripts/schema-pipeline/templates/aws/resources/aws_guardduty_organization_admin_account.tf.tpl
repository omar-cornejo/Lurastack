# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_organization_admin_account            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_organization_admin_account" "this" {

  admin_account_id = ""     # string | required
  id               = ""     # string | optional+computed

}

