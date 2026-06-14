# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_nat_gateway                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_nat_gateway" "this" {

  id                                 = ""     # string | optional+computed
  state                              = ""     # string | optional+computed
  subnet_id                          = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional+computed
  vpc_id                             = ""     # string | optional+computed

  # allocation_id                      = ""     # string | computed
  # association_id                     = ""     # string | computed
  # connectivity_type                  = ""     # string | computed
  # network_interface_id               = ""     # string | computed
  # private_ip                         = ""     # string | computed
  # public_ip                          = ""     # string | computed
  # secondary_allocation_ids           = []     # list(string) | computed
  # secondary_private_ip_address_count = 0      # number | computed
  # secondary_private_ip_addresses     = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

