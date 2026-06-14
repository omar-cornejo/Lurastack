# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_lite_reservation                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_lite_reservation" "this" {

  name                = ""     # string | required | Name of the reservation.
  throughput_capacity = 0      # number | required | The reserved throughput capacity. Every unit of throughput c…
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed
  region              = ""     # string | optional | The region of the pubsub lite reservation.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

