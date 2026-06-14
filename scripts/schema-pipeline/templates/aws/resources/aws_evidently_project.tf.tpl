# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_evidently_project                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_evidently_project" "this" {

  name                    = ""     # string | required
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # active_experiment_count = 0      # number | computed
  # active_launch_count     = 0      # number | computed
  # arn                     = ""     # string | computed
  # created_time            = ""     # string | computed
  # experiment_count        = 0      # number | computed
  # feature_count           = 0      # number | computed
  # last_updated_time       = ""     # string | computed
  # launch_count            = 0      # number | computed
  # status                  = ""     # string | computed

  data_delivery { # list [0..1]

    cloudwatch_logs { # list [0..1]
      log_group = ""     # string | optional

    }

    s3_destination { # list [0..1]
      bucket = ""     # string | optional
      prefix = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

