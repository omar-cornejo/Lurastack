# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_data_catalog_tag_template_iam_policy             │
# └──────────────────────────────────────────────────────────────┘
data "google_data_catalog_tag_template_iam_policy" "this" {

  tag_template = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  region       = ""     # string | optional+computed

  # etag         = ""     # string | computed
  # policy_data  = ""     # string | computed

}

