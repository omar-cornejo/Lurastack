# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_secretsmanager_secret                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_secretsmanager_secret" "this" {

  description                    = ""     # string | optional
  force_overwrite_replica_secret = false  # bool | optional
  id                             = ""     # string | optional+computed
  kms_key_id                     = ""     # string | optional
  name                           = ""     # string | optional+computed
  name_prefix                    = ""     # string | optional+computed
  policy                         = ""     # string | optional+computed
  recovery_window_in_days        = 0      # number | optional
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed

  replica { # set
    region             = ""     # string | required
    kms_key_id         = ""     # string | optional+computed

    # last_accessed_date = ""     # string | computed
    # status             = ""     # string | computed
    # status_message     = ""     # string | computed

  }

}

