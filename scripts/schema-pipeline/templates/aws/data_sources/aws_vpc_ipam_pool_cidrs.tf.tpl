# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_ipam_pool_cidrs                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_ipam_pool_cidrs" "this" {

  ipam_pool_id    = ""     # string | required
  id              = ""     # string | optional+computed

  # ipam_pool_cidrs = [  # set(object)
  #   {
  #     cidr = ""
  #     state = ""
  #   }
  # ]

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

