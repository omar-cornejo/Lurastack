# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_cluster_snapshot_copy                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_cluster_snapshot_copy" "this" {

  source_db_cluster_snapshot_identifier = ""     # string | required
  target_db_cluster_snapshot_identifier = ""     # string | required
  copy_tags                             = false  # bool | optional
  destination_region                    = ""     # string | optional
  kms_key_id                            = ""     # string | optional
  presigned_url                         = ""     # string | optional
  shared_accounts                       = []     # set(string) | optional
  tags                                  = {}     # map(string) | optional

  # allocated_storage                     = 0      # number | computed
  # db_cluster_snapshot_arn               = ""     # string | computed
  # engine                                = ""     # string | computed
  # engine_version                        = ""     # string | computed
  # id                                    = ""     # string | computed
  # license_model                         = ""     # string | computed
  # snapshot_type                         = ""     # string | computed
  # storage_encrypted                     = false  # bool | computed
  # storage_type                          = ""     # string | computed
  # tags_all                              = {}     # map(string) | computed
  # vpc_id                                = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

