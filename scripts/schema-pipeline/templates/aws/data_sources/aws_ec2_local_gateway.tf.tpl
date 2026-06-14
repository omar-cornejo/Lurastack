# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_local_gateway                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_local_gateway" "this" {

  id          = ""     # string | optional+computed
  state       = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # outpost_arn = ""     # string | computed
  # owner_id    = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

