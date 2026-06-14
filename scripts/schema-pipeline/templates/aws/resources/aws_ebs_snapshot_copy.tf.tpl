# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_snapshot_copy                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_snapshot_copy" "this" {

  source_region               = ""     # string | required
  source_snapshot_id          = ""     # string | required
  completion_duration_minutes = 0      # number | optional
  description                 = ""     # string | optional
  encrypted                   = false  # bool | optional
  id                          = ""     # string | optional+computed
  kms_key_id                  = ""     # string | optional
  permanent_restore           = false  # bool | optional
  storage_tier                = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed
  temporary_restore_days      = 0      # number | optional

  # arn                         = ""     # string | computed
  # data_encryption_key_id      = ""     # string | computed
  # outpost_arn                 = ""     # string | computed
  # owner_alias                 = ""     # string | computed
  # owner_id                    = ""     # string | computed
  # volume_id                   = ""     # string | computed
  # volume_size                 = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

