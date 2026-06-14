# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_catalog_database                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_catalog_database" "this" {

  name         = ""     # string | required
  catalog_id   = ""     # string | optional+computed
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  location_uri = ""     # string | optional+computed
  parameters   = {}     # map(string) | optional
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

  create_table_default_permission { # list
    permissions = []     # set(string) | optional

    principal { # list [0..1]
      data_lake_principal_identifier = ""     # string | optional

    }

  }

  federated_database { # list [0..1]
    connection_name = ""     # string | optional
    identifier      = ""     # string | optional

  }

  target_database { # list [0..1]
    catalog_id    = ""     # string | required
    database_name = ""     # string | required
    region        = ""     # string | optional

  }

}

