# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_dhcp_options                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_dhcp_options" "this" {

  dhcp_options_id                   = ""     # string | optional+computed
  id                                = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # domain_name                       = ""     # string | computed
  # domain_name_servers               = []     # list(string) | computed
  # ipv6_address_preferred_lease_time = ""     # string | computed
  # netbios_name_servers              = []     # list(string) | computed
  # netbios_node_type                 = ""     # string | computed
  # ntp_servers                       = []     # list(string) | computed
  # owner_id                          = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

