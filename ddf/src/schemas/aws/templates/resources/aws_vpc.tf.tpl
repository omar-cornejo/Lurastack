# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc                                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc" "this" {

  assign_generated_ipv6_cidr_block     = false  # bool | optional
  cidr_block                           = ""     # string | optional+computed
  enable_dns_hostnames                 = false  # bool | optional+computed
  enable_dns_support                   = false  # bool | optional
  enable_network_address_usage_metrics = false  # bool | optional+computed
  id                                   = ""     # string | optional+computed
  instance_tenancy                     = ""     # string | optional
  ipv4_ipam_pool_id                    = ""     # string | optional
  ipv4_netmask_length                  = 0      # number | optional
  ipv6_cidr_block                      = ""     # string | optional+computed
  ipv6_cidr_block_network_border_group = ""     # string | optional+computed
  ipv6_ipam_pool_id                    = ""     # string | optional
  ipv6_netmask_length                  = 0      # number | optional
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # default_network_acl_id               = ""     # string | computed
  # default_route_table_id               = ""     # string | computed
  # default_security_group_id            = ""     # string | computed
  # dhcp_options_id                      = ""     # string | computed
  # ipv6_association_id                  = ""     # string | computed
  # main_route_table_id                  = ""     # string | computed
  # owner_id                             = ""     # string | computed

}

