# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_account_alias                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_account_alias" "this" {

  account_alias = ""     # string | required
  id            = ""     # string | optional+computed

}

