# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafv2_regex_pattern_set                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafv2_regex_pattern_set" "this" {

  name               = ""     # string | required
  scope              = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed
  # description        = ""     # string | computed
  # regular_expression = [  # set(object)
  #   {
  #     regex_string = ""
  #   }
  # ]

}

