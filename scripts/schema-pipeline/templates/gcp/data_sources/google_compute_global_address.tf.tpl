# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_global_address                           │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_global_address" "this" {

  name          = ""     # string | required
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # address       = ""     # string | computed
  # address_type  = ""     # string | computed
  # network       = ""     # string | computed
  # network_tier  = ""     # string | computed
  # prefix_length = 0      # number | computed
  # purpose       = ""     # string | computed
  # self_link     = ""     # string | computed
  # status        = ""     # string | computed
  # subnetwork    = ""     # string | computed
  # users         = ""     # string | computed

}

