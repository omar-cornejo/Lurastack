# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesis_firehose_delivery_stream                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesis_firehose_delivery_stream" "this" {

  destination    = ""     # string | required
  name           = ""     # string | required
  arn            = ""     # string | optional+computed
  destination_id = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed
  version_id     = ""     # string | optional+computed

  elasticsearch_configuration { # list [0..1]
    index_name            = ""     # string | required
    role_arn              = ""     # string | required
    buffering_interval    = 0      # number | optional
    buffering_size        = 0      # number | optional
    cluster_endpoint      = ""     # string | optional
    domain_arn            = ""     # string | optional
    index_rotation_period = ""     # string | optional
    retry_duration        = 0      # number | optional
    s3_backup_mode        = ""     # string | optional
    type_name             = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    vpc_config { # list [0..1]
      role_arn           = ""     # string | required
      security_group_ids = []     # set(string) | required
      subnet_ids         = []     # set(string) | required

      # vpc_id             = ""     # string | computed

    }

  }

  extended_s3_configuration { # list [0..1]
    bucket_arn          = ""     # string | required
    role_arn            = ""     # string | required
    buffering_interval  = 0      # number | optional
    buffering_size      = 0      # number | optional
    compression_format  = ""     # string | optional
    custom_time_zone    = ""     # string | optional
    error_output_prefix = ""     # string | optional
    file_extension      = ""     # string | optional
    kms_key_arn         = ""     # string | optional
    prefix              = ""     # string | optional
    s3_backup_mode      = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    data_format_conversion_configuration { # list [0..1]
      enabled = false  # bool | optional

      input_format_configuration { # list [1..1]

        deserializer { # list [1..1]

          hive_json_ser_de { # list [0..1]
            timestamp_formats = []     # list(string) | optional

          }

          open_x_json_ser_de { # list [0..1]
            case_insensitive                         = false  # bool | optional
            column_to_json_key_mappings              = {}     # map(string) | optional
            convert_dots_in_json_keys_to_underscores = false  # bool | optional

          }

        }

      }

      output_format_configuration { # list [1..1]

        serializer { # list [1..1]

          orc_ser_de { # list [0..1]
            block_size_bytes                        = 0      # number | optional
            bloom_filter_columns                    = []     # list(string) | optional
            bloom_filter_false_positive_probability = 0      # number | optional
            compression                             = ""     # string | optional
            dictionary_key_threshold                = 0      # number | optional
            enable_padding                          = false  # bool | optional
            format_version                          = ""     # string | optional
            padding_tolerance                       = 0      # number | optional
            row_index_stride                        = 0      # number | optional
            stripe_size_bytes                       = 0      # number | optional

          }

          parquet_ser_de { # list [0..1]
            block_size_bytes              = 0      # number | optional
            compression                   = ""     # string | optional
            enable_dictionary_compression = false  # bool | optional
            max_padding_bytes             = 0      # number | optional
            page_size_bytes               = 0      # number | optional
            writer_version                = ""     # string | optional

          }

        }

      }

      schema_configuration { # list [1..1]
        database_name = ""     # string | required
        role_arn      = ""     # string | required
        table_name    = ""     # string | required
        catalog_id    = ""     # string | optional+computed
        region        = ""     # string | optional+computed
        version_id    = ""     # string | optional

      }

    }

    dynamic_partitioning_configuration { # list [0..1]
      enabled        = false  # bool | optional
      retry_duration = 0      # number | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_backup_configuration { # list [0..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

  }

  http_endpoint_configuration { # list [0..1]
    url                = ""     # string | required
    access_key         = ""     # string | optional+sensitive
    buffering_interval = 0      # number | optional
    buffering_size     = 0      # number | optional
    name               = ""     # string | optional
    retry_duration     = 0      # number | optional
    role_arn           = ""     # string | optional
    s3_backup_mode     = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    request_configuration { # list [0..1]
      content_encoding = ""     # string | optional

      common_attributes { # list
        name  = ""     # string | required
        value = ""     # string | required

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    secrets_manager_configuration { # list [0..1]
      enabled    = false  # bool | optional+computed
      role_arn   = ""     # string | optional
      secret_arn = ""     # string | optional

    }

  }

  iceberg_configuration { # list [0..1]
    catalog_arn        = ""     # string | required
    role_arn           = ""     # string | required
    buffering_interval = 0      # number | optional
    buffering_size     = 0      # number | optional
    retry_duration     = 0      # number | optional
    s3_backup_mode     = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    destination_table_configuration { # list
      database_name          = ""     # string | required
      table_name             = ""     # string | required
      s3_error_output_prefix = ""     # string | optional
      unique_keys            = []     # list(string) | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

  }

  kinesis_source_configuration { # list [0..1]
    kinesis_stream_arn = ""     # string | required
    role_arn           = ""     # string | required

  }

  msk_source_configuration { # list [0..1]
    msk_cluster_arn     = ""     # string | required
    topic_name          = ""     # string | required
    read_from_timestamp = ""     # string | optional

    authentication_configuration { # list [1..1]
      connectivity = ""     # string | required
      role_arn     = ""     # string | required

    }

  }

  opensearch_configuration { # list [0..1]
    index_name            = ""     # string | required
    role_arn              = ""     # string | required
    buffering_interval    = 0      # number | optional
    buffering_size        = 0      # number | optional
    cluster_endpoint      = ""     # string | optional
    domain_arn            = ""     # string | optional
    index_rotation_period = ""     # string | optional
    retry_duration        = 0      # number | optional
    s3_backup_mode        = ""     # string | optional
    type_name             = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    document_id_options { # list [0..1]
      default_document_id_format = ""     # string | required

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    vpc_config { # list [0..1]
      role_arn           = ""     # string | required
      security_group_ids = []     # set(string) | required
      subnet_ids         = []     # set(string) | required

      # vpc_id             = ""     # string | computed

    }

  }

  opensearchserverless_configuration { # list [0..1]
    collection_endpoint = ""     # string | required
    index_name          = ""     # string | required
    role_arn            = ""     # string | required
    buffering_interval  = 0      # number | optional
    buffering_size      = 0      # number | optional
    retry_duration      = 0      # number | optional
    s3_backup_mode      = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    vpc_config { # list [0..1]
      role_arn           = ""     # string | required
      security_group_ids = []     # set(string) | required
      subnet_ids         = []     # set(string) | required

      # vpc_id             = ""     # string | computed

    }

  }

  redshift_configuration { # list [0..1]
    cluster_jdbcurl    = ""     # string | required
    data_table_name    = ""     # string | required
    role_arn           = ""     # string | required
    copy_options       = ""     # string | optional
    data_table_columns = ""     # string | optional
    password           = ""     # string | optional+sensitive
    retry_duration     = 0      # number | optional
    s3_backup_mode     = ""     # string | optional
    username           = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_backup_configuration { # list [0..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    secrets_manager_configuration { # list [0..1]
      enabled    = false  # bool | optional+computed
      role_arn   = ""     # string | optional
      secret_arn = ""     # string | optional

    }

  }

  server_side_encryption { # list [0..1]
    enabled  = false  # bool | optional
    key_arn  = ""     # string | optional
    key_type = ""     # string | optional

  }

  snowflake_configuration { # list [0..1]
    account_url          = ""     # string | required
    database             = ""     # string | required
    role_arn             = ""     # string | required
    schema               = ""     # string | required
    table                = ""     # string | required
    buffering_interval   = 0      # number | optional
    buffering_size       = 0      # number | optional
    content_column_name  = ""     # string | optional
    data_loading_option  = ""     # string | optional
    key_passphrase       = ""     # string | optional+sensitive
    metadata_column_name = ""     # string | optional
    private_key          = ""     # string | optional+sensitive
    retry_duration       = 0      # number | optional
    s3_backup_mode       = ""     # string | optional
    user                 = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    secrets_manager_configuration { # list [0..1]
      enabled    = false  # bool | optional+computed
      role_arn   = ""     # string | optional
      secret_arn = ""     # string | optional

    }

    snowflake_role_configuration { # list [0..1]
      enabled        = false  # bool | optional
      snowflake_role = ""     # string | optional

    }

    snowflake_vpc_configuration { # list [0..1]
      private_link_vpce_id = ""     # string | required

    }

  }

  splunk_configuration { # list [0..1]
    hec_endpoint               = ""     # string | required
    buffering_interval         = 0      # number | optional
    buffering_size             = 0      # number | optional
    hec_acknowledgment_timeout = 0      # number | optional
    hec_endpoint_type          = ""     # string | optional
    hec_token                  = ""     # string | optional
    retry_duration             = 0      # number | optional
    s3_backup_mode             = ""     # string | optional

    cloudwatch_logging_options { # list [0..1]
      enabled         = false  # bool | optional
      log_group_name  = ""     # string | optional
      log_stream_name = ""     # string | optional

    }

    processing_configuration { # list [0..1]
      enabled = false  # bool | optional

      processors { # list
        type = ""     # string | required

        parameters { # set
          parameter_name  = ""     # string | required
          parameter_value = ""     # string | required

        }

      }

    }

    s3_configuration { # list [1..1]
      bucket_arn          = ""     # string | required
      role_arn            = ""     # string | required
      buffering_interval  = 0      # number | optional
      buffering_size      = 0      # number | optional
      compression_format  = ""     # string | optional
      error_output_prefix = ""     # string | optional
      kms_key_arn         = ""     # string | optional
      prefix              = ""     # string | optional

      cloudwatch_logging_options { # list [0..1]
        enabled         = false  # bool | optional
        log_group_name  = ""     # string | optional
        log_stream_name = ""     # string | optional

      }

    }

    secrets_manager_configuration { # list [0..1]
      enabled    = false  # bool | optional+computed
      role_arn   = ""     # string | optional
      secret_arn = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

