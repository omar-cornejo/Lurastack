# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_secret_manager_secret_version                    │
# └──────────────────────────────────────────────────────────────┘
data "google_secret_manager_secret_version" "this" {

  secret       = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  version      = ""     # string | optional+computed

  # create_time  = ""     # string | computed
  # destroy_time = ""     # string | computed
  # enabled      = false  # bool | computed
  # name         = ""     # string | computed
  # secret_data  = ""     # string | computed+sensitive

}

