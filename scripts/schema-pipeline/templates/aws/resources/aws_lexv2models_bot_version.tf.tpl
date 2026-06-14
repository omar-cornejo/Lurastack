# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lexv2models_bot_version                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lexv2models_bot_version" "this" {

  bot_id               = ""     # string | required
  locale_specification = {}     # map(object({ source_bot_version: string })) | required
  bot_version          = ""     # string | optional+computed
  description          = ""     # string | optional

  # id                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

