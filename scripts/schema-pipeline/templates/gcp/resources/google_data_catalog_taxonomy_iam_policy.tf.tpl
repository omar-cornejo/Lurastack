# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_taxonomy_iam_policy             │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_taxonomy_iam_policy" "this" {

  policy_data = ""     # string | required
  taxonomy    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

