# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_nat_gateway                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_nat_gateway" "this" {

  subnet_id                          = ""     # string | required
  allocation_id                      = ""     # string | optional
  connectivity_type                  = ""     # string | optional
  id                                 = ""     # string | optional+computed
  private_ip                         = ""     # string | optional+computed
  secondary_allocation_ids           = []     # set(string) | optional
  secondary_private_ip_address_count = 0      # number | optional+computed
  secondary_private_ip_addresses     = []     # set(string) | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed

  # association_id                     = ""     # string | computed
  # network_interface_id               = ""     # string | computed
  # public_ip                          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

