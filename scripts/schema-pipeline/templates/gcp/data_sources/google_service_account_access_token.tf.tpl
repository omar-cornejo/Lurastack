# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_account_access_token                     │
# └──────────────────────────────────────────────────────────────┘
data "google_service_account_access_token" "this" {

  scopes                 = []     # set(string) | required
  target_service_account = ""     # string | required
  delegates              = []     # set(string) | optional
  id                     = ""     # string | optional+computed
  lifetime               = ""     # string | optional

  # access_token           = ""     # string | computed+sensitive

}

