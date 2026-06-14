# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_qldb_ledger                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_qldb_ledger" "this" {

  name                = ""     # string | required
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # deletion_protection = false  # bool | computed
  # kms_key             = ""     # string | computed
  # permissions_mode    = ""     # string | computed

}

