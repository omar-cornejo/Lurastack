# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc" "this" {

  cidr_block                           = ""     # string | optional+computed
  default                              = false  # bool | optional+computed
  dhcp_options_id                      = ""     # string | optional+computed
  id                                   = ""     # string | optional+computed
  state                                = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # cidr_block_associations = [  # list(object)
  #   {
  #     association_id = ""
  #     cidr_block = ""
  #     state = ""
  #   }
  # ]
  # enable_dns_hostnames                 = false  # bool | computed
  # enable_dns_support                   = false  # bool | computed
  # enable_network_address_usage_metrics = false  # bool | computed
  # instance_tenancy                     = ""     # string | computed
  # ipv6_association_id                  = ""     # string | computed
  # ipv6_cidr_block                      = ""     # string | computed
  # main_route_table_id                  = ""     # string | computed
  # owner_id                             = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

