# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_network_endpoint              │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_network_endpoint" "this" {

  port                          = 0      # number | required | Port number of network endpoint.
  region_network_endpoint_group = ""     # string | required | The network endpoint group this endpoint is part of.
  fqdn                          = ""     # string | optional | Fully qualified domain name of network endpoint.  This can o…
  id                            = ""     # string | optional+computed
  ip_address                    = ""     # string | optional | IPv4 address external endpoint.  This can only be specified …
  project                       = ""     # string | optional+computed
  region                        = ""     # string | optional+computed | Region where the containing network endpoint group is locate…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

