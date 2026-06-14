# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_folder_iam_member                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_folder_iam_member" "this" {

  folder = ""     # string | required
  member = ""     # string | required
  role   = ""     # string | required
  id     = ""     # string | optional+computed

  # etag   = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

