# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_account                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_service_account" "this" {

  account_id   = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional

  # display_name = ""     # string | computed
  # email        = ""     # string | computed
  # member       = ""     # string | computed
  # name         = ""     # string | computed
  # unique_id    = ""     # string | computed

}

