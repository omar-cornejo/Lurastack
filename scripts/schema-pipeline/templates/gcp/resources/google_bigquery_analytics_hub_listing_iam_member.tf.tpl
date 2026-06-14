# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_analytics_hub_listing_iam_member    │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_analytics_hub_listing_iam_member" "this" {

  data_exchange_id = ""     # string | required
  listing_id       = ""     # string | required
  member           = ""     # string | required
  role             = ""     # string | required
  id               = ""     # string | optional+computed
  location         = ""     # string | optional+computed
  project          = ""     # string | optional+computed

  # etag             = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

