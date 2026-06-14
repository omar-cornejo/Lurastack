# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_coip_pools                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_coip_pools" "this" {

  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional

  # pool_ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

