# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_resource_lf_tags                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_resource_lf_tags" "this" {

  catalog_id = ""     # string | optional+computed
  id         = ""     # string | optional+computed

  database { # list [0..1]
    name       = ""     # string | required
    catalog_id = ""     # string | optional+computed

  }

  lf_tag { # set [1..*]
    key        = ""     # string | required
    value      = ""     # string | required
    catalog_id = ""     # string | optional+computed

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

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

