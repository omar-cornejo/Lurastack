# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_biglake_database                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_biglake_database" "this" {

  catalog     = ""     # string | required | The parent catalog.
  name        = ""     # string | required | The name of the database.
  type        = ""     # string | required | The database type.
  id          = ""     # string | optional+computed

  # create_time = ""     # string | computed | Output only. The creation time of the database. A timestamp …
  # delete_time = ""     # string | computed | Output only. The deletion time of the database. Only set aft…
  # expire_time = ""     # string | computed | Output only. The time when this database is considered expir…
  # update_time = ""     # string | computed | Output only. The last modification time of the database. A t…

  hive_options { # list [1..1]
    location_uri = ""     # string | optional | Cloud Storage folder URI where the database data is stored, …
    parameters   = {}     # map(string) | optional | Stores user supplied Hive database parameters. An object con…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

