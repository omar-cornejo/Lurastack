# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_s3_endpoint                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_s3_endpoint" "this" {

  bucket_name                                 = ""     # string | required
  endpoint_id                                 = ""     # string | required
  endpoint_type                               = ""     # string | required
  service_access_role_arn                     = ""     # string | required
  add_column_name                             = false  # bool | optional
  add_trailing_padding_character              = false  # bool | optional
  bucket_folder                               = ""     # string | optional
  canned_acl_for_objects                      = ""     # string | optional
  cdc_inserts_and_updates                     = false  # bool | optional
  cdc_inserts_only                            = false  # bool | optional
  cdc_max_batch_interval                      = 0      # number | optional
  cdc_min_file_size                           = 0      # number | optional
  cdc_path                                    = ""     # string | optional
  certificate_arn                             = ""     # string | optional+computed
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
  date_partition_timezone                     = ""     # string | optional
  detach_target_on_lob_lookup_failure_parquet = false  # bool | optional
  dict_page_size_limit                        = 0      # number | optional
  enable_statistics                           = false  # bool | optional
  encoding_type                               = ""     # string | optional
  encryption_mode                             = ""     # string | optional
  expected_bucket_owner                       = ""     # string | optional
  external_table_definition                   = ""     # string | optional
  glue_catalog_generation                     = false  # bool | optional
  id                                          = ""     # string | optional+computed
  ignore_header_rows                          = 0      # number | optional
  include_op_for_full_load                    = false  # bool | optional
  kms_key_arn                                 = ""     # string | optional+computed
  max_file_size                               = 0      # number | optional
  parquet_timestamp_in_millisecond            = false  # bool | optional
  parquet_version                             = ""     # string | optional
  preserve_transactions                       = false  # bool | optional
  rfc_4180                                    = false  # bool | optional
  row_group_length                            = 0      # number | optional
  server_side_encryption_kms_key_id           = ""     # string | optional
  ssl_mode                                    = ""     # string | optional+computed
  tags                                        = {}     # map(string) | optional
  tags_all                                    = {}     # map(string) | optional+computed
  timestamp_column_name                       = ""     # string | optional
  use_csv_no_sup_value                        = false  # bool | optional
  use_task_start_time_for_full_load_timestamp = false  # bool | optional

  # endpoint_arn                                = ""     # string | computed
  # engine_display_name                         = ""     # string | computed
  # external_id                                 = ""     # string | computed
  # status                                      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

