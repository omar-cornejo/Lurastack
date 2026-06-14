# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_peering_connection_options                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_peering_connection_options" "this" {

  vpc_peering_connection_id = ""     # string | required
  id                        = ""     # string | optional+computed

  accepter { # list [0..1]
    allow_remote_vpc_dns_resolution = false  # bool | optional

  }

  requester { # list [0..1]
    allow_remote_vpc_dns_resolution = false  # bool | optional

  }

}

