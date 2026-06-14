# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_default_subnet                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_default_subnet" "this" {

  availability_zone                              = ""     # string | required
  assign_ipv6_address_on_creation                = false  # bool | optional
  customer_owned_ipv4_pool                       = ""     # string | optional
  enable_dns64                                   = false  # bool | optional
  enable_resource_name_dns_a_record_on_launch    = false  # bool | optional
  enable_resource_name_dns_aaaa_record_on_launch = false  # bool | optional
  force_destroy                                  = false  # bool | optional
  id                                             = ""     # string | optional+computed
  ipv6_cidr_block                                = ""     # string | optional+computed
  ipv6_native                                    = false  # bool | optional
  map_customer_owned_ip_on_launch                = false  # bool | optional
  map_public_ip_on_launch                        = false  # bool | optional
  private_dns_hostname_type_on_launch            = ""     # string | optional+computed
  tags                                           = {}     # map(string) | optional
  tags_all                                       = {}     # map(string) | optional+computed

  # arn                                            = ""     # string | computed
  # availability_zone_id                           = ""     # string | computed
  # cidr_block                                     = ""     # string | computed
  # enable_lni_at_device_index                     = 0      # number | computed
  # existing_default_subnet                        = false  # bool | computed
  # ipv6_cidr_block_association_id                 = ""     # string | computed
  # outpost_arn                                    = ""     # string | computed
  # owner_id                                       = ""     # string | computed
  # vpc_id                                         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

