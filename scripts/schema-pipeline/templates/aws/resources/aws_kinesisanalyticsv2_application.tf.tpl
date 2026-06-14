# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesisanalyticsv2_application                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesisanalyticsv2_application" "this" {

  name                   = ""     # string | required
  runtime_environment    = ""     # string | required
  service_execution_role = ""     # string | required
  application_mode       = ""     # string | optional+computed
  description            = ""     # string | optional
  force_stop             = false  # bool | optional
  id                     = ""     # string | optional+computed
  start_application      = false  # bool | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # create_timestamp       = ""     # string | computed
  # last_update_timestamp  = ""     # string | computed
  # status                 = ""     # string | computed
  # version_id             = 0      # number | computed

  application_configuration { # list [0..1]

    application_code_configuration { # list [1..1]
      code_content_type = ""     # string | required

      code_content { # list [0..1]
        text_content = ""     # string | optional

        s3_content_location { # list [0..1]
          bucket_arn     = ""     # string | required
          file_key       = ""     # string | required
          object_version = ""     # string | optional

        }

      }

    }

    application_snapshot_configuration { # list [0..1]
      snapshots_enabled = false  # bool | required

    }

    environment_properties { # list [0..1]

      property_group { # set [1..50]
        property_group_id = ""     # string | required
        property_map      = {}     # map(string) | required

      }

    }

    flink_application_configuration { # list [0..1]

      checkpoint_configuration { # list [0..1]
        configuration_type            = ""     # string | required
        checkpoint_interval           = 0      # number | optional+computed
        checkpointing_enabled         = false  # bool | optional+computed
        min_pause_between_checkpoints = 0      # number | optional+computed

      }

      monitoring_configuration { # list [0..1]
        configuration_type = ""     # string | required
        log_level          = ""     # string | optional+computed
        metrics_level      = ""     # string | optional+computed

      }

      parallelism_configuration { # list [0..1]
        configuration_type   = ""     # string | required
        auto_scaling_enabled = false  # bool | optional+computed
        parallelism          = 0      # number | optional+computed
        parallelism_per_kpu  = 0      # number | optional+computed

      }

    }

    run_configuration { # list [0..1]

      application_restore_configuration { # list [0..1]
        application_restore_type = ""     # string | optional+computed
        snapshot_name            = ""     # string | optional

      }

      flink_run_configuration { # list [0..1]
        allow_non_restored_state = false  # bool | optional+computed

      }

    }

    sql_application_configuration { # list [0..1]

      input { # list [0..1]
        name_prefix         = ""     # string | required

        # in_app_stream_names = []     # list(string) | computed
        # input_id            = ""     # string | computed

        input_parallelism { # list [0..1]
          count = 0      # number | optional+computed

        }

        input_processing_configuration { # list [0..1]

          input_lambda_processor { # list [1..1]
            resource_arn = ""     # string | required

          }

        }

        input_schema { # list [1..1]
          record_encoding = ""     # string | optional

          record_column { # list [1..1000]
            name     = ""     # string | required
            sql_type = ""     # string | required
            mapping  = ""     # string | optional

          }

          record_format { # list [1..1]
            record_format_type = ""     # string | required

            mapping_parameters { # list [1..1]

              csv_mapping_parameters { # list [0..1]
                record_column_delimiter = ""     # string | required
                record_row_delimiter    = ""     # string | required

              }

              json_mapping_parameters { # list [0..1]
                record_row_path = ""     # string | required

              }

            }

          }

        }

        input_starting_position_configuration { # list
          input_starting_position = ""     # string | optional+computed

        }

        kinesis_firehose_input { # list [0..1]
          resource_arn = ""     # string | required

        }

        kinesis_streams_input { # list [0..1]
          resource_arn = ""     # string | required

        }

      }

      output { # set [0..3]
        name      = ""     # string | required

        # output_id = ""     # string | computed

        destination_schema { # list [1..1]
          record_format_type = ""     # string | required

        }

        kinesis_firehose_output { # list [0..1]
          resource_arn = ""     # string | required

        }

        kinesis_streams_output { # list [0..1]
          resource_arn = ""     # string | required

        }

        lambda_output { # list [0..1]
          resource_arn = ""     # string | required

        }

      }

      reference_data_source { # list [0..1]
        table_name   = ""     # string | required

        # reference_id = ""     # string | computed

        reference_schema { # list [1..1]
          record_encoding = ""     # string | optional

          record_column { # list [1..1000]
            name     = ""     # string | required
            sql_type = ""     # string | required
            mapping  = ""     # string | optional

          }

          record_format { # list [1..1]
            record_format_type = ""     # string | required

            mapping_parameters { # list [1..1]

              csv_mapping_parameters { # list [0..1]
                record_column_delimiter = ""     # string | required
                record_row_delimiter    = ""     # string | required

              }

              json_mapping_parameters { # list [0..1]
                record_row_path = ""     # string | required

              }

            }

          }

        }

        s3_reference_data_source { # list [1..1]
          bucket_arn = ""     # string | required
          file_key   = ""     # string | required

        }

      }

    }

    vpc_configuration { # list [0..1]
      security_group_ids   = []     # set(string) | required
      subnet_ids           = []     # set(string) | required

      # vpc_configuration_id = ""     # string | computed
      # vpc_id               = ""     # string | computed

    }

  }

  cloudwatch_logging_options { # list [0..1]
    log_stream_arn               = ""     # string | required

    # cloudwatch_logging_option_id = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

