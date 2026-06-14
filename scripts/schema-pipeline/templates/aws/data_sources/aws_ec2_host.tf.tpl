# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_host                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_host" "this" {

  host_id           = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # asset_id          = ""     # string | computed
  # auto_placement    = ""     # string | computed
  # availability_zone = ""     # string | computed
  # cores             = 0      # number | computed
  # host_recovery     = ""     # string | computed
  # instance_family   = ""     # string | computed
  # instance_type     = ""     # string | computed
  # outpost_arn       = ""     # string | computed
  # owner_id          = ""     # string | computed
  # sockets           = 0      # number | computed
  # total_vcpus       = 0      # number | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

