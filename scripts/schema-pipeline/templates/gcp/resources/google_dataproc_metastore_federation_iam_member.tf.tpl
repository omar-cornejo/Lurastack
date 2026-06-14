# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_metastore_federation_iam_member     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_metastore_federation_iam_member" "this" {

  federation_id = ""     # string | required
  member        = ""     # string | required
  role          = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

