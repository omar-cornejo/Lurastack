# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_subnet                                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_subnet" "this" {

  availability_zone                              = ""     # string | optional+computed
  availability_zone_id                           = ""     # string | optional+computed
  cidr_block                                     = ""     # string | optional+computed
  default_for_az                                 = false  # bool | optional+computed
  id                                             = ""     # string | optional+computed
  ipv6_cidr_block                                = ""     # string | optional+computed
  state                                          = ""     # string | optional+computed
  tags                                           = {}     # map(string) | optional+computed
  vpc_id                                         = ""     # string | optional+computed

  # arn                                            = ""     # string | computed
  # assign_ipv6_address_on_creation                = false  # bool | computed
  # available_ip_address_count                     = 0      # number | computed
  # customer_owned_ipv4_pool                       = ""     # string | computed
  # enable_dns64                                   = false  # bool | computed
  # enable_lni_at_device_index                     = 0      # number | computed
  # enable_resource_name_dns_a_record_on_launch    = false  # bool | computed
  # enable_resource_name_dns_aaaa_record_on_launch = false  # bool | computed
  # ipv6_cidr_block_association_id                 = ""     # string | computed
  # ipv6_native                                    = false  # bool | computed
  # map_customer_owned_ip_on_launch                = false  # bool | computed
  # map_public_ip_on_launch                        = false  # bool | computed
  # outpost_arn                                    = ""     # string | computed
  # owner_id                                       = ""     # string | computed
  # private_dns_hostname_type_on_launch            = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

