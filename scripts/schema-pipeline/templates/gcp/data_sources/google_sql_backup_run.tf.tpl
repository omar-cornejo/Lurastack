# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_backup_run                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_backup_run" "this" {

  instance    = ""     # string | required | Name of the database instance.
  backup_id   = 0      # number | optional+computed | The identifier for this backup run. Unique only for a specif…
  id          = ""     # string | optional+computed
  most_recent = false  # bool | optional | Toggles use of the most recent backup run if multiple backup…
  project     = ""     # string | optional+computed | Project ID of the project that contains the instance.

  # location    = ""     # string | computed | Location of the backups.
  # start_time  = ""     # string | computed | The time the backup operation actually started in UTC timezo…
  # status      = ""     # string | computed | The status of this run.

}

