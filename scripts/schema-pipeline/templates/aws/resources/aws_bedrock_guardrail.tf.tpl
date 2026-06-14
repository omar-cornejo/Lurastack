# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrock_guardrail                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrock_guardrail" "this" {

  blocked_input_messaging   = ""     # string | required
  blocked_outputs_messaging = ""     # string | required
  name                      = ""     # string | required
  description               = ""     # string | optional+computed
  kms_key_arn               = ""     # string | optional
  tags                      = {}     # map(string) | optional

  # created_at                = ""     # string | computed
  # guardrail_arn             = ""     # string | computed
  # guardrail_id              = ""     # string | computed
  # status                    = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed
  # version                   = ""     # string | computed

  content_policy_config { # list

    filters_config { # set
      input_strength  = ""     # string | required
      output_strength = ""     # string | required
      type            = ""     # string | required

    }

  }

  contextual_grounding_policy_config { # list

    filters_config { # list
      threshold = 0      # number | required
      type      = ""     # string | required

    }

  }

  sensitive_information_policy_config { # list

    pii_entities_config { # list
      action = ""     # string | required
      type   = ""     # string | required

    }

    regexes_config { # list
      action      = ""     # string | required
      name        = ""     # string | required
      pattern     = ""     # string | required
      description = ""     # string | optional+computed

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  topic_policy_config { # list

    topics_config { # list
      definition = ""     # string | required
      name       = ""     # string | required
      type       = ""     # string | required
      examples   = []     # list(string) | optional+computed

    }

  }

  word_policy_config { # list

    managed_word_lists_config { # list
      type = ""     # string | required

    }

    words_config { # list
      text = ""     # string | required

    }

  }

}

