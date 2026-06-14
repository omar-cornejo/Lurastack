# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_vault_notifications                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_vault_notifications" "this" {

  backup_vault_events = []     # set(string) | required
  backup_vault_name   = ""     # string | required
  sns_topic_arn       = ""     # string | required
  id                  = ""     # string | optional+computed

  # backup_vault_arn    = ""     # string | computed

}

