# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_metastore_federation_iam_binding    │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_metastore_federation_iam_binding" "this" {

  federation_id = ""     # string | required
  members       = []     # set(string) | required
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

