# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_instance_storage_config                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_instance_storage_config" "this" {

  instance_id    = ""     # string | required
  resource_type  = ""     # string | required
  id             = ""     # string | optional+computed

  # association_id = ""     # string | computed

  storage_config { # list [1..1]
    storage_type = ""     # string | required

    kinesis_firehose_config { # list [0..1]
      firehose_arn = ""     # string | required

    }

    kinesis_stream_config { # list [0..1]
      stream_arn = ""     # string | required

    }

    kinesis_video_stream_config { # list [0..1]
      prefix                 = ""     # string | required
      retention_period_hours = 0      # number | required

      encryption_config { # list [1..1]
        encryption_type = ""     # string | required
        key_id          = ""     # string | required

      }

    }

    s3_config { # list [0..1]
      bucket_name   = ""     # string | required
      bucket_prefix = ""     # string | required

      encryption_config { # list [0..1]
        encryption_type = ""     # string | required
        key_id          = ""     # string | required

      }

    }

  }

}

