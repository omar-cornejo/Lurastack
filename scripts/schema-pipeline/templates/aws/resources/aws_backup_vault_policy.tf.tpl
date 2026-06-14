# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_vault_policy                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_vault_policy" "this" {

  backup_vault_name = ""     # string | required
  policy            = ""     # string | required
  id                = ""     # string | optional+computed

  # backup_vault_arn  = ""     # string | computed

}

