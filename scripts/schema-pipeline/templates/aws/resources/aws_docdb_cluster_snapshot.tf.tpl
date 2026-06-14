# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_docdb_cluster_snapshot                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_docdb_cluster_snapshot" "this" {

  db_cluster_identifier          = ""     # string | required
  db_cluster_snapshot_identifier = ""     # string | required
  id                             = ""     # string | optional+computed

  # availability_zones             = []     # list(string) | computed
  # db_cluster_snapshot_arn        = ""     # string | computed
  # engine                         = ""     # string | computed
  # engine_version                 = ""     # string | computed
  # kms_key_id                     = ""     # string | computed
  # port                           = 0      # number | computed
  # snapshot_type                  = ""     # string | computed
  # source_db_cluster_snapshot_arn = ""     # string | computed
  # status                         = ""     # string | computed
  # storage_encrypted              = false  # bool | computed
  # vpc_id                         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

