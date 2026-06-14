# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_zones                                    │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_zones" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional
  status  = ""     # string | optional

  # names   = []     # list(string) | computed

}

