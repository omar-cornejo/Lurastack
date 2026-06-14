# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_bi_reservation                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_bi_reservation" "this" {

  location    = ""     # string | required | LOCATION_DESCRIPTION
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  size        = 0      # number | optional | Size of a reservation, in bytes.

  # name        = ""     # string | computed | The resource name of the singleton BI reservation. Reservati…
  # update_time = ""     # string | computed | The last update timestamp of a reservation.  A timestamp in …

  preferred_tables { # list
    dataset_id = ""     # string | optional | The ID of the dataset in the above project.
    project_id = ""     # string | optional | The assigned project ID of the project.
    table_id   = ""     # string | optional | The ID of the table in the above dataset.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

