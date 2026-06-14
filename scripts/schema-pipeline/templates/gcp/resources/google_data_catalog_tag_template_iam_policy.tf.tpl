# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_tag_template_iam_policy         │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_tag_template_iam_policy" "this" {

  policy_data  = ""     # string | required
  tag_template = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  region       = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

