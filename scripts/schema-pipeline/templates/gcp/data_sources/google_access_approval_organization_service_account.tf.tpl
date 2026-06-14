# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_access_approval_organization_service_account     │
# └──────────────────────────────────────────────────────────────┘
data "google_access_approval_organization_service_account" "this" {

  organization_id = ""     # string | required
  id              = ""     # string | optional+computed

  # account_email   = ""     # string | computed
  # name            = ""     # string | computed

}

