# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesis_video_stream                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesis_video_stream" "this" {

  name                    = ""     # string | required
  data_retention_in_hours = 0      # number | optional
  device_name             = ""     # string | optional
  id                      = ""     # string | optional+computed
  kms_key_id              = ""     # string | optional+computed
  media_type              = ""     # string | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # creation_time           = ""     # string | computed
  # version                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

