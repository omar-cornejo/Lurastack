# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_app_engine_service_iam_binding           │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_app_engine_service_iam_binding" "this" {

  app_id  = ""     # string | required
  members = []     # set(string) | required
  role    = ""     # string | required
  service = ""     # string | required
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

