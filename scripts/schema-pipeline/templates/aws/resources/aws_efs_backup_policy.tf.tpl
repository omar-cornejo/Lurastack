# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_efs_backup_policy                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_efs_backup_policy" "this" {

  file_system_id = ""     # string | required
  id             = ""     # string | optional+computed

  backup_policy { # list [1..1]
    status = ""     # string | required

  }

}

