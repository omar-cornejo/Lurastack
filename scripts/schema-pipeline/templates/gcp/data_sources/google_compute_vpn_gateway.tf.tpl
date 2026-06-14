# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_vpn_gateway                              │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_vpn_gateway" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # description = ""     # string | computed
  # network     = ""     # string | computed
  # self_link   = ""     # string | computed

}

