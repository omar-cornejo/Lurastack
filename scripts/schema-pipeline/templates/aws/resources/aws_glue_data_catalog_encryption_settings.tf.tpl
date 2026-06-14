# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_data_catalog_encryption_settings           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_data_catalog_encryption_settings" "this" {

  catalog_id = ""     # string | optional+computed
  id         = ""     # string | optional+computed

  data_catalog_encryption_settings { # list [1..1]

    connection_password_encryption { # list [1..1]
      return_connection_password_encrypted = false  # bool | required
      aws_kms_key_id                       = ""     # string | optional

    }

    encryption_at_rest { # list [1..1]
      catalog_encryption_mode         = ""     # string | required
      catalog_encryption_service_role = ""     # string | optional
      sse_aws_kms_key_id              = ""     # string | optional

    }

  }

}

