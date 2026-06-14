# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_snapshot                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_snapshot" "this" {

  db_instance_identifier        = ""     # string | required
  db_snapshot_identifier        = ""     # string | required
  id                            = ""     # string | optional+computed
  shared_accounts               = []     # set(string) | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

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
  # port                          = 0      # number | computed
  # snapshot_type                 = ""     # string | computed
  # source_db_snapshot_identifier = ""     # string | computed
  # source_region                 = ""     # string | computed
  # status                        = ""     # string | computed
  # storage_type                  = ""     # string | computed
  # vpc_id                        = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

