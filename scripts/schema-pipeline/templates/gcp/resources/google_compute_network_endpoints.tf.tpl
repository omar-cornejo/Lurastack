# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_endpoints                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_endpoints" "this" {

  network_endpoint_group = ""     # string | required | The network endpoint group these endpoints are part of.
  id                     = ""     # string | optional+computed
  project                = ""     # string | optional+computed
  zone                   = ""     # string | optional+computed | Zone where the containing network endpoint group is located.

  network_endpoints { # set
    ip_address = ""     # string | required | IPv4 address of network endpoint. The IP address must belong…
    instance   = ""     # string | optional | The name for a specific VM instance that the IP address belo…
    port       = 0      # number | optional | Port number of network endpoint. **Note** 'port' is required…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

