# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ebs_snapshot                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_ebs_snapshot" "this" {

  id                     = ""     # string | optional+computed
  most_recent            = false  # bool | optional
  owners                 = []     # list(string) | optional
  restorable_by_user_ids = []     # list(string) | optional
  snapshot_ids           = []     # list(string) | optional
  tags                   = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # data_encryption_key_id = ""     # string | computed
  # description            = ""     # string | computed
  # encrypted              = false  # bool | computed
  # kms_key_id             = ""     # string | computed
  # outpost_arn            = ""     # string | computed
  # owner_alias            = ""     # string | computed
  # owner_id               = ""     # string | computed
  # snapshot_id            = ""     # string | computed
  # start_time             = ""     # string | computed
  # state                  = ""     # string | computed
  # storage_tier           = ""     # string | computed
  # volume_id              = ""     # string | computed
  # volume_size            = 0      # number | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

