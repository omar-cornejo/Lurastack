# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_timestreamwrite_table                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_timestreamwrite_table" "this" {

  database_name = ""     # string | required
  table_name    = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed

  magnetic_store_write_properties { # list [0..1]
    enable_magnetic_store_writes = false  # bool | optional

    magnetic_store_rejected_data_location { # list [0..1]

      s3_configuration { # list [0..1]
        bucket_name       = ""     # string | optional
        encryption_option = ""     # string | optional
        kms_key_id        = ""     # string | optional
        object_key_prefix = ""     # string | optional

      }

    }

  }

  retention_properties { # list [0..1]
    magnetic_store_retention_period_in_days = 0      # number | required
    memory_store_retention_period_in_hours  = 0      # number | required

  }

  schema { # list [0..1]

    composite_partition_key { # list [0..1]
      type                  = ""     # string | required
      enforcement_in_record = ""     # string | optional
      name                  = ""     # string | optional

    }

  }

}

