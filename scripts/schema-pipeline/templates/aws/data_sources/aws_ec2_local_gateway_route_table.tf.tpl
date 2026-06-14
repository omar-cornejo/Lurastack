# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_local_gateway_route_table                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_local_gateway_route_table" "this" {

  id                           = ""     # string | optional+computed
  local_gateway_id             = ""     # string | optional+computed
  local_gateway_route_table_id = ""     # string | optional+computed
  outpost_arn                  = ""     # string | optional+computed
  state                        = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional+computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

