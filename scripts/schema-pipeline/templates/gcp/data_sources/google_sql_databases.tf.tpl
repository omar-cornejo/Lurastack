# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_databases                                    │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_databases" "this" {

  instance  = ""     # string | required | The name of the Cloud SQL database instance in which the dat…
  id        = ""     # string | optional+computed
  project   = ""     # string | optional | Project ID of the project that contains the instance.

  # databases = [  # list(object)
  #   {
  #     charset = ""
  #     collation = ""
  #     deletion_policy = ""
  #     instance = ""
  #     name = ""
  #     project = ""
  #     self_link = ""
  #   }
  # ]

}

