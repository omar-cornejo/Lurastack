# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lex_intent                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_lex_intent" "this" {

  name                    = ""     # string | required
  id                      = ""     # string | optional+computed
  version                 = ""     # string | optional

  # arn                     = ""     # string | computed
  # checksum                = ""     # string | computed
  # created_date            = ""     # string | computed
  # description             = ""     # string | computed
  # last_updated_date       = ""     # string | computed
  # parent_intent_signature = ""     # string | computed

}

