# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_iam_binding                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_iam_binding" "this" {

  members = []     # set(string) | required
  project = ""     # string | required
  role    = ""     # string | required
  id      = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

