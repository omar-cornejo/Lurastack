# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fms_admin_account                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fms_admin_account" "this" {

  account_id = ""     # string | optional+computed
  id         = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

