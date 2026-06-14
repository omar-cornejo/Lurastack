# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_bigquery_connection_iam_policy                   │
# └──────────────────────────────────────────────────────────────┘
data "google_bigquery_connection_iam_policy" "this" {

  connection_id = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}

