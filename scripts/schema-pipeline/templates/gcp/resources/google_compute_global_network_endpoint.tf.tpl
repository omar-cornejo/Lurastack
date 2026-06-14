# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_global_network_endpoint              │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_global_network_endpoint" "this" {

  global_network_endpoint_group = ""     # string | required | The global network endpoint group this endpoint is part of.
  port                          = 0      # number | required | Port number of the external endpoint.
  fqdn                          = ""     # string | optional | Fully qualified domain name of network endpoint. This can on…
  id                            = ""     # string | optional+computed
  ip_address                    = ""     # string | optional | IPv4 address external endpoint.
  project                       = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

