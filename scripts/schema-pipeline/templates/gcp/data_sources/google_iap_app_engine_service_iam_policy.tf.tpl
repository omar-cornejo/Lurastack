# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iap_app_engine_service_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
data "google_iap_app_engine_service_iam_policy" "this" {

  app_id      = ""     # string | required
  service     = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

