# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_snapshot_create_volume_permission               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_snapshot_create_volume_permission" "this" {

  account_id  = ""     # string | required
  snapshot_id = ""     # string | required
  id          = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

