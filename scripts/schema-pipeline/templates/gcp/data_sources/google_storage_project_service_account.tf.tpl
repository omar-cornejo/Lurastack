# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_project_service_account                  │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_project_service_account" "this" {

  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed
  user_project  = ""     # string | optional

  # email_address = ""     # string | computed
  # member        = ""     # string | computed

}

