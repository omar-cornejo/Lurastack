# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_route_tables                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_route_tables" "this" {

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

