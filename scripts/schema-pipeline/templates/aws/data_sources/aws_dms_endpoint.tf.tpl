# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dms_endpoint                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_dms_endpoint" "this" {

  endpoint_id                     = ""     # string | required
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional+computed

  # certificate_arn                 = ""     # string | computed
  # database_name                   = ""     # string | computed
  # elasticsearch_settings = [  # list(object)
  #   {
  #     endpoint_uri = ""
  #     error_retry_duration = 0
  #     full_load_error_percentage = 0
  #     service_access_role_arn = ""
  #   }
  # ]
  # endpoint_arn                    = ""     # string | computed
  # endpoint_type                   = ""     # string | computed
  # engine_name                     = ""     # string | computed
  # extra_connection_attributes     = ""     # string | computed
  # kafka_settings = [  # list(object)
  #   {
  #     broker = ""
  #     include_control_details = false
  #     include_null_and_empty = false
  #     include_partition_value = false
  #     include_table_alter_operations = false
  #     include_transaction_details = false
  #     message_format = ""
  #     message_max_bytes = 0
  #     no_hex_prefix = false
  #     partition_include_schema_table = false
  #     sasl_mechanism = ""
  #     sasl_password = ""
  #     sasl_username = ""
  #     security_protocol = ""
  #     ssl_ca_certificate_arn = ""
  #     ssl_client_certificate_arn = ""
  #     ssl_client_key_arn = ""
  #     ssl_client_key_password = ""
  #     topic = ""
  #   }
  # ]
  # kinesis_settings = [  # list(object)
  #   {
  #     include_control_details = false
  #     include_null_and_empty = false
  #     include_partition_value = false
  #     include_table_alter_operations = false
  #     include_transaction_details = false
  #     message_format = ""
  #     partition_include_schema_table = false
  #     service_access_role_arn = ""
  #     stream_arn = ""
  #     use_large_integer_value = false
  #   }
  # ]
  # kms_key_arn                     = ""     # string | computed
  # mongodb_settings = [  # list(object)
  #   {
  #     auth_mechanism = ""
  #     auth_source = ""
  #     auth_type = ""
  #     docs_to_investigate = ""
  #     extract_doc_id = ""
  #     nesting_level = ""
  #   }
  # ]
  # password                        = ""     # string | computed
  # port                            = 0      # number | computed
  # postgres_settings = [  # list(object)
  #   {
  #     after_connect_script = ""
  #     babelfish_database_name = ""
  #     capture_ddls = false
  #     database_mode = ""
  #     ddl_artifacts_schema = ""
  #     execute_timeout = 0
  #     fail_tasks_on_lob_truncation = false
  #     heartbeat_enable = false
  #     heartbeat_frequency = 0
  #     heartbeat_schema = ""
  #     map_boolean_as_boolean = false
  #     map_jsonb_as_clob = false
  #     map_long_varchar_as = ""
  #     max_file_size = 0
  #     plugin_name = ""
  #     slot_name = ""
  #   }
  # ]
  # redis_settings = [  # list(object)
  #   {
  #     auth_password = ""
  #     auth_type = ""
  #     auth_user_name = ""
  #     port = 0
  #     server_name = ""
  #     ssl_ca_certificate_arn = ""
  #     ssl_security_protocol = ""
  #   }
  # ]
  # redshift_settings = [  # list(object)
  #   {
  #     bucket_folder = ""
  #     bucket_name = ""
  #     encryption_mode = ""
  #     server_side_encryption_kms_key_id = ""
  #     service_access_role_arn = ""
  #   }
  # ]
  # s3_settings = [  # list(object)
  #   {
  #     add_column_name = false
  #     bucket_folder = ""
  #     bucket_name = ""
  #     canned_acl_for_objects = ""
  #     cdc_inserts_and_updates = false
  #     cdc_inserts_only = false
  #     cdc_max_batch_interval = 0
  #     cdc_min_file_size = 0
  #     cdc_path = ""
  #     compression_type = ""
  #     csv_delimiter = ""
  #     csv_no_sup_value = ""
  #     csv_null_value = ""
  #     csv_row_delimiter = ""
  #     data_format = ""
  #     data_page_size = 0
  #     date_partition_delimiter = ""
  #     date_partition_enabled = false
  #     date_partition_sequence = ""
  #     dict_page_size_limit = 0
  #     enable_statistics = false
  #     encoding_type = ""
  #     encryption_mode = ""
  #     external_table_definition = ""
  #     glue_catalog_generation = false
  #     ignore_header_rows = 0
  #     ignore_headers_row = 0
  #     include_op_for_full_load = false
  #     max_file_size = 0
  #     parquet_timestamp_in_millisecond = false
  #     parquet_version = ""
  #     preserve_transactions = false
  #     rfc_4180 = false
  #     row_group_length = 0
  #     server_side_encryption_kms_key_id = ""
  #     service_access_role_arn = ""
  #     timestamp_column_name = ""
  #     use_csv_no_sup_value = false
  #     use_task_start_time_for_full_load_timestamp = false
  #   }
  # ]
  # secrets_manager_access_role_arn = ""     # string | computed
  # secrets_manager_arn             = ""     # string | computed
  # server_name                     = ""     # string | computed
  # service_access_role             = ""     # string | computed
  # ssl_mode                        = ""     # string | computed
  # username                        = ""     # string | computed

}

