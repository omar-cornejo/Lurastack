# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_analytics_hub_data_exchange         │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_analytics_hub_data_exchange" "this" {

  data_exchange_id = ""     # string | required | The ID of the data exchange. Must contain only Unicode lette…
  display_name     = ""     # string | required | Human-readable display name of the data exchange. The displa…
  location         = ""     # string | required | The name of the location this data exchange.
  description      = ""     # string | optional | Description of the data exchange.
  documentation    = ""     # string | optional | Documentation describing the data exchange.
  icon             = ""     # string | optional | Base64 encoded image representing the data exchange.
  id               = ""     # string | optional+computed
  primary_contact  = ""     # string | optional | Email or URL of the primary point of contact of the data exc…
  project          = ""     # string | optional+computed

  # listing_count    = 0      # number | computed | Number of listings contained in the data exchange.
  # name             = ""     # string | computed | The resource name of the data exchange, for example: "projec…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

