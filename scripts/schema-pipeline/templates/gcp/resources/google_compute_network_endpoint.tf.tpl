# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_endpoint                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_endpoint" "this" {

  ip_address             = ""     # string | required | IPv4 address of network endpoint. The IP address must belong…
  network_endpoint_group = ""     # string | required | The network endpoint group this endpoint is part of.
  id                     = ""     # string | optional+computed
  instance               = ""     # string | optional | The name for a specific VM instance that the IP address belo…
  port                   = 0      # number | optional | Port number of network endpoint. **Note** 'port' is required…
  project                = ""     # string | optional+computed
  zone                   = ""     # string | optional+computed | Zone where the containing network endpoint group is located.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

