# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_access_approval_folder_service_account           │
# └──────────────────────────────────────────────────────────────┘
data "google_access_approval_folder_service_account" "this" {

  folder_id     = ""     # string | required
  id            = ""     # string | optional+computed

  # account_email = ""     # string | computed
  # name          = ""     # string | computed

}

