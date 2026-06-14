# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_partition                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_partition" "this" {

  database_name      = ""     # string | required
  partition_values   = []     # list(string) | required
  table_name         = ""     # string | required
  catalog_id         = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  parameters         = {}     # map(string) | optional

  # creation_time      = ""     # string | computed
  # last_accessed_time = ""     # string | computed
  # last_analyzed_time = ""     # string | computed

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
      name    = ""     # string | required
      comment = ""     # string | optional
      type    = ""     # string | optional

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

}

