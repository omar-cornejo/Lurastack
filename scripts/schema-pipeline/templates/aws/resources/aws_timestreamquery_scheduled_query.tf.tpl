# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_timestreamquery_scheduled_query                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_timestreamquery_scheduled_query" "this" {

  execution_role_arn       = ""     # string | required
  name                     = ""     # string | required
  query_string             = ""     # string | required
  kms_key_id               = ""     # string | optional
  tags                     = {}     # map(string) | optional

  # arn                      = ""     # string | computed
  # creation_time            = ""     # string | computed
  # next_invocation_time     = ""     # string | computed
  # previous_invocation_time = ""     # string | computed
  # state                    = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed

  error_report_configuration { # list

    s3_configuration { # list
      bucket_name       = ""     # string | required
      encryption_option = ""     # string | optional+computed
      object_key_prefix = ""     # string | optional

    }

  }

  last_run_summary { # list

    # failure_reason  = ""     # string | computed
    # invocation_time = ""     # string | computed
    # run_status      = ""     # string | computed
    # trigger_time    = ""     # string | computed

    error_report_location { # list

      s3_report_location { # list

        # bucket_name = ""     # string | computed
        # object_key  = ""     # string | computed

      }

    }

    execution_stats { # list

      # bytes_metered            = 0      # number | computed
      # cumulative_bytes_scanned = 0      # number | computed
      # data_writes              = 0      # number | computed
      # execution_time_in_millis = 0      # number | computed
      # query_result_rows        = 0      # number | computed
      # records_ingested         = 0      # number | computed

    }

    query_insights_response { # list

      # output_bytes      = 0      # number | computed
      # output_rows       = 0      # number | computed
      # query_table_count = 0      # number | computed

      query_spatial_coverage { # list

        max { # list

          # partition_key = []     # list(string) | computed
          # table_arn     = ""     # string | computed
          # value         = 0      # number | computed

        }

      }

      query_temporal_range { # list

        max { # list

          # table_arn = ""     # string | computed
          # value     = 0      # number | computed

        }

      }

    }

  }

  notification_configuration { # list

    sns_configuration { # list
      topic_arn = ""     # string | required

    }

  }

  recently_failed_runs { # list

    # failure_reason  = ""     # string | computed
    # invocation_time = ""     # string | computed
    # run_status      = ""     # string | computed
    # trigger_time    = ""     # string | computed

    error_report_location { # list

      s3_report_location { # list

        # bucket_name = ""     # string | computed
        # object_key  = ""     # string | computed

      }

    }

    execution_stats { # list

      # bytes_metered            = 0      # number | computed
      # cumulative_bytes_scanned = 0      # number | computed
      # data_writes              = 0      # number | computed
      # execution_time_in_millis = 0      # number | computed
      # query_result_rows        = 0      # number | computed
      # records_ingested         = 0      # number | computed

    }

    query_insights_response { # list

      # output_bytes      = 0      # number | computed
      # output_rows       = 0      # number | computed
      # query_table_count = 0      # number | computed

      query_spatial_coverage { # list

        max { # list

          # partition_key = []     # list(string) | computed
          # table_arn     = ""     # string | computed
          # value         = 0      # number | computed

        }

      }

      query_temporal_range { # list

        max { # list

          # table_arn = ""     # string | computed
          # value     = 0      # number | computed

        }

      }

    }

  }

  schedule_configuration { # list
    schedule_expression = ""     # string | required

  }

  target_configuration { # list

    timestream_configuration { # list
      database_name       = ""     # string | required
      table_name          = ""     # string | required
      time_column         = ""     # string | required
      measure_name_column = ""     # string | optional

      dimension_mapping { # list
        dimension_value_type = ""     # string | required
        name                 = ""     # string | required

      }

      mixed_measure_mapping { # list
        measure_value_type  = ""     # string | required
        measure_name        = ""     # string | optional
        source_column       = ""     # string | optional
        target_measure_name = ""     # string | optional

        multi_measure_attribute_mapping { # list
          measure_value_type                  = ""     # string | required
          source_column                       = ""     # string | required
          target_multi_measure_attribute_name = ""     # string | optional

        }

      }

      multi_measure_mappings { # list
        target_multi_measure_name = ""     # string | optional

        multi_measure_attribute_mapping { # list
          measure_value_type                  = ""     # string | required
          source_column                       = ""     # string | required
          target_multi_measure_attribute_name = ""     # string | optional

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

