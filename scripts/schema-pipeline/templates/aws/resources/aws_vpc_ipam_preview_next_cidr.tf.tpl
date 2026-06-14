# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_preview_next_cidr                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_preview_next_cidr" "this" {

  ipam_pool_id     = ""     # string | required
  disallowed_cidrs = []     # set(string) | optional
  id               = ""     # string | optional+computed
  netmask_length   = 0      # number | optional

  # cidr             = ""     # string | computed

}

