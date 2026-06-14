# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_permissions                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_permissions" "this" {

  permissions                   = []     # set(string) | required
  principal                     = ""     # string | required
  catalog_id                    = ""     # string | optional
  catalog_resource              = false  # bool | optional
  id                            = ""     # string | optional+computed
  permissions_with_grant_option = []     # set(string) | optional+computed

  data_cells_filter { # list [0..1]
    database_name    = ""     # string | required
    name             = ""     # string | required
    table_catalog_id = ""     # string | required
    table_name       = ""     # string | required

  }

  data_location { # list [0..1]
    arn        = ""     # string | required
    catalog_id = ""     # string | optional+computed

  }

  database { # list [0..1]
    name       = ""     # string | required
    catalog_id = ""     # string | optional+computed

  }

  lf_tag { # list [0..1]
    key        = ""     # string | required
    values     = []     # set(string) | required
    catalog_id = ""     # string | optional+computed

  }

  lf_tag_policy { # list [0..1]
    resource_type = ""     # string | required
    catalog_id    = ""     # string | optional+computed

    expression { # set [1..*]
      key    = ""     # string | required
      values = []     # set(string) | required

    }

  }

  table { # list [0..1]
    database_name = ""     # string | required
    catalog_id    = ""     # string | optional+computed
    name          = ""     # string | optional+computed
    wildcard      = false  # bool | optional

  }

  table_with_columns { # list [0..1]
    database_name         = ""     # string | required
    name                  = ""     # string | required
    catalog_id            = ""     # string | optional+computed
    column_names          = []     # set(string) | optional
    excluded_column_names = []     # set(string) | optional
    wildcard              = false  # bool | optional

  }

}

