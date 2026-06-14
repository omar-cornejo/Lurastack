# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kinesis_stream                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_kinesis_stream" "this" {

  name                = ""     # string | required
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # closed_shards       = []     # set(string) | computed
  # creation_timestamp  = 0      # number | computed
  # encryption_type     = ""     # string | computed
  # kms_key_id          = ""     # string | computed
  # open_shards         = []     # set(string) | computed
  # retention_period    = 0      # number | computed
  # shard_level_metrics = []     # set(string) | computed
  # status              = ""     # string | computed
  # stream_mode_details = [  # list(object)
  #   {
  #     stream_mode = ""
  #   }
  # ]

}

