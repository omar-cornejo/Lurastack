# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_delivery_channel                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_delivery_channel" "this" {

  s3_bucket_name = ""     # string | required
  id             = ""     # string | optional+computed
  name           = ""     # string | optional
  s3_key_prefix  = ""     # string | optional
  s3_kms_key_arn = ""     # string | optional
  sns_topic_arn  = ""     # string | optional

  snapshot_delivery_properties { # list [0..1]
    delivery_frequency = ""     # string | optional

  }

}

