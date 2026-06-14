# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_log_view_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_log_view_iam_policy" "this" {

  bucket      = ""     # string | required
  name        = ""     # string | required
  parent      = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

