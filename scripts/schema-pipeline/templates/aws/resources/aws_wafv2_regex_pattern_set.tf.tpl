# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafv2_regex_pattern_set                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafv2_regex_pattern_set" "this" {

  scope       = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # lock_token  = ""     # string | computed

  regular_expression { # set [0..10]
    regex_string = ""     # string | required

  }

}

