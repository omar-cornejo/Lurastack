# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_feature_group                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_feature_group" "this" {

  event_time_feature_name        = ""     # string | required
  feature_group_name             = ""     # string | required
  record_identifier_feature_name = ""     # string | required
  role_arn                       = ""     # string | required
  description                    = ""     # string | optional
  id                             = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed

  feature_definition { # list [1..2500]
    collection_type = ""     # string | optional
    feature_name    = ""     # string | optional
    feature_type    = ""     # string | optional

    collection_config { # list [0..1]

      vector_config { # list [0..1]
        dimension = 0      # number | optional

      }

    }

  }

  offline_store_config { # list [0..1]
    disable_glue_table_creation = false  # bool | optional
    table_format                = ""     # string | optional

    data_catalog_config { # list [0..1]
      catalog    = ""     # string | optional+computed
      database   = ""     # string | optional+computed
      table_name = ""     # string | optional+computed

    }

    s3_storage_config { # list [1..1]
      s3_uri                 = ""     # string | required
      kms_key_id             = ""     # string | optional
      resolved_output_s3_uri = ""     # string | optional+computed

    }

  }

  online_store_config { # list [0..1]
    enable_online_store = false  # bool | optional
    storage_type        = ""     # string | optional

    security_config { # list [0..1]
      kms_key_id = ""     # string | optional

    }

    ttl_duration { # list [0..1]
      unit  = ""     # string | optional
      value = 0      # number | optional

    }

  }

  throughput_config { # list [0..1]
    provisioned_read_capacity_units  = 0      # number | optional
    provisioned_write_capacity_units = 0      # number | optional
    throughput_mode                  = ""     # string | optional+computed

  }

}

