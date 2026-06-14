# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_default_vpc                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_default_vpc" "this" {

  assign_generated_ipv6_cidr_block     = false  # bool | optional
  enable_dns_hostnames                 = false  # bool | optional
  enable_dns_support                   = false  # bool | optional
  enable_network_address_usage_metrics = false  # bool | optional+computed
  force_destroy                        = false  # bool | optional
  id                                   = ""     # string | optional+computed
  ipv6_cidr_block                      = ""     # string | optional+computed
  ipv6_cidr_block_network_border_group = ""     # string | optional+computed
  ipv6_ipam_pool_id                    = ""     # string | optional
  ipv6_netmask_length                  = 0      # number | optional
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # cidr_block                           = ""     # string | computed
  # default_network_acl_id               = ""     # string | computed
  # default_route_table_id               = ""     # string | computed
  # default_security_group_id            = ""     # string | computed
  # dhcp_options_id                      = ""     # string | computed
  # existing_default_vpc                 = false  # bool | computed
  # instance_tenancy                     = ""     # string | computed
  # ipv6_association_id                  = ""     # string | computed
  # main_route_table_id                  = ""     # string | computed
  # owner_id                             = ""     # string | computed

}

