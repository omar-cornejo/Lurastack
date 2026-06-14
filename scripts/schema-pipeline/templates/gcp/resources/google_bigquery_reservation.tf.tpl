# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_reservation                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_reservation" "this" {

  name                   = ""     # string | required | The name of the reservation. This field must only contain al…
  slot_capacity          = 0      # number | required | Minimum slots available to this reservation. A slot is a uni…
  concurrency            = 0      # number | optional | Maximum number of queries that are allowed to run concurrent…
  edition                = ""     # string | optional+computed | The edition type. Valid values are STANDARD, ENTERPRISE, ENT…
  id                     = ""     # string | optional+computed
  ignore_idle_slots      = false  # bool | optional | If false, any query using this reservation will use idle slo…
  location               = ""     # string | optional | The geographic location where the transfer config should res…
  multi_region_auxiliary = false  # bool | optional+DEPRECATED | Applicable only for reservations located within one of the B…
  project                = ""     # string | optional+computed

  autoscale { # list [0..1]
    max_slots     = 0      # number | optional | Number of slots to be scaled when needed.

    # current_slots = 0      # number | computed | The slot capacity added to this reservation when autoscale h…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

