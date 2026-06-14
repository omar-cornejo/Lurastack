# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_local_gateway_virtual_interface_groups          │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_local_gateway_virtual_interface_groups" "this" {

  id                                  = ""     # string | optional+computed
  tags                                = {}     # map(string) | optional

  # ids                                 = []     # list(string) | computed
  # local_gateway_virtual_interface_ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

