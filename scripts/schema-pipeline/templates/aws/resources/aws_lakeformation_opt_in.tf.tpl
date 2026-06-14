# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_opt_in                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_opt_in" "this" {


  # last_modified   = ""     # string | computed
  # last_updated_by = ""     # string | computed

  condition { # list

    # expression = ""     # string | computed

  }

  principal { # list
    data_lake_principal_identifier = ""     # string | required

  }

  resource_data { # list

    catalog { # list
      id = ""     # string | optional

    }

    data_cells_filter { # list
      database_name    = ""     # string | optional
      name             = ""     # string | optional
      table_catalog_id = ""     # string | optional
      table_name       = ""     # string | optional

    }

    data_location { # list
      resource_arn = ""     # string | required
      catalog_id   = ""     # string | optional+computed

    }

    database { # list
      name       = ""     # string | required
      catalog_id = ""     # string | optional

    }

    lf_tag { # list
      key        = ""     # string | required
      value      = ""     # string | required
      catalog_id = ""     # string | optional+computed

    }

    lf_tag_expression { # list
      name       = ""     # string | required
      catalog_id = ""     # string | optional

    }

    lf_tag_policy { # list
      resource_type   = ""     # string | required
      catalog_id      = ""     # string | optional+computed
      expression      = []     # list(string) | optional
      expression_name = ""     # string | optional

    }

    table { # list
      database_name = ""     # string | required
      catalog_id    = ""     # string | optional
      name          = ""     # string | optional
      wildcard      = false  # bool | optional

    }

    table_with_columns { # list
      database_name = ""     # string | required
      name          = ""     # string | required
      catalog_id    = ""     # string | optional
      column_names  = []     # set(string) | optional

      column_wildcard { # list
        excluded_column_names = []     # set(string) | optional

      }

    }

  }

}

