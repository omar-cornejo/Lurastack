# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_waf_byte_match_set                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_waf_byte_match_set" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  byte_match_tuples { # set
    positional_constraint = ""     # string | required
    text_transformation   = ""     # string | required
    target_string         = ""     # string | optional

    field_to_match { # list [1..1]
      type = ""     # string | required
      data = ""     # string | optional

    }

  }

}

