# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ebs_volume                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_ebs_volume" "this" {

  id                   = ""     # string | optional+computed
  most_recent          = false  # bool | optional
  tags                 = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # availability_zone    = ""     # string | computed
  # create_time          = ""     # string | computed
  # encrypted            = false  # bool | computed
  # iops                 = 0      # number | computed
  # kms_key_id           = ""     # string | computed
  # multi_attach_enabled = false  # bool | computed
  # outpost_arn          = ""     # string | computed
  # size                 = 0      # number | computed
  # snapshot_id          = ""     # string | computed
  # throughput           = 0      # number | computed
  # volume_id            = ""     # string | computed
  # volume_type          = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

