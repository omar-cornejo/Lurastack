# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_global_network_endpoint_group        │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_global_network_endpoint_group" "this" {

  name                  = ""     # string | required | Name of the resource; provided by the client when the resour…
  network_endpoint_type = ""     # string | required | Type of network endpoints in this network endpoint group. Po…
  default_port          = 0      # number | optional | The default port used if the port number is not specified in…
  description           = ""     # string | optional | An optional description of this resource. Provide this prope…
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed

  # self_link             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

