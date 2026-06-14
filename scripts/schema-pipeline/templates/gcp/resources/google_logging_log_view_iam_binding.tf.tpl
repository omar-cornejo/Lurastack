# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_log_view_iam_binding                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_log_view_iam_binding" "this" {

  bucket   = ""     # string | required
  members  = []     # set(string) | required
  name     = ""     # string | required
  parent   = ""     # string | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  location = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

