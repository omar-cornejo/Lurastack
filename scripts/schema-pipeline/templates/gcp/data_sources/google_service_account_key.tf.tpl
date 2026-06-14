# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_account_key                              │
# └──────────────────────────────────────────────────────────────┘
data "google_service_account_key" "this" {

  name            = ""     # string | required
  id              = ""     # string | optional+computed
  project         = ""     # string | optional
  public_key_type = ""     # string | optional

  # key_algorithm   = ""     # string | computed
  # public_key      = ""     # string | computed

}

