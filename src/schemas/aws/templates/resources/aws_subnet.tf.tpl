# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_subnet                                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_subnet" "this" {

  vpc_id                                         = ""     # string | required
  assign_ipv6_address_on_creation                = false  # bool | optional
  availability_zone                              = ""     # string | optional+computed
  availability_zone_id                           = ""     # string | optional+computed
  cidr_block                                     = ""     # string | optional
  customer_owned_ipv4_pool                       = ""     # string | optional
  enable_dns64                                   = false  # bool | optional
  enable_lni_at_device_index                     = 0      # number | optional
  enable_resource_name_dns_a_record_on_launch    = false  # bool | optional
  enable_resource_name_dns_aaaa_record_on_launch = false  # bool | optional
  id                                             = ""     # string | optional+computed
  ipv6_cidr_block                                = ""     # string | optional
  ipv6_native                                    = false  # bool | optional
  map_customer_owned_ip_on_launch                = false  # bool | optional
  map_public_ip_on_launch                        = false  # bool | optional
  outpost_arn                                    = ""     # string | optional
  private_dns_hostname_type_on_launch            = ""     # string | optional+computed
  tags                                           = {}     # map(string) | optional
  tags_all                                       = {}     # map(string) | optional+computed

  # arn                                            = ""     # string | computed
  # ipv6_cidr_block_association_id                 = ""     # string | computed
  # owner_id                                       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

