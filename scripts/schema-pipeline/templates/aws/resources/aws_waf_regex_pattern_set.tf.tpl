# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_waf_regex_pattern_set                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_waf_regex_pattern_set" "this" {

  name                  = ""     # string | required
  id                    = ""     # string | optional+computed
  regex_pattern_strings = []     # set(string) | optional

  # arn                   = ""     # string | computed

}

