# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_snapshot                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_snapshot" "this" {

  volume_id              = ""     # string | required
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed
  outpost_arn            = ""     # string | optional
  permanent_restore      = false  # bool | optional
  storage_tier           = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  temporary_restore_days = 0      # number | optional

  # arn                    = ""     # string | computed
  # data_encryption_key_id = ""     # string | computed
  # encrypted              = false  # bool | computed
  # kms_key_id             = ""     # string | computed
  # owner_alias            = ""     # string | computed
  # owner_id               = ""     # string | computed
  # volume_size            = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

