# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_peering_routes_config        │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_peering_routes_config" "this" {

  export_custom_routes = false  # bool | required | Whether to export the custom routes to the peer network.
  import_custom_routes = false  # bool | required | Whether to import the custom routes to the peer network.
  network              = ""     # string | required | The name of the primary network for the peering.
  peering              = ""     # string | required | Name of the peering.
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

