# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpcs                                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpcs" "this" {

  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional+computed

  # ids  = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

