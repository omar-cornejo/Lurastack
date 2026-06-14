# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_managed_folder_iam_binding           │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_managed_folder_iam_binding" "this" {

  bucket         = ""     # string | required
  managed_folder = ""     # string | required
  members        = []     # set(string) | required
  role           = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

