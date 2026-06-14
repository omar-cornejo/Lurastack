# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_access_approval_project_service_account          │
# └──────────────────────────────────────────────────────────────┘
data "google_access_approval_project_service_account" "this" {

  project_id    = ""     # string | required
  id            = ""     # string | optional+computed

  # account_email = ""     # string | computed
  # name          = ""     # string | computed

}

