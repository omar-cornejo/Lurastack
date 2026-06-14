# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticache_serverless_cache                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticache_serverless_cache" "this" {

  name                     = ""     # string | required

  # arn                      = ""     # string | computed
  # cache_usage_limits = {
  #   data_storage = {
  #     maximum = 0
  #     minimum = 0
  #     unit = ""
  #   }
  #   ecpu_per_second = {
  #     maximum = 0
  #     minimum = 0
  #   }
  # }
  # create_time              = ""     # string | computed
  # daily_snapshot_time      = ""     # string | computed
  # description              = ""     # string | computed
  # endpoint = {
  #   address = ""
  #   port = 0
  # }
  # engine                   = ""     # string | computed
  # full_engine_version      = ""     # string | computed
  # kms_key_id               = ""     # string | computed
  # major_engine_version     = ""     # string | computed
  # reader_endpoint = {
  #   address = ""
  #   port = 0
  # }
  # security_group_ids       = []     # list(string) | computed
  # snapshot_retention_limit = 0      # number | computed
  # status                   = ""     # string | computed
  # subnet_ids               = []     # list(string) | computed
  # user_group_id            = ""     # string | computed

}

