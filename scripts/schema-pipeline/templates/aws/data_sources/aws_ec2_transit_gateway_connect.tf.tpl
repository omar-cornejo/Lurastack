# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_connect                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_connect" "this" {

  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional+computed
  transit_gateway_connect_id = ""     # string | optional+computed

  # protocol                   = ""     # string | computed
  # transit_gateway_id         = ""     # string | computed
  # transport_attachment_id    = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

