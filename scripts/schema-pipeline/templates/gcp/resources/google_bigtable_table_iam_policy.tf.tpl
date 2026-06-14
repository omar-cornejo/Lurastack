# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigtable_table_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigtable_table_iam_policy" "this" {

  instance    = ""     # string | required
  policy_data = ""     # string | required
  table       = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

