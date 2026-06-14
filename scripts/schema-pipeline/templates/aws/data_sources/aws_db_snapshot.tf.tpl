# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_snapshot                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_snapshot" "this" {

  db_instance_identifier        = ""     # string | optional
  db_snapshot_identifier        = ""     # string | optional
  id                            = ""     # string | optional+computed
  include_public                = false  # bool | optional
  include_shared                = false  # bool | optional
  most_recent                   = false  # bool | optional
  snapshot_type                 = ""     # string | optional
  tags                          = {}     # map(string) | optional+computed

  # allocated_storage             = 0      # number | computed
  # availability_zone             = ""     # string | computed
  # db_snapshot_arn               = ""     # string | computed
  # encrypted                     = false  # bool | computed
  # engine                        = ""     # string | computed
  # engine_version                = ""     # string | computed
  # iops                          = 0      # number | computed
  # kms_key_id                    = ""     # string | computed
  # license_model                 = ""     # string | computed
  # option_group_name             = ""     # string | computed
  # original_snapshot_create_time = ""     # string | computed
  # port                          = 0      # number | computed
  # snapshot_create_time          = ""     # string | computed
  # source_db_snapshot_identifier = ""     # string | computed
  # source_region                 = ""     # string | computed
  # status                        = ""     # string | computed
  # storage_type                  = ""     # string | computed
  # vpc_id                        = ""     # string | computed

}

