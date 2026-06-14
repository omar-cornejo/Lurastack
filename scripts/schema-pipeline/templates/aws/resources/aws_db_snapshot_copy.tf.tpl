# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_snapshot_copy                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_snapshot_copy" "this" {

  source_db_snapshot_identifier   = ""     # string | required
  target_db_snapshot_identifier   = ""     # string | required
  copy_tags                       = false  # bool | optional
  destination_region              = ""     # string | optional
  id                              = ""     # string | optional+computed
  kms_key_id                      = ""     # string | optional
  option_group_name               = ""     # string | optional+computed
  presigned_url                   = ""     # string | optional
  shared_accounts                 = []     # set(string) | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  target_custom_availability_zone = ""     # string | optional

  # allocated_storage               = 0      # number | computed
  # availability_zone               = ""     # string | computed
  # db_snapshot_arn                 = ""     # string | computed
  # encrypted                       = false  # bool | computed
  # engine                          = ""     # string | computed
  # engine_version                  = ""     # string | computed
  # iops                            = 0      # number | computed
  # license_model                   = ""     # string | computed
  # port                            = 0      # number | computed
  # snapshot_type                   = ""     # string | computed
  # source_region                   = ""     # string | computed
  # storage_type                    = ""     # string | computed
  # vpc_id                          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

