# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firestore_backup_schedule                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_firestore_backup_schedule" "this" {

  retention = ""     # string | required | At what relative time in the future, compared to its creatio…
  database  = ""     # string | optional | The Firestore database id. Defaults to '"(default)"'.
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed

  # name      = ""     # string | computed | The unique backup schedule identifier across all locations a…

  daily_recurrence {} # list [0..1]

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  weekly_recurrence { # list [0..1]
    day = ""     # string | optional | The day of week to run. Possible values: ["DAY_OF_WEEK_UNSPE…

  }

}

