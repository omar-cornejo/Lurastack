# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrock_model_invocation_logging_configuration  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrock_model_invocation_logging_configuration" "this" {


  # id = ""     # string | computed

  logging_config { # single
    embedding_data_delivery_enabled = false  # bool | optional+computed
    image_data_delivery_enabled     = false  # bool | optional+computed
    text_data_delivery_enabled      = false  # bool | optional+computed
    video_data_delivery_enabled     = false  # bool | optional+computed

    cloudwatch_config { # single
      log_group_name = ""     # string | optional
      role_arn       = ""     # string | optional

      large_data_delivery_s3_config { # single
        bucket_name = ""     # string | optional
        key_prefix  = ""     # string | optional

      }

    }

    s3_config { # single
      bucket_name = ""     # string | optional
      key_prefix  = ""     # string | optional

    }

  }

}

