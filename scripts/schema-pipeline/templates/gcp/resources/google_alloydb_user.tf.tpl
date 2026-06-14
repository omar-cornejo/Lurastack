# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_alloydb_user                                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_alloydb_user" "this" {

  cluster        = ""     # string | required | Identifies the alloydb cluster. Must be in the format 'proje…
  user_id        = ""     # string | required | The database role name of the user.
  user_type      = ""     # string | required | The type of this user. Possible values: ["ALLOYDB_BUILT_IN",…
  database_roles = []     # list(string) | optional | List of database roles this database user has.
  id             = ""     # string | optional+computed
  password       = ""     # string | optional | Password for this database user.

  # name           = ""     # string | computed | Name of the resource in the form of projects/{project}/locat…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

