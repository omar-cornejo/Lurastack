# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_taxonomy_iam_binding            │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_taxonomy_iam_binding" "this" {

  members  = []     # set(string) | required
  role     = ""     # string | required
  taxonomy = ""     # string | required
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed
  region   = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

