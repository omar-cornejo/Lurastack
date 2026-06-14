# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_data_catalog_policy_tag_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
data "google_data_catalog_policy_tag_iam_policy" "this" {

  policy_tag  = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

