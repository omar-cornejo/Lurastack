# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_serverless_cache                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_serverless_cache" "this" {

  engine                   = ""     # string | required
  name                     = ""     # string | required
  daily_snapshot_time      = ""     # string | optional+computed
  description              = ""     # string | optional+computed
  kms_key_id               = ""     # string | optional
  major_engine_version     = ""     # string | optional+computed
  security_group_ids       = []     # set(string) | optional+computed
  snapshot_arns_to_restore = []     # list(string) | optional
  snapshot_retention_limit = 0      # number | optional+computed
  subnet_ids               = []     # set(string) | optional+computed
  tags                     = {}     # map(string) | optional
  user_group_id            = ""     # string | optional

  # arn                      = ""     # string | computed
  # create_time              = ""     # string | computed
  # endpoint = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #   }
  # ]
  # full_engine_version      = ""     # string | computed
  # id                       = ""     # string | computed
  # reader_endpoint = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #   }
  # ]
  # status                   = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed

  cache_usage_limits { # list

    data_storage { # list
      unit    = ""     # string | required
      maximum = 0      # number | optional
      minimum = 0      # number | optional

    }

    ecpu_per_second { # list
      maximum = 0      # number | optional
      minimum = 0      # number | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

