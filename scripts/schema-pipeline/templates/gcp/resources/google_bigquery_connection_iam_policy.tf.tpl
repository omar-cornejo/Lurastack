# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_connection_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_connection_iam_policy" "this" {

  connection_id = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

