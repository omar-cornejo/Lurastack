# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_logging_log_view_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_logging_log_view_iam_policy" "this" {

  bucket      = ""     # string | required
  name        = ""     # string | required
  parent      = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

