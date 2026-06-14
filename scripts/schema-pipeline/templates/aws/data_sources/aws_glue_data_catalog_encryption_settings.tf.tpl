# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_glue_data_catalog_encryption_settings               │
# └──────────────────────────────────────────────────────────────┘
data "aws_glue_data_catalog_encryption_settings" "this" {

  catalog_id                       = ""     # string | required
  id                               = ""     # string | optional+computed

  # data_catalog_encryption_settings = [  # list(object)
  #   {
  #     connection_password_encryption = [  # list(object)
  #       {
  #         aws_kms_key_id = ""
  #         return_connection_password_encrypted = false
  #       }
  #     ]
  #     encryption_at_rest = [  # list(object)
  #       {
  #         catalog_encryption_mode = ""
  #         catalog_encryption_service_role = ""
  #         sse_aws_kms_key_id = ""
  #       }
  #     ]
  #   }
  # ]

}

