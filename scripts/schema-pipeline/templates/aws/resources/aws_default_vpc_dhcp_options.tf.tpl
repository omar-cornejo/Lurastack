# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_default_vpc_dhcp_options                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_default_vpc_dhcp_options" "this" {

  id                                = ""     # string | optional+computed
  owner_id                          = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # domain_name                       = ""     # string | computed
  # domain_name_servers               = ""     # string | computed
  # ipv6_address_preferred_lease_time = ""     # string | computed
  # netbios_name_servers              = ""     # string | computed
  # netbios_node_type                 = ""     # string | computed
  # ntp_servers                       = ""     # string | computed

}

