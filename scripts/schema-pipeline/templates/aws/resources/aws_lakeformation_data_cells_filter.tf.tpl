# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_data_cells_filter                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_data_cells_filter" "this" {


  # id = ""     # string | computed

  table_data { # list
    database_name    = ""     # string | required
    name             = ""     # string | required
    table_catalog_id = ""     # string | required
    table_name       = ""     # string | required
    column_names     = []     # set(string) | optional+computed
    version_id       = ""     # string | optional+computed

    column_wildcard { # list
      excluded_column_names = []     # list(string) | optional

    }

    row_filter { # list
      filter_expression = ""     # string | optional+computed

      all_rows_wildcard {} # list

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

