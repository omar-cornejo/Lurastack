# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_managed_folder_iam_policy            │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_managed_folder_iam_policy" "this" {

  bucket         = ""     # string | required
  managed_folder = ""     # string | required
  policy_data    = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed

}

