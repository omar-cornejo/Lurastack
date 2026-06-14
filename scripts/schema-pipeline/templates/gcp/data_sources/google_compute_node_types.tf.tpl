# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_node_types                               │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_node_types" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  zone    = ""     # string | optional+computed

  # names   = []     # list(string) | computed

}

