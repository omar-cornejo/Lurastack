# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_instance_automated_backups_replication       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_instance_automated_backups_replication" "this" {

  source_db_instance_arn = ""     # string | required
  id                     = ""     # string | optional+computed
  kms_key_id             = ""     # string | optional+computed
  pre_signed_url         = ""     # string | optional
  retention_period       = 0      # number | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

