# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_data_set                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_data_set" "this" {

  data_set_id    = ""     # string | required
  import_mode    = ""     # string | required
  name           = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # output_columns = [  # list(object)
  #   {
  #     description = ""
  #     name = ""
  #     type = ""
  #   }
  # ]

  column_groups { # list [0..8]

    geo_spatial_column_group { # list [0..1]
      columns      = []     # list(string) | required
      country_code = ""     # string | required
      name         = ""     # string | required

    }

  }

  column_level_permission_rules { # list
    column_names = []     # list(string) | optional
    principals   = []     # list(string) | optional

  }

  data_set_usage_configuration { # list [0..1]
    disable_use_as_direct_query_source = false  # bool | optional+computed
    disable_use_as_imported_source     = false  # bool | optional+computed

  }

  field_folders { # set [0..1000]
    field_folders_id = ""     # string | required
    columns          = []     # list(string) | optional
    description      = ""     # string | optional

  }

  logical_table_map { # set [0..64]
    alias                = ""     # string | required
    logical_table_map_id = ""     # string | required

    data_transforms { # list [0..2048]

      cast_column_type_operation { # list [0..1]
        column_name     = ""     # string | required
        new_column_type = ""     # string | required
        format          = ""     # string | optional+computed

      }

      create_columns_operation { # list [0..1]

        columns { # list [1..128]
          column_id   = ""     # string | required
          column_name = ""     # string | required
          expression  = ""     # string | required

        }

      }

      filter_operation { # list [0..1]
        condition_expression = ""     # string | required

      }

      project_operation { # list [0..1]
        projected_columns = []     # list(string) | required

      }

      rename_column_operation { # list [0..1]
        column_name     = ""     # string | required
        new_column_name = ""     # string | required

      }

      tag_column_operation { # list [0..1]
        column_name = ""     # string | required

        tags { # list [1..16]
          column_geographic_role = ""     # string | optional+computed

          column_description { # list [0..1]
            text = ""     # string | optional+computed

          }

        }

      }

      untag_column_operation { # list [0..1]
        column_name = ""     # string | required
        tag_names   = []     # list(string) | required

      }

    }

    source { # list [1..1]
      data_set_arn      = ""     # string | optional+computed
      physical_table_id = ""     # string | optional+computed

      join_instruction { # list [0..1]
        left_operand  = ""     # string | required
        on_clause     = ""     # string | required
        right_operand = ""     # string | required
        type          = ""     # string | required

        left_join_key_properties { # list [0..1]
          unique_key = false  # bool | optional+computed

        }

        right_join_key_properties { # list [0..1]
          unique_key = false  # bool | optional+computed

        }

      }

    }

  }

  permissions { # set [0..64]
    actions   = []     # set(string) | required
    principal = ""     # string | required

  }

  physical_table_map { # set [0..32]
    physical_table_map_id = ""     # string | required

    custom_sql { # list [0..1]
      data_source_arn = ""     # string | required
      name            = ""     # string | required
      sql_query       = ""     # string | required

      columns { # list [0..2048]
        name = ""     # string | required
        type = ""     # string | required

      }

    }

    relational_table { # list [0..1]
      data_source_arn = ""     # string | required
      name            = ""     # string | required
      catalog         = ""     # string | optional
      schema          = ""     # string | optional

      input_columns { # list [1..2048]
        name = ""     # string | required
        type = ""     # string | required

      }

    }

    s3_source { # list [0..1]
      data_source_arn = ""     # string | required

      input_columns { # list [1..2048]
        name = ""     # string | required
        type = ""     # string | required

      }

      upload_settings { # list [1..1]
        contains_header = false  # bool | optional+computed
        delimiter       = ""     # string | optional+computed
        format          = ""     # string | optional+computed
        start_from_row  = 0      # number | optional+computed
        text_qualifier  = ""     # string | optional+computed

      }

    }

  }

  refresh_properties { # list [0..1]

    refresh_configuration { # list [1..1]

      incremental_refresh { # list [1..1]

        lookback_window { # list [1..1]
          column_name = ""     # string | required
          size        = 0      # number | required
          size_unit   = ""     # string | required

        }

      }

    }

  }

  row_level_permission_data_set { # list [0..1]
    arn               = ""     # string | required
    permission_policy = ""     # string | required
    format_version    = ""     # string | optional
    namespace         = ""     # string | optional
    status            = ""     # string | optional

  }

  row_level_permission_tag_configuration { # list [0..1]
    status = ""     # string | optional

    tag_rules { # list [1..50]
      column_name               = ""     # string | required
      tag_key                   = ""     # string | required
      match_all_value           = ""     # string | optional
      tag_multi_value_delimiter = ""     # string | optional

    }

  }

}

