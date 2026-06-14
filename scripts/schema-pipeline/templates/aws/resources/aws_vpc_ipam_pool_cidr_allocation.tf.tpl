# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_pool_cidr_allocation                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_pool_cidr_allocation" "this" {

  ipam_pool_id            = ""     # string | required
  cidr                    = ""     # string | optional+computed
  description             = ""     # string | optional
  disallowed_cidrs        = []     # set(string) | optional
  id                      = ""     # string | optional+computed
  netmask_length          = 0      # number | optional+computed

  # ipam_pool_allocation_id = ""     # string | computed
  # resource_id             = ""     # string | computed
  # resource_owner          = ""     # string | computed
  # resource_type           = ""     # string | computed

}

