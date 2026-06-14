# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_database_instance_latest_recovery_time       │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_database_instance_latest_recovery_time" "this" {

  instance             = ""     # string | required
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional+computed

  # latest_recovery_time = ""     # string | computed | Timestamp, identifies the latest recovery time of the source…

}

