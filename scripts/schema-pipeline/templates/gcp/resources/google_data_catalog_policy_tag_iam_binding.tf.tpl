# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_policy_tag_iam_binding          │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_policy_tag_iam_binding" "this" {

  members    = []     # set(string) | required
  policy_tag = ""     # string | required
  role       = ""     # string | required
  id         = ""     # string | optional+computed

  # etag       = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

