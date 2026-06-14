# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_dx_gateway_attachment           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_dx_gateway_attachment" "this" {

  dx_gateway_id      = ""     # string | optional
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed
  transit_gateway_id = ""     # string | optional

  # arn                = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

