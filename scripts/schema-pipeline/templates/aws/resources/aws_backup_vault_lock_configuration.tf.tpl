# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_vault_lock_configuration                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_vault_lock_configuration" "this" {

  backup_vault_name   = ""     # string | required
  changeable_for_days = 0      # number | optional
  id                  = ""     # string | optional+computed
  max_retention_days  = 0      # number | optional
  min_retention_days  = 0      # number | optional

  # backup_vault_arn    = ""     # string | computed

}

