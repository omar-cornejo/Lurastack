# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_policy_tag_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_policy_tag_iam_policy" "this" {

  policy_data = ""     # string | required
  policy_tag  = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

