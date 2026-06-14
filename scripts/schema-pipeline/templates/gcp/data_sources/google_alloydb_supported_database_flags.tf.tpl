# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_alloydb_supported_database_flags                 │
# └──────────────────────────────────────────────────────────────┘
data "google_alloydb_supported_database_flags" "this" {

  location                 = ""     # string | required | The canonical id for the location. For example: "us-east1".
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional | Project ID of the project.

  # supported_database_flags = [  # list(object)
  #   {
  #     accepts_multiple_values = false
  #     flag_name = ""
  #     integer_restrictions = [  # list(object)
  #       {
  #         max_value = ""
  #         min_value = ""
  #       }
  #     ]
  #     name = ""
  #     requires_db_restart = false
  #     string_restrictions = [  # list(object)
  #       {
  #         allowed_values = []  # list(string)
  #       }
  #     ]
  #     supported_db_versions = []  # list(string)
  #     value_type = ""
  #   }
  # ]

}

