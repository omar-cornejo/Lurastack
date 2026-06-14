# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_local_gateways                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_local_gateways" "this" {

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

