# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_data_catalog_entry_group_iam_policy              │
# └──────────────────────────────────────────────────────────────┘
data "google_data_catalog_entry_group_iam_policy" "this" {

  entry_group = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

