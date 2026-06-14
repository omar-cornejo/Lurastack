# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lexv2models_bot_locale                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lexv2models_bot_locale" "this" {

  bot_id                           = ""     # string | required
  bot_version                      = ""     # string | required
  locale_id                        = ""     # string | required
  n_lu_intent_confidence_threshold = 0      # number | required
  description                      = ""     # string | optional
  name                             = ""     # string | optional+computed

  # id                               = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  voice_settings { # list
    voice_id = ""     # string | required
    engine   = ""     # string | optional+computed

  }

}

