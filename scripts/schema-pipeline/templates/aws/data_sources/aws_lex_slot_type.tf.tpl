# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lex_slot_type                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_lex_slot_type" "this" {

  name                     = ""     # string | required
  id                       = ""     # string | optional+computed
  version                  = ""     # string | optional

  # checksum                 = ""     # string | computed
  # created_date             = ""     # string | computed
  # description              = ""     # string | computed
  # enumeration_value = [  # set(object)
  #   {
  #     synonyms = []  # list(string)
  #     value = ""
  #   }
  # ]
  # last_updated_date        = ""     # string | computed
  # value_selection_strategy = ""     # string | computed

}

