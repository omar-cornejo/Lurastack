# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_bigquery_default_service_account                 │
# └──────────────────────────────────────────────────────────────┘
data "google_bigquery_default_service_account" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  # email   = ""     # string | computed
  # member  = ""     # string | computed

}

