# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_snapshot_import                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_snapshot_import" "this" {

  description            = ""     # string | optional+computed
  encrypted              = false  # bool | optional
  id                     = ""     # string | optional+computed
  kms_key_id             = ""     # string | optional
  permanent_restore      = false  # bool | optional
  role_name              = ""     # string | optional
  storage_tier           = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  temporary_restore_days = 0      # number | optional

  # arn                    = ""     # string | computed
  # data_encryption_key_id = ""     # string | computed
  # outpost_arn            = ""     # string | computed
  # owner_alias            = ""     # string | computed
  # owner_id               = ""     # string | computed
  # volume_id              = ""     # string | computed
  # volume_size            = 0      # number | computed

  client_data { # list [0..1]
    comment      = ""     # string | optional
    upload_end   = ""     # string | optional+computed
    upload_size  = 0      # number | optional+computed
    upload_start = ""     # string | optional+computed

  }

  disk_container { # list [1..1]
    format      = ""     # string | required
    description = ""     # string | optional
    url         = ""     # string | optional

    user_bucket { # list [0..1]
      s3_bucket = ""     # string | required
      s3_key    = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

