# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lex_intent                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lex_intent" "this" {

  name                    = ""     # string | required
  create_version          = false  # bool | optional
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  parent_intent_signature = ""     # string | optional
  sample_utterances       = []     # set(string) | optional

  # arn                     = ""     # string | computed
  # checksum                = ""     # string | computed
  # created_date            = ""     # string | computed
  # last_updated_date       = ""     # string | computed
  # version                 = ""     # string | computed

  conclusion_statement { # list [0..1]
    response_card = ""     # string | optional

    message { # set [1..15]
      content      = ""     # string | required
      content_type = ""     # string | required
      group_number = 0      # number | optional

    }

  }

  confirmation_prompt { # list [0..1]
    max_attempts  = 0      # number | required
    response_card = ""     # string | optional

    message { # set [1..15]
      content      = ""     # string | required
      content_type = ""     # string | required
      group_number = 0      # number | optional

    }

  }

  dialog_code_hook { # list [0..1]
    message_version = ""     # string | required
    uri             = ""     # string | required

  }

  follow_up_prompt { # list [0..1]

    prompt { # list [1..1]
      max_attempts  = 0      # number | required
      response_card = ""     # string | optional

      message { # set [1..15]
        content      = ""     # string | required
        content_type = ""     # string | required
        group_number = 0      # number | optional

      }

    }

    rejection_statement { # list [1..1]
      response_card = ""     # string | optional

      message { # set [1..15]
        content      = ""     # string | required
        content_type = ""     # string | required
        group_number = 0      # number | optional

      }

    }

  }

  fulfillment_activity { # list [1..1]
    type = ""     # string | required

    code_hook { # list [0..1]
      message_version = ""     # string | required
      uri             = ""     # string | required

    }

  }

  rejection_statement { # list [0..1]
    response_card = ""     # string | optional

    message { # set [1..15]
      content      = ""     # string | required
      content_type = ""     # string | required
      group_number = 0      # number | optional

    }

  }

  slot { # set [0..100]
    name              = ""     # string | required
    slot_constraint   = ""     # string | required
    slot_type         = ""     # string | required
    description       = ""     # string | optional
    priority          = 0      # number | optional
    response_card     = ""     # string | optional
    sample_utterances = []     # list(string) | optional
    slot_type_version = ""     # string | optional

    value_elicitation_prompt { # list [0..1]
      max_attempts  = 0      # number | required
      response_card = ""     # string | optional

      message { # set [1..15]
        content      = ""     # string | required
        content_type = ""     # string | required
        group_number = 0      # number | optional

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

