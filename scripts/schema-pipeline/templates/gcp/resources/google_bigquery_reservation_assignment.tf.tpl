# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_reservation_assignment              │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_reservation_assignment" "this" {

  assignee    = ""     # string | required | The resource which will use the reservation. E.g. projects/m…
  job_type    = ""     # string | required | Types of job, which could be specified when using the reserv…
  reservation = ""     # string | required | The reservation for the resource
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed | The location for the resource
  project     = ""     # string | optional+computed

  # name        = ""     # string | computed | Output only. The resource name of the assignment.
  # state       = ""     # string | computed | Assignment will remain in PENDING state if no active capacit…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

