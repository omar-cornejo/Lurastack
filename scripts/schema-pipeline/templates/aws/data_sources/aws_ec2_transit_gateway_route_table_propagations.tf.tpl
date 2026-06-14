# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_route_table_propagations        │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_route_table_propagations" "this" {

  transit_gateway_route_table_id = ""     # string | required
  id                             = ""     # string | optional+computed

  # ids                            = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

