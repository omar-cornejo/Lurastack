# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_endpoints_service_consumers_iam_policy       │
# └──────────────────────────────────────────────────────────────┘
resource "google_endpoints_service_consumers_iam_policy" "this" {

  consumer_project = ""     # string | required
  policy_data      = ""     # string | required
  service_name     = ""     # string | required
  id               = ""     # string | optional+computed

  # etag             = ""     # string | computed

}

