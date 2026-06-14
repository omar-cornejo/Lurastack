# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_route_table                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_route_table" "this" {

  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # default_association_route_table = false  # bool | computed
  # default_propagation_route_table = false  # bool | computed
  # transit_gateway_id              = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

