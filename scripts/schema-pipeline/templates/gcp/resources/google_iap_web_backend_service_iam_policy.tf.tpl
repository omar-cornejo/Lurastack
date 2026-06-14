# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_web_backend_service_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_web_backend_service_iam_policy" "this" {

  policy_data         = ""     # string | required
  web_backend_service = ""     # string | required
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed

  # etag                = ""     # string | computed

}

