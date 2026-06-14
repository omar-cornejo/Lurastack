# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_sql_database                                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_sql_database" "this" {

  instance        = ""     # string | required | The name of the Cloud SQL instance. This does not include th…
  name            = ""     # string | required | The name of the database in the Cloud SQL instance. This doe…
  charset         = ""     # string | optional+computed | The charset value. See MySQL's [Supported Character Sets and…
  collation       = ""     # string | optional+computed | The collation value. See MySQL's [Supported Character Sets a…
  deletion_policy = ""     # string | optional | The deletion policy for the database. Setting ABANDON allows…
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed

  # self_link       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

