# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_openzfs_snapshot                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_openzfs_snapshot" "this" {

  name          = ""     # string | required
  volume_id     = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # creation_time = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

