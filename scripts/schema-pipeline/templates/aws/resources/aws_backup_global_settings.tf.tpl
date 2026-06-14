# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_global_settings                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_global_settings" "this" {

  global_settings = {}     # map(string) | required
  id              = ""     # string | optional+computed

}

