# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_endpoints_service_consumers_iam_binding      │
# └──────────────────────────────────────────────────────────────┘
resource "google_endpoints_service_consumers_iam_binding" "this" {

  consumer_project = ""     # string | required
  members          = []     # set(string) | required
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

