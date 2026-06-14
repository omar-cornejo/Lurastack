# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_endpoints_service_consumers_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
data "google_endpoints_service_consumers_iam_policy" "this" {

  consumer_project = ""     # string | required
  service_name     = ""     # string | required
  id               = ""     # string | optional+computed

  # etag             = ""     # string | computed
  # policy_data      = ""     # string | computed

}

