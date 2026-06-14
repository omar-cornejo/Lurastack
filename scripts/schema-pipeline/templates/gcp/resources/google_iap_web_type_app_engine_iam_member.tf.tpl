# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_web_type_app_engine_iam_member           │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_web_type_app_engine_iam_member" "this" {

  app_id  = ""     # string | required
  member  = ""     # string | required
  role    = ""     # string | required
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

