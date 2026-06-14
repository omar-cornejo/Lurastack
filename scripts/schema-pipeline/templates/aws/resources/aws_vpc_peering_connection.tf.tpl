# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_peering_connection                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_peering_connection" "this" {

  peer_vpc_id   = ""     # string | required
  vpc_id        = ""     # string | required
  auto_accept   = false  # bool | optional
  id            = ""     # string | optional+computed
  peer_owner_id = ""     # string | optional+computed
  peer_region   = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # accept_status = ""     # string | computed

  accepter { # list [0..1]
    allow_remote_vpc_dns_resolution = false  # bool | optional

  }

  requester { # list [0..1]
    allow_remote_vpc_dns_resolution = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

