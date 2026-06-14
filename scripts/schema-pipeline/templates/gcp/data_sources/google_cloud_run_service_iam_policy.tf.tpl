# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_run_service_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_run_service_iam_policy" "this" {

  service     = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

