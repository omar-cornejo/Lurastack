# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_table_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_table_iam_policy" "this" {

  dataset_id  = ""     # string | required
  policy_data = ""     # string | required
  table_id    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

