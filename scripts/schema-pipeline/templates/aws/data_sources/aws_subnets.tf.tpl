# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_subnets                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_subnets" "this" {

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

