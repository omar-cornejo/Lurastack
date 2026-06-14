# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_networks                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_networks" "this" {

  id        = ""     # string | optional+computed
  project   = ""     # string | optional

  # networks  = []     # list(string) | computed
  # self_link = ""     # string | computed

}

