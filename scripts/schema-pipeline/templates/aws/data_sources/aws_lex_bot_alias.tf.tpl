# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lex_bot_alias                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_lex_bot_alias" "this" {

  bot_name          = ""     # string | required
  name              = ""     # string | required
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # bot_version       = ""     # string | computed
  # checksum          = ""     # string | computed
  # created_date      = ""     # string | computed
  # description       = ""     # string | computed
  # last_updated_date = ""     # string | computed

}

