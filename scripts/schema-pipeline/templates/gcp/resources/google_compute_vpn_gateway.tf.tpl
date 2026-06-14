# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_vpn_gateway                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_vpn_gateway" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  network            = ""     # string | required | The network this VPN gateway is accepting traffic for.
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | The region this gateway should sit in.

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # gateway_id         = 0      # number | computed | The unique identifier for the resource.
  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

