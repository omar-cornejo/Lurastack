# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_bucket_iam_policy                        │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_bucket_iam_policy" "this" {

  bucket      = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

