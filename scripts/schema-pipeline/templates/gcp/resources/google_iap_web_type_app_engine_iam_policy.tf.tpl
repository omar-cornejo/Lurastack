# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_web_type_app_engine_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_web_type_app_engine_iam_policy" "this" {

  app_id      = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

