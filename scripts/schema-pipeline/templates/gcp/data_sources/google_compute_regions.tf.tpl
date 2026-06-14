# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_regions                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_regions" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  status  = ""     # string | optional

  # names   = []     # list(string) | computed

}

