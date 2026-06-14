# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_bigquery_dataset_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_bigquery_dataset_iam_policy" "this" {

  dataset_id  = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

