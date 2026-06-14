# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_app_engine_version_iam_policy            │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_app_engine_version_iam_policy" "this" {

  app_id      = ""     # string | required
  policy_data = ""     # string | required
  service     = ""     # string | required
  version_id  = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

