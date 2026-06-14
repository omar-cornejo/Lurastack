# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipv4_cidr_block_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipv4_cidr_block_association" "this" {

  vpc_id              = ""     # string | required
  cidr_block          = ""     # string | optional+computed
  id                  = ""     # string | optional+computed
  ipv4_ipam_pool_id   = ""     # string | optional
  ipv4_netmask_length = 0      # number | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

