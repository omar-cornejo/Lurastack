# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_table_export                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_table_export" "this" {

  s3_bucket             = ""     # string | required
  table_arn             = ""     # string | required
  export_format         = ""     # string | optional
  export_time           = ""     # string | optional+computed
  export_type           = ""     # string | optional+computed
  id                    = ""     # string | optional+computed
  s3_bucket_owner       = ""     # string | optional+computed
  s3_prefix             = ""     # string | optional+computed
  s3_sse_algorithm      = ""     # string | optional+computed
  s3_sse_kms_key_id     = ""     # string | optional

  # arn                   = ""     # string | computed
  # billed_size_in_bytes  = 0      # number | computed
  # end_time              = ""     # string | computed
  # export_status         = ""     # string | computed
  # item_count            = 0      # number | computed
  # manifest_files_s3_key = ""     # string | computed
  # start_time            = ""     # string | computed

  incremental_export_specification { # list [0..1]
    export_from_time = ""     # string | optional+computed
    export_to_time   = ""     # string | optional+computed
    export_view_type = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

