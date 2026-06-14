# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_peering                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_peering" "this" {

  name                                = ""     # string | required | Name of the peering.
  network                             = ""     # string | required | The primary network of the peering.
  peer_network                        = ""     # string | required | The peer network in the peering. The peer network may belong…
  export_custom_routes                = false  # bool | optional | Whether to export the custom routes to the peer network. Def…
  export_subnet_routes_with_public_ip = false  # bool | optional
  id                                  = ""     # string | optional+computed
  import_custom_routes                = false  # bool | optional | Whether to export the custom routes from the peer network. D…
  import_subnet_routes_with_public_ip = false  # bool | optional
  stack_type                          = ""     # string | optional | Which IP version(s) of traffic and routes are allowed to be …

  # state                               = ""     # string | computed | State for the peering, either ACTIVE or INACTIVE. The peerin…
  # state_details                       = ""     # string | computed | Details about the current state of the peering.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

