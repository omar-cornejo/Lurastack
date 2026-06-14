# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_peering_connections                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_peering_connections" "this" {

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

