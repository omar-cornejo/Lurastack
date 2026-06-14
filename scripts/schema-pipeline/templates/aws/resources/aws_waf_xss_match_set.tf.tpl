# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_waf_xss_match_set                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_waf_xss_match_set" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  xss_match_tuples { # set
    text_transformation = ""     # string | required

    field_to_match { # list [1..1]
      type = ""     # string | required
      data = ""     # string | optional

    }

  }

}

