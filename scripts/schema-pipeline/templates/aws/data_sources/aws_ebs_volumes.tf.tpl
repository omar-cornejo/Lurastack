# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ebs_volumes                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ebs_volumes" "this" {

  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional

  # ids  = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

