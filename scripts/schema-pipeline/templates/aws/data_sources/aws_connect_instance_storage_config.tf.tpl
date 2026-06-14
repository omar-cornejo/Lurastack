# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_instance_storage_config                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_instance_storage_config" "this" {

  association_id = ""     # string | required
  instance_id    = ""     # string | required
  resource_type  = ""     # string | required
  id             = ""     # string | optional+computed

  # storage_config = [  # list(object)
  #   {
  #     kinesis_firehose_config = [  # list(object)
  #       {
  #         firehose_arn = ""
  #       }
  #     ]
  #     kinesis_stream_config = [  # list(object)
  #       {
  #         stream_arn = ""
  #       }
  #     ]
  #     kinesis_video_stream_config = [  # list(object)
  #       {
  #         encryption_config = [  # list(object)
  #           {
  #             encryption_type = ""
  #             key_id = ""
  #           }
  #         ]
  #         prefix = ""
  #         retention_period_hours = 0
  #       }
  #     ]
  #     s3_config = [  # list(object)
  #       {
  #         bucket_name = ""
  #         bucket_prefix = ""
  #         encryption_config = [  # list(object)
  #           {
  #             encryption_type = ""
  #             key_id = ""
  #           }
  #         ]
  #       }
  #     ]
  #     storage_type = ""
  #   }
  # ]

}

