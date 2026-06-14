# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lex_bot_alias                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lex_bot_alias" "this" {

  bot_name          = ""     # string | required
  bot_version       = ""     # string | required
  name              = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # checksum          = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed

  conversation_logs { # list [0..1]
    iam_role_arn = ""     # string | required

    log_settings { # set
      destination     = ""     # string | required
      log_type        = ""     # string | required
      resource_arn    = ""     # string | required
      kms_key_arn     = ""     # string | optional

      # resource_prefix = ""     # string | computed

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

