# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_nat_gateways                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_nat_gateways" "this" {

  id     = ""     # string | optional+computed
  tags   = {}     # map(string) | optional+computed
  vpc_id = ""     # string | optional

  # ids    = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

