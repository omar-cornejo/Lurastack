# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_synthetics_canary                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_synthetics_canary" "this" {

  artifact_s3_location     = ""     # string | required
  execution_role_arn       = ""     # string | required
  handler                  = ""     # string | required
  name                     = ""     # string | required
  runtime_version          = ""     # string | required
  delete_lambda            = false  # bool | optional
  failure_retention_period = 0      # number | optional
  id                       = ""     # string | optional+computed
  s3_bucket                = ""     # string | optional
  s3_key                   = ""     # string | optional
  s3_version               = ""     # string | optional
  start_canary             = false  # bool | optional
  success_retention_period = 0      # number | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  zip_file                 = ""     # string | optional

  # arn                      = ""     # string | computed
  # engine_arn               = ""     # string | computed
  # source_location_arn      = ""     # string | computed
  # status                   = ""     # string | computed
  # timeline = [  # list(object)
  #   {
  #     created = ""
  #     last_modified = ""
  #     last_started = ""
  #     last_stopped = ""
  #   }
  # ]

  artifact_config { # list [0..1]

    s3_encryption { # list [0..1]
      encryption_mode = ""     # string | optional
      kms_key_arn     = ""     # string | optional

    }

  }

  run_config { # list [0..1]
    active_tracing        = false  # bool | optional
    environment_variables = {}     # map(string) | optional
    memory_in_mb          = 0      # number | optional+computed
    timeout_in_seconds    = 0      # number | optional+computed

  }

  schedule { # list [1..1]
    expression          = ""     # string | required
    duration_in_seconds = 0      # number | optional

  }

  vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | optional
    subnet_ids         = []     # set(string) | optional

    # vpc_id             = ""     # string | computed

  }

}

