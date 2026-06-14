# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_coip_pool                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_coip_pool" "this" {

  id                           = ""     # string | optional+computed
  local_gateway_route_table_id = ""     # string | optional+computed
  pool_id                      = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # pool_cidrs                   = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

