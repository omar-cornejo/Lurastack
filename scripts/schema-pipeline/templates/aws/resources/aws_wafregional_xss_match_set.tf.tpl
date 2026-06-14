# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_xss_match_set                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_xss_match_set" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  xss_match_tuple { # set
    text_transformation = ""     # string | required

    field_to_match { # list [1..1]
      type = ""     # string | required
      data = ""     # string | optional

    }

  }

}

