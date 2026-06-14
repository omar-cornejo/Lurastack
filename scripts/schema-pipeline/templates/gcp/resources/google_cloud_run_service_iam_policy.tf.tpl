# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_run_service_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_run_service_iam_policy" "this" {

  policy_data = ""     # string | required
  service     = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

