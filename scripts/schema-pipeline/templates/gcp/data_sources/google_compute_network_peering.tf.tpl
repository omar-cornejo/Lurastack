# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_network_peering                          │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_network_peering" "this" {

  name                                = ""     # string | required | Name of the peering.
  network                             = ""     # string | required | The primary network of the peering.
  id                                  = ""     # string | optional+computed

  # export_custom_routes                = false  # bool | computed | Whether to export the custom routes to the peer network. Def…
  # export_subnet_routes_with_public_ip = false  # bool | computed
  # import_custom_routes                = false  # bool | computed | Whether to export the custom routes from the peer network. D…
  # import_subnet_routes_with_public_ip = false  # bool | computed
  # peer_network                        = ""     # string | computed | The peer network in the peering. The peer network may belong…
  # stack_type                          = ""     # string | computed | Which IP version(s) of traffic and routes are allowed to be …
  # state                               = ""     # string | computed | State for the peering, either ACTIVE or INACTIVE. The peerin…
  # state_details                       = ""     # string | computed | Details about the current state of the peering.

  timeouts { # single
    read = ""     # string | optional

  }

}

