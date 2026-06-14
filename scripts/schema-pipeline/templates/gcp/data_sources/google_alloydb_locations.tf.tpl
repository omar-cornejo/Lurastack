# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_alloydb_locations                                │
# └──────────────────────────────────────────────────────────────┘
data "google_alloydb_locations" "this" {

  id        = ""     # string | optional+computed
  project   = ""     # string | optional | Project ID of the project.

  # locations = [  # list(object)
  #   {
  #     display_name = ""
  #     labels = {}  # map(string)
  #     location_id = ""
  #     metadata = {}  # map(string)
  #     name = ""
  #   }
  # ]

}

