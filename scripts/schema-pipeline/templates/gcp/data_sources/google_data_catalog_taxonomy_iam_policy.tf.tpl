# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_data_catalog_taxonomy_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
data "google_data_catalog_taxonomy_iam_policy" "this" {

  taxonomy    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

