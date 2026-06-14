# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesis_stream                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesis_stream" "this" {

  name                      = ""     # string | required
  arn                       = ""     # string | optional+computed
  encryption_type           = ""     # string | optional
  enforce_consumer_deletion = false  # bool | optional
  id                        = ""     # string | optional+computed
  kms_key_id                = ""     # string | optional
  retention_period          = 0      # number | optional
  shard_count               = 0      # number | optional
  shard_level_metrics       = []     # set(string) | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  stream_mode_details { # list [0..1]
    stream_mode = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

