# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_account_jwt                              │
# └──────────────────────────────────────────────────────────────┘
data "google_service_account_jwt" "this" {

  payload                = ""     # string | required | A JSON-encoded JWT claims set that will be included in the s…
  target_service_account = ""     # string | required
  delegates              = []     # set(string) | optional
  expires_in             = 0      # number | optional | Number of seconds until the JWT expires. If set and non-zero…
  id                     = ""     # string | optional+computed

  # jwt                    = ""     # string | computed+sensitive

}

