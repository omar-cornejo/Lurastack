# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_endpoints_service_consumers_iam_member       │
# └──────────────────────────────────────────────────────────────┘
resource "google_endpoints_service_consumers_iam_member" "this" {

  consumer_project = ""     # string | required
  member           = ""     # string | required
  role             = ""     # string | required
  service_name     = ""     # string | required
  id               = ""     # string | optional+computed

  # etag             = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

