# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_pool_cidr                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_pool_cidr" "this" {

  ipam_pool_id      = ""     # string | required
  cidr              = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  netmask_length    = 0      # number | optional

  # ipam_pool_cidr_id = ""     # string | computed

  cidr_authorization_context { # list [0..1]
    message   = ""     # string | optional
    signature = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

