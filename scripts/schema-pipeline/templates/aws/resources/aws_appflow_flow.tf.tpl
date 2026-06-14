# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appflow_flow                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appflow_flow" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  kms_arn     = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # flow_status = ""     # string | computed

  destination_flow_config { # list [1..*]
    connector_type         = ""     # string | required
    api_version            = ""     # string | optional
    connector_profile_name = ""     # string | optional

    destination_connector_properties { # list [1..1]

      custom_connector { # list [0..1]
        entity_name          = ""     # string | required
        custom_properties    = {}     # map(string) | optional
        id_field_names       = []     # list(string) | optional
        write_operation_type = ""     # string | optional

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      customer_profiles { # list [0..1]
        domain_name      = ""     # string | required
        object_type_name = ""     # string | optional

      }

      event_bridge { # list [0..1]
        object = ""     # string | required

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      honeycode { # list [0..1]
        object = ""     # string | required

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      lookout_metrics {} # list [0..1]

      marketo { # list [0..1]
        object = ""     # string | required

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      redshift { # list [0..1]
        intermediate_bucket_name = ""     # string | required
        object                   = ""     # string | required
        bucket_prefix            = ""     # string | optional

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      s3 { # list [0..1]
        bucket_name   = ""     # string | required
        bucket_prefix = ""     # string | optional+computed

        s3_output_format_config { # list [0..1]
          file_type                   = ""     # string | optional
          preserve_source_data_typing = false  # bool | optional+computed

          aggregation_config { # list [0..1]
            aggregation_type = ""     # string | optional+computed
            target_file_size = 0      # number | optional+computed

          }

          prefix_config { # list [0..1]
            prefix_format    = ""     # string | optional
            prefix_hierarchy = []     # list(string) | optional+computed
            prefix_type      = ""     # string | optional

          }

        }

      }

      salesforce { # list [0..1]
        object               = ""     # string | required
        data_transfer_api    = ""     # string | optional
        id_field_names       = []     # list(string) | optional
        write_operation_type = ""     # string | optional

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      sapo_data { # list [0..1]
        object_path          = ""     # string | required
        id_field_names       = []     # list(string) | optional
        write_operation_type = ""     # string | optional

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

        success_response_handling_config { # list [0..1]
          bucket_name   = ""     # string | optional
          bucket_prefix = ""     # string | optional

        }

      }

      snowflake { # list [0..1]
        intermediate_bucket_name = ""     # string | required
        object                   = ""     # string | required
        bucket_prefix            = ""     # string | optional

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

      upsolver { # list [0..1]
        bucket_name   = ""     # string | required
        bucket_prefix = ""     # string | optional

        s3_output_format_config { # list [1..1]
          file_type = ""     # string | optional

          aggregation_config { # list [0..1]
            aggregation_type = ""     # string | optional

          }

          prefix_config { # list [1..1]
            prefix_type      = ""     # string | required
            prefix_format    = ""     # string | optional
            prefix_hierarchy = []     # list(string) | optional+computed

          }

        }

      }

      zendesk { # list [0..1]
        object               = ""     # string | required
        id_field_names       = []     # list(string) | optional
        write_operation_type = ""     # string | optional

        error_handling_config { # list [0..1]
          bucket_name                     = ""     # string | optional
          bucket_prefix                   = ""     # string | optional
          fail_on_first_destination_error = false  # bool | optional

        }

      }

    }

  }

  metadata_catalog_config { # list [0..1]

    glue_data_catalog { # list [0..1]
      database_name = ""     # string | required
      role_arn      = ""     # string | required
      table_prefix  = ""     # string | required

    }

  }

  source_flow_config { # list [1..1]
    connector_type         = ""     # string | required
    api_version            = ""     # string | optional
    connector_profile_name = ""     # string | optional

    incremental_pull_config { # list [0..1]
      datetime_type_field_name = ""     # string | optional

    }

    source_connector_properties { # list [1..1]

      amplitude { # list [0..1]
        object = ""     # string | required

      }

      custom_connector { # list [0..1]
        entity_name       = ""     # string | required
        custom_properties = {}     # map(string) | optional

      }

      datadog { # list [0..1]
        object = ""     # string | required

      }

      dynatrace { # list [0..1]
        object = ""     # string | required

      }

      google_analytics { # list [0..1]
        object = ""     # string | required

      }

      infor_nexus { # list [0..1]
        object = ""     # string | required

      }

      marketo { # list [0..1]
        object = ""     # string | required

      }

      s3 { # list [0..1]
        bucket_name   = ""     # string | required
        bucket_prefix = ""     # string | required

        s3_input_format_config { # list [0..1]
          s3_input_file_type = ""     # string | optional

        }

      }

      salesforce { # list [0..1]
        object                      = ""     # string | required
        data_transfer_api           = ""     # string | optional
        enable_dynamic_field_update = false  # bool | optional
        include_deleted_records     = false  # bool | optional

      }

      sapo_data { # list [0..1]
        object_path = ""     # string | required

        pagination_config { # list [0..1]
          max_page_size = 0      # number | required

        }

        parallelism_config { # list [0..1]
          max_page_size = 0      # number | required

        }

      }

      service_now { # list [0..1]
        object = ""     # string | required

      }

      singular { # list [0..1]
        object = ""     # string | required

      }

      slack { # list [0..1]
        object = ""     # string | required

      }

      trendmicro { # list [0..1]
        object = ""     # string | required

      }

      veeva { # list [0..1]
        object               = ""     # string | required
        document_type        = ""     # string | optional
        include_all_versions = false  # bool | optional
        include_renditions   = false  # bool | optional
        include_source_files = false  # bool | optional

      }

      zendesk { # list [0..1]
        object = ""     # string | required

      }

    }

  }

  task { # set [1..*]
    task_type         = ""     # string | required
    destination_field = ""     # string | optional
    source_fields     = []     # list(string) | optional+computed
    task_properties   = {}     # map(string) | optional

    connector_operator { # list
      amplitude        = ""     # string | optional
      custom_connector = ""     # string | optional
      datadog          = ""     # string | optional
      dynatrace        = ""     # string | optional
      google_analytics = ""     # string | optional
      infor_nexus      = ""     # string | optional
      marketo          = ""     # string | optional
      s3               = ""     # string | optional
      salesforce       = ""     # string | optional
      sapo_data        = ""     # string | optional
      service_now      = ""     # string | optional
      singular         = ""     # string | optional
      slack            = ""     # string | optional
      trendmicro       = ""     # string | optional
      veeva            = ""     # string | optional
      zendesk          = ""     # string | optional

    }

  }

  trigger_config { # list [1..1]
    trigger_type = ""     # string | required

    trigger_properties { # list [0..1]

      scheduled { # list [0..1]
        schedule_expression  = ""     # string | required
        data_pull_mode       = ""     # string | optional
        first_execution_from = ""     # string | optional
        schedule_end_time    = ""     # string | optional
        schedule_offset      = 0      # number | optional
        schedule_start_time  = ""     # string | optional
        timezone             = ""     # string | optional

      }

    }

  }

}

