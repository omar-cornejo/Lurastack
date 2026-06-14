# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iap_web_backend_service_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
data "google_iap_web_backend_service_iam_policy" "this" {

  web_backend_service = ""     # string | required
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed

  # etag                = ""     # string | computed
  # policy_data         = ""     # string | computed

}

