# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudfunctions_function_iam_member           │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudfunctions_function_iam_member" "this" {

  cloud_function = ""     # string | required
  member         = ""     # string | required
  role           = ""     # string | required
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  region         = ""     # string | optional+computed

  # etag           = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

