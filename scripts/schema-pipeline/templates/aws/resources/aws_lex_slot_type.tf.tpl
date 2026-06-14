# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lex_slot_type                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lex_slot_type" "this" {

  name                     = ""     # string | required
  create_version           = false  # bool | optional
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  value_selection_strategy = ""     # string | optional

  # checksum                 = ""     # string | computed
  # created_date             = ""     # string | computed
  # last_updated_date        = ""     # string | computed
  # version                  = ""     # string | computed

  enumeration_value { # set [1..10000]
    value    = ""     # string | required
    synonyms = []     # set(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

