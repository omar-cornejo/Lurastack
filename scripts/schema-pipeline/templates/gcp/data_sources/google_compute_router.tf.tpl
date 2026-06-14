# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_router                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_router" "this" {

  name                          = ""     # string | required | Name of the resource. The name must be 1-63 characters long,…
  network                       = ""     # string | required | A reference to the network to which this router belongs.
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional
  region                        = ""     # string | optional | Region where the router resides.

  # bgp = [  # list(object)
  #   {
  #     advertise_mode = ""
  #     advertised_groups = []  # list(string)
  #     advertised_ip_ranges = [  # list(object)
  #       {
  #         description = ""
  #         range = ""
  #       }
  #     ]
  #     asn = 0
  #     identifier_range = ""
  #     keepalive_interval = 0
  #   }
  # ]
  # creation_timestamp            = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description                   = ""     # string | computed | An optional description of this resource.
  # encrypted_interconnect_router = false  # bool | computed | Indicates if a router is dedicated for use with encrypted VL…
  # self_link                     = ""     # string | computed

}

