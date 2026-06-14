# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_account_id_token                         │
# └──────────────────────────────────────────────────────────────┘
data "google_service_account_id_token" "this" {

  target_audience        = ""     # string | required
  delegates              = []     # set(string) | optional
  id                     = ""     # string | optional+computed
  include_email          = false  # bool | optional
  target_service_account = ""     # string | optional

  # id_token               = ""     # string | computed+sensitive

}

