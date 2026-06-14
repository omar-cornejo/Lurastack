# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_analytics_hub_listing_iam_policy    │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_analytics_hub_listing_iam_policy" "this" {

  data_exchange_id = ""     # string | required
  listing_id       = ""     # string | required
  policy_data      = ""     # string | required
  id               = ""     # string | optional+computed
  location         = ""     # string | optional+computed
  project          = ""     # string | optional+computed

  # etag             = ""     # string | computed

}

