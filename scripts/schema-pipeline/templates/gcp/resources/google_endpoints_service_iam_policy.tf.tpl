# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_endpoints_service_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_endpoints_service_iam_policy" "this" {

  policy_data  = ""     # string | required
  service_name = ""     # string | required
  id           = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

