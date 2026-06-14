# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_host                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_host" "this" {

  availability_zone = ""     # string | required
  asset_id          = ""     # string | optional+computed
  auto_placement    = ""     # string | optional
  host_recovery     = ""     # string | optional
  id                = ""     # string | optional+computed
  instance_family   = ""     # string | optional
  instance_type     = ""     # string | optional
  outpost_arn       = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # owner_id          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

