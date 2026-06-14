# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sfn_state_machine                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sfn_state_machine" "this" {

  definition                = ""     # string | required
  role_arn                  = ""     # string | required
  id                        = ""     # string | optional+computed
  name                      = ""     # string | optional+computed
  name_prefix               = ""     # string | optional+computed
  publish                   = false  # bool | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed
  type                      = ""     # string | optional

  # arn                       = ""     # string | computed
  # creation_date             = ""     # string | computed
  # description               = ""     # string | computed
  # revision_id               = ""     # string | computed
  # state_machine_version_arn = ""     # string | computed
  # status                    = ""     # string | computed
  # version_description       = ""     # string | computed

  encryption_configuration { # list [0..1]
    kms_data_key_reuse_period_seconds = 0      # number | optional
    kms_key_id                        = ""     # string | optional
    type                              = ""     # string | optional

  }

  logging_configuration { # list [0..1]
    include_execution_data = false  # bool | optional
    level                  = ""     # string | optional
    log_destination        = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  tracing_configuration { # list [0..1]
    enabled = false  # bool | optional

  }

}

