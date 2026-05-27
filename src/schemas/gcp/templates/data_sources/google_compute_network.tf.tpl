# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_network                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_network" "this" {

  name                   = ""     # string | required
  id                     = ""     # string | optional+computed
  project                = ""     # string | optional

  # description            = ""     # string | computed
  # gateway_ipv4           = ""     # string | computed
  # internal_ipv6_range    = ""     # string | computed
  # self_link              = ""     # string | computed
  # subnetworks_self_links = []     # list(string) | computed

}

