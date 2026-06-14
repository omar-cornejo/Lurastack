# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_cluster_snapshot                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_cluster_snapshot" "this" {

  db_cluster_identifier          = ""     # string | optional
  db_cluster_snapshot_identifier = ""     # string | optional
  id                             = ""     # string | optional+computed
  include_public                 = false  # bool | optional
  include_shared                 = false  # bool | optional
  most_recent                    = false  # bool | optional
  snapshot_type                  = ""     # string | optional
  tags                           = {}     # map(string) | optional+computed

  # allocated_storage              = 0      # number | computed
  # availability_zones             = []     # list(string) | computed
  # db_cluster_snapshot_arn        = ""     # string | computed
  # engine                         = ""     # string | computed
  # engine_version                 = ""     # string | computed
  # kms_key_id                     = ""     # string | computed
  # license_model                  = ""     # string | computed
  # port                           = 0      # number | computed
  # snapshot_create_time           = ""     # string | computed
  # source_db_cluster_snapshot_arn = ""     # string | computed
  # status                         = ""     # string | computed
  # storage_encrypted              = false  # bool | computed
  # vpc_id                         = ""     # string | computed

}

