# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_metric_stream                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_metric_stream" "this" {

  firehose_arn                    = ""     # string | required
  output_format                   = ""     # string | required
  role_arn                        = ""     # string | required
  id                              = ""     # string | optional+computed
  include_linked_accounts_metrics = false  # bool | optional
  name                            = ""     # string | optional+computed
  name_prefix                     = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # creation_date                   = ""     # string | computed
  # last_update_date                = ""     # string | computed
  # state                           = ""     # string | computed

  exclude_filter { # set
    namespace    = ""     # string | required
    metric_names = []     # set(string) | optional

  }

  include_filter { # set
    namespace    = ""     # string | required
    metric_names = []     # set(string) | optional

  }

  statistics_configuration { # set
    additional_statistics = []     # set(string) | required

    include_metric { # set [1..*]
      metric_name = ""     # string | required
      namespace   = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

