# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipv6_cidr_block_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipv6_cidr_block_association" "this" {

  vpc_id                           = ""     # string | required
  assign_generated_ipv6_cidr_block = false  # bool | optional+computed
  id                               = ""     # string | optional+computed
  ipv6_cidr_block                  = ""     # string | optional+computed
  ipv6_ipam_pool_id                = ""     # string | optional
  ipv6_netmask_length              = 0      # number | optional
  ipv6_pool                        = ""     # string | optional+computed

  # ip_source                        = ""     # string | computed
  # ipv6_address_attribute           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

