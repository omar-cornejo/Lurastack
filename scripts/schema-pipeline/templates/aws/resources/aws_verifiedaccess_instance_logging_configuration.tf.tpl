# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedaccess_instance_logging_configuration   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedaccess_instance_logging_configuration" "this" {

  verifiedaccess_instance_id = ""     # string | required
  id                         = ""     # string | optional+computed

  access_logs { # list [1..1]
    include_trust_context = false  # bool | optional+computed
    log_version           = ""     # string | optional+computed

    cloudwatch_logs { # list [0..1]
      enabled   = false  # bool | required
      log_group = ""     # string | optional

    }

    kinesis_data_firehose { # list [0..1]
      enabled         = false  # bool | required
      delivery_stream = ""     # string | optional

    }

    s3 { # list [0..1]
      enabled      = false  # bool | required
      bucket_name  = ""     # string | optional
      bucket_owner = ""     # string | optional+computed
      prefix       = ""     # string | optional

    }

  }

}

