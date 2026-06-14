# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_metastore_federation_iam_policy     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_metastore_federation_iam_policy" "this" {

  federation_id = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

