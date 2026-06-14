# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_qldb_ledger                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_qldb_ledger" "this" {

  permissions_mode    = ""     # string | required
  deletion_protection = false  # bool | optional
  id                  = ""     # string | optional+computed
  kms_key             = ""     # string | optional+computed
  name                = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

