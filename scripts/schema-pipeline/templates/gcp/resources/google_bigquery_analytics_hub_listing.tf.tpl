# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_analytics_hub_listing               │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_analytics_hub_listing" "this" {

  data_exchange_id = ""     # string | required | The ID of the data exchange. Must contain only Unicode lette…
  display_name     = ""     # string | required | Human-readable display name of the listing. The display name…
  listing_id       = ""     # string | required | The ID of the listing. Must contain only Unicode letters, nu…
  location         = ""     # string | required | The name of the location this data exchange listing.
  categories       = []     # list(string) | optional | Categories of the listing. Up to two categories are allowed.
  description      = ""     # string | optional | Short description of the listing. The description must not c…
  documentation    = ""     # string | optional | Documentation describing the listing.
  icon             = ""     # string | optional | Base64 encoded image representing the listing.
  id               = ""     # string | optional+computed
  primary_contact  = ""     # string | optional | Email or URL of the primary point of contact of the listing.
  project          = ""     # string | optional+computed
  request_access   = ""     # string | optional | Email or URL of the request access of the listing. Subscribe…

  # name             = ""     # string | computed | The resource name of the listing. e.g. "projects/myproject/l…

  bigquery_dataset { # list [1..1]
    dataset = ""     # string | required | Resource name of the dataset source for this listing. e.g. p…

  }

  data_provider { # list [0..1]
    name            = ""     # string | required | Name of the data provider.
    primary_contact = ""     # string | optional | Email or URL of the data provider.

  }

  publisher { # list [0..1]
    name            = ""     # string | required | Name of the listing publisher.
    primary_contact = ""     # string | optional | Email or URL of the listing publisher.

  }

  restricted_export_config { # list [0..1]
    enabled               = false  # bool | optional | If true, enable restricted export.
    restrict_query_result = false  # bool | optional | If true, restrict export of query result derived from restri…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

