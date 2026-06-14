# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_table_iam_binding                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_table_iam_binding" "this" {

  dataset_id = ""     # string | required
  members    = []     # set(string) | required
  role       = ""     # string | required
  table_id   = ""     # string | required
  id         = ""     # string | optional+computed
  project    = ""     # string | optional+computed

  # etag       = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

