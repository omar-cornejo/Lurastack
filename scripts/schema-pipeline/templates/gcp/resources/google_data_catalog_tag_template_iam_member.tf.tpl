# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_tag_template_iam_member         │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_tag_template_iam_member" "this" {

  member       = ""     # string | required
  role         = ""     # string | required
  tag_template = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  region       = ""     # string | optional+computed

  # etag         = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

