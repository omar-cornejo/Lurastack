# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector2_delegated_admin_account              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector2_delegated_admin_account" "this" {

  account_id          = ""     # string | required
  id                  = ""     # string | optional+computed

  # relationship_status = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

