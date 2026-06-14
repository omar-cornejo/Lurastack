# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_local_gateway_virtual_interface_group           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_local_gateway_virtual_interface_group" "this" {

  id                                  = ""     # string | optional+computed
  local_gateway_id                    = ""     # string | optional+computed
  tags                                = {}     # map(string) | optional+computed

  # local_gateway_virtual_interface_ids = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

