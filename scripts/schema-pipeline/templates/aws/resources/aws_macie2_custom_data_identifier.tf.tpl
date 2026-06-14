# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_custom_data_identifier                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_custom_data_identifier" "this" {

  description            = ""     # string | optional
  id                     = ""     # string | optional+computed
  ignore_words           = []     # set(string) | optional
  keywords               = []     # set(string) | optional
  maximum_match_distance = 0      # number | optional+computed
  name                   = ""     # string | optional+computed
  name_prefix            = ""     # string | optional+computed
  regex                  = ""     # string | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # created_at             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

