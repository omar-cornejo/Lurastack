# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_peering_connection_accepter                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_peering_connection_accepter" "this" {

  vpc_peering_connection_id = ""     # string | required
  auto_accept               = false  # bool | optional
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # accept_status             = ""     # string | computed
  # peer_owner_id             = ""     # string | computed
  # peer_region               = ""     # string | computed
  # peer_vpc_id               = ""     # string | computed
  # vpc_id                    = ""     # string | computed

  accepter { # list [0..1]
    allow_remote_vpc_dns_resolution = false  # bool | optional

  }

  requester { # list [0..1]
    allow_remote_vpc_dns_resolution = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

