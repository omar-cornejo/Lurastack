# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_backup                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_backup" "this" {

  file_system_id = ""     # string | optional
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed
  volume_id      = ""     # string | optional

  # arn            = ""     # string | computed
  # kms_key_id     = ""     # string | computed
  # owner_id       = ""     # string | computed
  # type           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

