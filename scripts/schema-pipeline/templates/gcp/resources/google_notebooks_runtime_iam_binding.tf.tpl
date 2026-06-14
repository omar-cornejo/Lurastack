# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_notebooks_runtime_iam_binding                │
# └──────────────────────────────────────────────────────────────┘
resource "google_notebooks_runtime_iam_binding" "this" {

  members      = []     # set(string) | required
  role         = ""     # string | required
  runtime_name = ""     # string | required
  id           = ""     # string | optional+computed
  location     = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

