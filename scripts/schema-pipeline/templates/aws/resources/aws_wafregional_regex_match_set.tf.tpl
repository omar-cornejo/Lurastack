# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_regex_match_set                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_regex_match_set" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  regex_match_tuple { # set
    regex_pattern_set_id = ""     # string | required
    text_transformation  = ""     # string | required

    field_to_match { # list [1..1]
      type = ""     # string | required
      data = ""     # string | optional

    }

  }

}

