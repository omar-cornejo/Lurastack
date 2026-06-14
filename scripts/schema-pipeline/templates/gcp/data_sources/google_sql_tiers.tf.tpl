# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_tiers                                        │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_tiers" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed | Project ID of the project for which to list tiers.

  # tiers = [  # list(object)
  #   {
  #     disk_quota = 0
  #     ram = 0
  #     region = []  # list(string)
  #     tier = ""
  #   }
  # ]

}

