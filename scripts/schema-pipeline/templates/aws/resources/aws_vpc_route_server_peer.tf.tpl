# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_route_server_peer                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_route_server_peer" "this" {

  peer_address             = ""     # string | required
  route_server_endpoint_id = ""     # string | required
  tags                     = {}     # map(string) | optional

  # arn                      = ""     # string | computed
  # endpoint_eni_address     = ""     # string | computed
  # endpoint_eni_id          = ""     # string | computed
  # route_server_id          = ""     # string | computed
  # route_server_peer_id     = ""     # string | computed
  # subnet_id                = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed
  # vpc_id                   = ""     # string | computed

  bgp_options { # list
    peer_asn                = 0      # number | required
    peer_liveness_detection = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

