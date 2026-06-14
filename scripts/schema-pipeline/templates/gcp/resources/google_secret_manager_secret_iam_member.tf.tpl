# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secret_manager_secret_iam_member             │
# └──────────────────────────────────────────────────────────────┘
resource "google_secret_manager_secret_iam_member" "this" {

  member    = ""     # string | required
  role      = ""     # string | required
  secret_id = ""     # string | required
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed

  # etag      = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

