# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lex_bot                                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lex_bot" "this" {

  child_directed                  = false  # bool | required
  name                            = ""     # string | required
  create_version                  = false  # bool | optional
  description                     = ""     # string | optional
  detect_sentiment                = false  # bool | optional
  enable_model_improvements       = false  # bool | optional
  id                              = ""     # string | optional+computed
  idle_session_ttl_in_seconds     = 0      # number | optional
  locale                          = ""     # string | optional
  nlu_intent_confidence_threshold = 0      # number | optional
  process_behavior                = ""     # string | optional
  voice_id                        = ""     # string | optional+computed

  # arn                             = ""     # string | computed
  # checksum                        = ""     # string | computed
  # created_date                    = ""     # string | computed
  # failure_reason                  = ""     # string | computed
  # last_updated_date               = ""     # string | computed
  # status                          = ""     # string | computed
  # version                         = ""     # string | computed

  abort_statement { # list [1..1]
    response_card = ""     # string | optional

    message { # set [1..15]
      content      = ""     # string | required
      content_type = ""     # string | required
      group_number = 0      # number | optional

    }

  }

  clarification_prompt { # list [0..1]
    max_attempts  = 0      # number | required
    response_card = ""     # string | optional

    message { # set [1..15]
      content      = ""     # string | required
      content_type = ""     # string | required
      group_number = 0      # number | optional

    }

  }

  intent { # set [1..250]
    intent_name    = ""     # string | required
    intent_version = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

