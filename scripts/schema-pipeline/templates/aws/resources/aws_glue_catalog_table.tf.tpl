# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_catalog_table                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_catalog_table" "this" {

  database_name      = ""     # string | required
  name               = ""     # string | required
  catalog_id         = ""     # string | optional+computed
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  owner              = ""     # string | optional
  parameters         = {}     # map(string) | optional
  retention          = 0      # number | optional
  table_type         = ""     # string | optional
  view_expanded_text = ""     # string | optional
  view_original_text = ""     # string | optional

  # arn                = ""     # string | computed

  open_table_format_input { # list [0..1]

    iceberg_input { # list [1..1]
      metadata_operation = ""     # string | required
      version            = ""     # string | optional

    }

  }

  partition_index { # list [0..3]
    index_name   = ""     # string | required
    keys         = []     # list(string) | required

    # index_status = ""     # string | computed

  }

  partition_keys { # list
    name    = ""     # string | required
    comment = ""     # string | optional
    type    = ""     # string | optional

  }

  storage_descriptor { # list [0..1]
    additional_locations      = []     # list(string) | optional
    bucket_columns            = []     # list(string) | optional
    compressed                = false  # bool | optional
    input_format              = ""     # string | optional
    location                  = ""     # string | optional
    number_of_buckets         = 0      # number | optional
    output_format             = ""     # string | optional
    parameters                = {}     # map(string) | optional
    stored_as_sub_directories = false  # bool | optional

    columns { # list
      name       = ""     # string | required
      comment    = ""     # string | optional
      parameters = {}     # map(string) | optional
      type       = ""     # string | optional

    }

    schema_reference { # list [0..1]
      schema_version_number = 0      # number | required
      schema_version_id     = ""     # string | optional

      schema_id { # list [0..1]
        registry_name = ""     # string | optional
        schema_arn    = ""     # string | optional
        schema_name   = ""     # string | optional

      }

    }

    ser_de_info { # list [0..1]
      name                  = ""     # string | optional
      parameters            = {}     # map(string) | optional
      serialization_library = ""     # string | optional

    }

    skewed_info { # list [0..1]
      skewed_column_names               = []     # list(string) | optional
      skewed_column_value_location_maps = {}     # map(string) | optional
      skewed_column_values              = []     # list(string) | optional

    }

    sort_columns { # list
      column     = ""     # string | required
      sort_order = 0      # number | required

    }

  }

  target_table { # list [0..1]
    catalog_id    = ""     # string | required
    database_name = ""     # string | required
    name          = ""     # string | required
    region        = ""     # string | optional

  }

}

