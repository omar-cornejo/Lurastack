# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_default_service_account                  │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_default_service_account" "this" {

  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # display_name = ""     # string | computed
  # email        = ""     # string | computed
  # member       = ""     # string | computed
  # name         = ""     # string | computed
  # unique_id    = ""     # string | computed

}

