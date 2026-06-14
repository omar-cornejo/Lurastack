# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesis_analytics_application                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesis_analytics_application" "this" {

  name                  = ""     # string | required
  code                  = ""     # string | optional
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  start_application     = false  # bool | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # create_timestamp      = ""     # string | computed
  # last_update_timestamp = ""     # string | computed
  # status                = ""     # string | computed
  # version               = 0      # number | computed

  cloudwatch_logging_options { # list [0..1]
    log_stream_arn = ""     # string | required
    role_arn       = ""     # string | required

    # id             = ""     # string | computed

  }

  inputs { # list [0..1]
    name_prefix  = ""     # string | required

    # id           = ""     # string | computed
    # stream_names = []     # list(string) | computed

    kinesis_firehose { # list [0..1]
      resource_arn = ""     # string | required
      role_arn     = ""     # string | required

    }

    kinesis_stream { # list [0..1]
      resource_arn = ""     # string | required
      role_arn     = ""     # string | required

    }

    parallelism { # list [0..1]
      count = 0      # number | optional+computed

    }

    processing_configuration { # list [0..1]

      lambda { # list [1..1]
        resource_arn = ""     # string | required
        role_arn     = ""     # string | required

      }

    }

    schema { # list [1..1]
      record_encoding = ""     # string | optional

      record_columns { # list [1..1000]
        name     = ""     # string | required
        sql_type = ""     # string | required
        mapping  = ""     # string | optional

      }

      record_format { # list [1..1]

        # record_format_type = ""     # string | computed

        mapping_parameters { # list [0..1]

          csv { # list [0..1]
            record_column_delimiter = ""     # string | required
            record_row_delimiter    = ""     # string | required

          }

          json { # list [0..1]
            record_row_path = ""     # string | required

          }

        }

      }

    }

    starting_position_configuration { # list
      starting_position = ""     # string | optional+computed

    }

  }

  outputs { # set [0..3]
    name = ""     # string | required

    # id   = ""     # string | computed

    kinesis_firehose { # list [0..1]
      resource_arn = ""     # string | required
      role_arn     = ""     # string | required

    }

    kinesis_stream { # list [0..1]
      resource_arn = ""     # string | required
      role_arn     = ""     # string | required

    }

    lambda { # list [0..1]
      resource_arn = ""     # string | required
      role_arn     = ""     # string | required

    }

    schema { # list [1..1]
      record_format_type = ""     # string | required

    }

  }

  reference_data_sources { # list [0..1]
    table_name = ""     # string | required

    # id         = ""     # string | computed

    s3 { # list [1..1]
      bucket_arn = ""     # string | required
      file_key   = ""     # string | required
      role_arn   = ""     # string | required

    }

    schema { # list [1..1]
      record_encoding = ""     # string | optional

      record_columns { # list [1..1000]
        name     = ""     # string | required
        sql_type = ""     # string | required
        mapping  = ""     # string | optional

      }

      record_format { # list [1..1]

        # record_format_type = ""     # string | computed

        mapping_parameters { # list [0..1]

          csv { # list [0..1]
            record_column_delimiter = ""     # string | required
            record_row_delimiter    = ""     # string | required

          }

          json { # list [0..1]
            record_row_path = ""     # string | required

          }

        }

      }

    }

  }

}

