# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_endpoint_group               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_endpoint_group" "this" {

  name                  = ""     # string | required | Name of the resource; provided by the client when the resour…
  network               = ""     # string | required | The network to which all network endpoints in the NEG belong…
  default_port          = 0      # number | optional | The default port used if the port number is not specified in…
  description           = ""     # string | optional | An optional description of this resource. Provide this prope…
  id                    = ""     # string | optional+computed
  network_endpoint_type = ""     # string | optional | Type of network endpoints in this network endpoint group. NO…
  project               = ""     # string | optional+computed
  subnetwork            = ""     # string | optional | Optional subnetwork to which all network endpoints in the NE…
  zone                  = ""     # string | optional+computed | Zone where the network endpoint group is located.

  # self_link             = ""     # string | computed
  # size                  = 0      # number | computed | Number of network endpoints in the network endpoint group.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

