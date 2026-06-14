# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_database                                     │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_database" "this" {

  instance        = ""     # string | required | The name of the Cloud SQL instance. This does not include th…
  name            = ""     # string | required | The name of the database in the Cloud SQL instance. This doe…
  id              = ""     # string | optional+computed
  project         = ""     # string | optional

  # charset         = ""     # string | computed | The charset value. See MySQL's [Supported Character Sets and…
  # collation       = ""     # string | computed | The collation value. See MySQL's [Supported Character Sets a…
  # deletion_policy = ""     # string | computed | The deletion policy for the database. Setting ABANDON allows…
  # self_link       = ""     # string | computed

}

