# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_timestreamwrite_table                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_timestreamwrite_table" "this" {

  database_name                   = ""     # string | required
  name                            = ""     # string | required

  # arn                             = ""     # string | computed
  # creation_time                   = ""     # string | computed
  # last_updated_time               = ""     # string | computed
  # magnetic_store_write_properties = [  # list(object)
  #   {
  #     enable_magnetic_store_writes = false
  #     magnetic_store_rejected_data_location = [  # list(object)
  #       {
  #         s3_configuration = [  # list(object)
  #           {
  #             bucket_name = ""
  #             encryption_option = ""
  #             kms_key_id = ""
  #             object_key_prefix = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # retention_properties = [  # list(object)
  #   {
  #     magnetic_store_retention_period_in_days = 0
  #     memory_store_retention_period_in_hours = 0
  #   }
  # ]
  # schema = [  # list(object)
  #   {
  #     composite_partition_key = [  # list(object)
  #       {
  #         enforcement_in_record = ""
  #         name = ""
  #         type = ""
  #       }
  #     ]
  #   }
  # ]
  # table_status                    = ""     # string | computed

}

