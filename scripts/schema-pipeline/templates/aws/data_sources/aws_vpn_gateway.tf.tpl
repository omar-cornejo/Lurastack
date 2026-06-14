# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpn_gateway                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpn_gateway" "this" {

  amazon_side_asn   = ""     # string | optional+computed
  attached_vpc_id   = ""     # string | optional+computed
  availability_zone = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  state             = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

