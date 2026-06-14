# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_waf_geo_match_set                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_waf_geo_match_set" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  geo_match_constraint { # set
    type  = ""     # string | required
    value = ""     # string | required

  }

}

