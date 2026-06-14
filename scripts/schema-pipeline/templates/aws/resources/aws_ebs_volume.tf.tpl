# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_volume                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_volume" "this" {

  availability_zone    = ""     # string | required
  encrypted            = false  # bool | optional+computed
  final_snapshot       = false  # bool | optional
  id                   = ""     # string | optional+computed
  iops                 = 0      # number | optional+computed
  kms_key_id           = ""     # string | optional+computed
  multi_attach_enabled = false  # bool | optional
  outpost_arn          = ""     # string | optional
  size                 = 0      # number | optional+computed
  snapshot_id          = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed
  throughput           = 0      # number | optional+computed
  type                 = ""     # string | optional+computed

  # arn                  = ""     # string | computed
  # create_time          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

