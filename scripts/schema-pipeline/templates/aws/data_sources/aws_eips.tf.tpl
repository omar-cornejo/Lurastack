# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eips                                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_eips" "this" {

  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional

  # allocation_ids = []     # list(string) | computed
  # public_ips     = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

