# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_peering_connection                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_peering_connection" "this" {

  cidr_block               = ""     # string | optional+computed
  id                       = ""     # string | optional+computed
  owner_id                 = ""     # string | optional+computed
  peer_cidr_block          = ""     # string | optional+computed
  peer_owner_id            = ""     # string | optional+computed
  peer_region              = ""     # string | optional+computed
  peer_vpc_id              = ""     # string | optional+computed
  region                   = ""     # string | optional+computed
  status                   = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed
  vpc_id                   = ""     # string | optional+computed

  # accepter                 = {}     # map(bool) | computed
  # cidr_block_set = [  # list(object)
  #   {
  #     cidr_block = ""
  #   }
  # ]
  # ipv6_cidr_block_set = [  # list(object)
  #   {
  #     ipv6_cidr_block = ""
  #   }
  # ]
  # peer_cidr_block_set = [  # list(object)
  #   {
  #     cidr_block = ""
  #   }
  # ]
  # peer_ipv6_cidr_block_set = [  # list(object)
  #   {
  #     ipv6_cidr_block = ""
  #   }
  # ]
  # requester                = {}     # map(bool) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

