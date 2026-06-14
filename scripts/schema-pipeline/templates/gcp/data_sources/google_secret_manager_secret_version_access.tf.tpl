# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_secret_manager_secret_version_access             │
# └──────────────────────────────────────────────────────────────┘
data "google_secret_manager_secret_version_access" "this" {

  secret      = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  version     = ""     # string | optional+computed

  # name        = ""     # string | computed
  # secret_data = ""     # string | computed+sensitive

}

