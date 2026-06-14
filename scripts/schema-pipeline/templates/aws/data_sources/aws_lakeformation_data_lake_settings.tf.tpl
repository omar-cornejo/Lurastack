# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lakeformation_data_lake_settings                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_lakeformation_data_lake_settings" "this" {

  catalog_id                            = ""     # string | optional
  id                                    = ""     # string | optional+computed

  # admins                                = []     # set(string) | computed
  # allow_external_data_filtering         = false  # bool | computed
  # allow_full_table_external_data_access = false  # bool | computed
  # authorized_session_tag_value_list     = []     # list(string) | computed
  # create_database_default_permissions = [  # list(object)
  #   {
  #     permissions = []  # set(string)
  #     principal = ""
  #   }
  # ]
  # create_table_default_permissions = [  # list(object)
  #   {
  #     permissions = []  # set(string)
  #     principal = ""
  #   }
  # ]
  # external_data_filtering_allow_list    = []     # set(string) | computed
  # parameters                            = {}     # map(string) | computed
  # read_only_admins                      = []     # set(string) | computed
  # trusted_resource_owners               = []     # list(string) | computed

}

