# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_datapolicy_data_policy_iam_policy   │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_datapolicy_data_policy_iam_policy" "this" {

  data_policy_id = ""     # string | required
  policy_data    = ""     # string | required
  id             = ""     # string | optional+computed
  location       = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # etag           = ""     # string | computed

}

