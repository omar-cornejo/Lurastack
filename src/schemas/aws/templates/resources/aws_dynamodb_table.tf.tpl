# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_table                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_table" "this" {

  name                        = ""     # string | required
  billing_mode                = ""     # string | optional
  deletion_protection_enabled = false  # bool | optional
  hash_key                    = ""     # string | optional+computed
  id                          = ""     # string | optional+computed
  range_key                   = ""     # string | optional
  read_capacity               = 0      # number | optional+computed
  restore_date_time           = ""     # string | optional
  restore_source_name         = ""     # string | optional
  restore_source_table_arn    = ""     # string | optional
  restore_to_latest_time      = false  # bool | optional
  stream_enabled              = false  # bool | optional
  stream_view_type            = ""     # string | optional+computed
  table_class                 = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed
  write_capacity              = 0      # number | optional+computed

  # arn                         = ""     # string | computed
  # stream_arn                  = ""     # string | computed
  # stream_label                = ""     # string | computed

  attribute { # set
    name = ""     # string | required
    type = ""     # string | required

  }

  global_secondary_index { # set
    hash_key           = ""     # string | required
    name               = ""     # string | required
    projection_type    = ""     # string | required
    non_key_attributes = []     # set(string) | optional
    range_key          = ""     # string | optional
    read_capacity      = 0      # number | optional+computed
    write_capacity     = 0      # number | optional+computed

    on_demand_throughput { # list [0..1]
      max_read_request_units  = 0      # number | optional+computed
      max_write_request_units = 0      # number | optional+computed

    }

  }

  import_table { # list [0..1]
    input_format           = ""     # string | required
    input_compression_type = ""     # string | optional

    input_format_options { # list [0..1]

      csv { # list [0..1]
        delimiter   = ""     # string | optional
        header_list = []     # set(string) | optional

      }

    }

    s3_bucket_source { # list [1..1]
      bucket       = ""     # string | required
      bucket_owner = ""     # string | optional
      key_prefix   = ""     # string | optional

    }

  }

  local_secondary_index { # set
    name               = ""     # string | required
    projection_type    = ""     # string | required
    range_key          = ""     # string | required
    non_key_attributes = []     # list(string) | optional

  }

  on_demand_throughput { # list [0..1]
    max_read_request_units  = 0      # number | optional+computed
    max_write_request_units = 0      # number | optional+computed

  }

  point_in_time_recovery { # list [0..1]
    enabled                 = false  # bool | required
    recovery_period_in_days = 0      # number | optional+computed

  }

  replica { # set
    region_name            = ""     # string | required
    kms_key_arn            = ""     # string | optional+computed
    point_in_time_recovery = false  # bool | optional
    propagate_tags         = false  # bool | optional

    # arn                    = ""     # string | computed
    # stream_arn             = ""     # string | computed
    # stream_label           = ""     # string | computed

  }

  server_side_encryption { # list [0..1]
    enabled     = false  # bool | required
    kms_key_arn = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  ttl { # list [0..1]
    attribute_name = ""     # string | optional
    enabled        = false  # bool | optional

  }

}

