# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudbuildv2_connection_iam_binding          │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudbuildv2_connection_iam_binding" "this" {

  members  = []     # set(string) | required
  name     = ""     # string | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  location = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

