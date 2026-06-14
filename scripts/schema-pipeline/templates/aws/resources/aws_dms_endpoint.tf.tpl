# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_endpoint                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_endpoint" "this" {

  endpoint_id                     = ""     # string | required
  endpoint_type                   = ""     # string | required
  engine_name                     = ""     # string | required
  certificate_arn                 = ""     # string | optional+computed
  database_name                   = ""     # string | optional
  extra_connection_attributes     = ""     # string | optional+computed
  id                              = ""     # string | optional+computed
  kms_key_arn                     = ""     # string | optional+computed
  password                        = ""     # string | optional+sensitive
  pause_replication_tasks         = false  # bool | optional
  port                            = 0      # number | optional
  secrets_manager_access_role_arn = ""     # string | optional
  secrets_manager_arn             = ""     # string | optional
  server_name                     = ""     # string | optional
  service_access_role             = ""     # string | optional
  ssl_mode                        = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  username                        = ""     # string | optional

  # endpoint_arn                    = ""     # string | computed

  elasticsearch_settings { # list [0..1]
    endpoint_uri               = ""     # string | required
    service_access_role_arn    = ""     # string | required
    error_retry_duration       = 0      # number | optional
    full_load_error_percentage = 0      # number | optional
    use_new_mapping_type       = false  # bool | optional

  }

  kafka_settings { # list [0..1]
    broker                         = ""     # string | required
    include_control_details        = false  # bool | optional
    include_null_and_empty         = false  # bool | optional
    include_partition_value        = false  # bool | optional
    include_table_alter_operations = false  # bool | optional
    include_transaction_details    = false  # bool | optional
    message_format                 = ""     # string | optional
    message_max_bytes              = 0      # number | optional
    no_hex_prefix                  = false  # bool | optional
    partition_include_schema_table = false  # bool | optional
    sasl_mechanism                 = ""     # string | optional
    sasl_password                  = ""     # string | optional+sensitive
    sasl_username                  = ""     # string | optional
    security_protocol              = ""     # string | optional
    ssl_ca_certificate_arn         = ""     # string | optional
    ssl_client_certificate_arn     = ""     # string | optional
    ssl_client_key_arn             = ""     # string | optional
    ssl_client_key_password        = ""     # string | optional+sensitive
    topic                          = ""     # string | optional

  }

  kinesis_settings { # list [0..1]
    include_control_details        = false  # bool | optional
    include_null_and_empty         = false  # bool | optional
    include_partition_value        = false  # bool | optional
    include_table_alter_operations = false  # bool | optional
    include_transaction_details    = false  # bool | optional
    message_format                 = ""     # string | optional
    partition_include_schema_table = false  # bool | optional
    service_access_role_arn        = ""     # string | optional
    stream_arn                     = ""     # string | optional
    use_large_integer_value        = false  # bool | optional

  }

  mongodb_settings { # list [0..1]
    auth_mechanism      = ""     # string | optional
    auth_source         = ""     # string | optional
    auth_type           = ""     # string | optional
    docs_to_investigate = ""     # string | optional
    extract_doc_id      = ""     # string | optional
    nesting_level       = ""     # string | optional

  }

  postgres_settings { # list [0..1]
    after_connect_script         = ""     # string | optional
    babelfish_database_name      = ""     # string | optional
    capture_ddls                 = false  # bool | optional
    database_mode                = ""     # string | optional
    ddl_artifacts_schema         = ""     # string | optional
    execute_timeout              = 0      # number | optional
    fail_tasks_on_lob_truncation = false  # bool | optional
    heartbeat_enable             = false  # bool | optional
    heartbeat_frequency          = 0      # number | optional
    heartbeat_schema             = ""     # string | optional
    map_boolean_as_boolean       = false  # bool | optional
    map_jsonb_as_clob            = false  # bool | optional
    map_long_varchar_as          = ""     # string | optional
    max_file_size                = 0      # number | optional
    plugin_name                  = ""     # string | optional
    slot_name                    = ""     # string | optional

  }

  redis_settings { # list [0..1]
    auth_type              = ""     # string | required
    port                   = 0      # number | required
    server_name            = ""     # string | required
    auth_password          = ""     # string | optional+sensitive
    auth_user_name         = ""     # string | optional
    ssl_ca_certificate_arn = ""     # string | optional
    ssl_security_protocol  = ""     # string | optional

  }

  redshift_settings { # list [0..1]
    bucket_folder                     = ""     # string | optional
    bucket_name                       = ""     # string | optional
    encryption_mode                   = ""     # string | optional
    server_side_encryption_kms_key_id = ""     # string | optional
    service_access_role_arn           = ""     # string | optional

  }

  s3_settings { # list [0..1]
    add_column_name                             = false  # bool | optional
    bucket_folder                               = ""     # string | optional
    bucket_name                                 = ""     # string | optional
    canned_acl_for_objects                      = ""     # string | optional
    cdc_inserts_and_updates                     = false  # bool | optional
    cdc_inserts_only                            = false  # bool | optional
    cdc_max_batch_interval                      = 0      # number | optional
    cdc_min_file_size                           = 0      # number | optional
    cdc_path                                    = ""     # string | optional
    compression_type                            = ""     # string | optional
    csv_delimiter                               = ""     # string | optional
    csv_no_sup_value                            = ""     # string | optional
    csv_null_value                              = ""     # string | optional
    csv_row_delimiter                           = ""     # string | optional
    data_format                                 = ""     # string | optional
    data_page_size                              = 0      # number | optional
    date_partition_delimiter                    = ""     # string | optional
    date_partition_enabled                      = false  # bool | optional
    date_partition_sequence                     = ""     # string | optional
    dict_page_size_limit                        = 0      # number | optional
    enable_statistics                           = false  # bool | optional
    encoding_type                               = ""     # string | optional
    encryption_mode                             = ""     # string | optional
    external_table_definition                   = ""     # string | optional
    glue_catalog_generation                     = false  # bool | optional
    ignore_header_rows                          = 0      # number | optional
    include_op_for_full_load                    = false  # bool | optional
    max_file_size                               = 0      # number | optional
    parquet_timestamp_in_millisecond            = false  # bool | optional
    parquet_version                             = ""     # string | optional
    preserve_transactions                       = false  # bool | optional
    rfc_4180                                    = false  # bool | optional
    row_group_length                            = 0      # number | optional
    server_side_encryption_kms_key_id           = ""     # string | optional
    service_access_role_arn                     = ""     # string | optional
    timestamp_column_name                       = ""     # string | optional
    use_csv_no_sup_value                        = false  # bool | optional
    use_task_start_time_for_full_load_timestamp = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

