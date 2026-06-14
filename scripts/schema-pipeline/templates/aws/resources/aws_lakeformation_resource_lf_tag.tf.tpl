# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_resource_lf_tag                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_resource_lf_tag" "this" {

  catalog_id = ""     # string | optional

  # id         = ""     # string | computed

  database { # list
    name       = ""     # string | required
    catalog_id = ""     # string | optional

  }

  lf_tag { # list
    key        = ""     # string | required
    value      = ""     # string | required
    catalog_id = ""     # string | optional+computed

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

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

