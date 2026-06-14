# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_dhcp_options                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_dhcp_options" "this" {

  domain_name                       = ""     # string | optional
  domain_name_servers               = []     # list(string) | optional
  id                                = ""     # string | optional+computed
  ipv6_address_preferred_lease_time = ""     # string | optional
  netbios_name_servers              = []     # list(string) | optional
  netbios_node_type                 = ""     # string | optional
  ntp_servers                       = []     # list(string) | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # owner_id                          = ""     # string | computed

}

