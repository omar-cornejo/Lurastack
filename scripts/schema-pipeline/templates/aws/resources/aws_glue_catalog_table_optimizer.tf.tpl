# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_catalog_table_optimizer                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_catalog_table_optimizer" "this" {

  catalog_id    = ""     # string | required
  database_name = ""     # string | required
  table_name    = ""     # string | required
  type          = ""     # string | required

  configuration { # list
    enabled  = false  # bool | required
    role_arn = ""     # string | required

    orphan_file_deletion_configuration { # list

      iceberg_configuration { # list
        location                             = ""     # string | optional
        orphan_file_retention_period_in_days = 0      # number | optional

      }

    }

    retention_configuration { # list

      iceberg_configuration { # list
        clean_expired_files               = false  # bool | optional
        number_of_snapshots_to_retain     = 0      # number | optional
        snapshot_retention_period_in_days = 0      # number | optional

      }

    }

  }

}

