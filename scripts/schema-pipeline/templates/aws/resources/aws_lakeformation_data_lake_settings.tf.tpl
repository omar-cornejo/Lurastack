# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_data_lake_settings                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_data_lake_settings" "this" {

  admins                                = []     # set(string) | optional+computed
  allow_external_data_filtering         = false  # bool | optional
  allow_full_table_external_data_access = false  # bool | optional
  authorized_session_tag_value_list     = []     # list(string) | optional+computed
  catalog_id                            = ""     # string | optional
  external_data_filtering_allow_list    = []     # set(string) | optional+computed
  id                                    = ""     # string | optional+computed
  parameters                            = {}     # map(string) | optional+computed
  read_only_admins                      = []     # set(string) | optional+computed
  trusted_resource_owners               = []     # list(string) | optional+computed

  create_database_default_permissions { # list [0..3]
    permissions = []     # set(string) | optional+computed
    principal   = ""     # string | optional+computed

  }

  create_table_default_permissions { # list [0..3]
    permissions = []     # set(string) | optional+computed
    principal   = ""     # string | optional+computed

  }

}

