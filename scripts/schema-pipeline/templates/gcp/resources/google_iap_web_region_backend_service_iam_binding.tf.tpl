# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_web_region_backend_service_iam_binding   │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_web_region_backend_service_iam_binding" "this" {

  members                    = []     # set(string) | required
  role                       = ""     # string | required
  web_region_backend_service = ""     # string | required
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional+computed
  region                     = ""     # string | optional+computed

  # etag                       = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

