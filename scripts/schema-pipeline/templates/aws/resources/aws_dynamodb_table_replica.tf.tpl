# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_table_replica                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_table_replica" "this" {

  global_table_arn            = ""     # string | required
  deletion_protection_enabled = false  # bool | optional+computed
  id                          = ""     # string | optional+computed
  kms_key_arn                 = ""     # string | optional+computed
  point_in_time_recovery      = false  # bool | optional
  table_class_override        = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

