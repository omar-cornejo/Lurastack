# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_security_groups                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_security_groups" "this" {

  id      = ""     # string | optional+computed
  tags    = {}     # map(string) | optional+computed

  # arns    = []     # list(string) | computed
  # ids     = []     # list(string) | computed
  # vpc_ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

