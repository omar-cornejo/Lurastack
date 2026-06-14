# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_bucket_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_bucket_iam_policy" "this" {

  bucket      = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

