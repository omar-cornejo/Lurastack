# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_managed_folder_iam_member            │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_managed_folder_iam_member" "this" {

  bucket         = ""     # string | required
  managed_folder = ""     # string | required
  member         = ""     # string | required
  role           = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

