# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_managed_folder_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_managed_folder_iam_policy" "this" {

  bucket         = ""     # string | required
  managed_folder = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed
  # policy_data    = ""     # string | computed

}

