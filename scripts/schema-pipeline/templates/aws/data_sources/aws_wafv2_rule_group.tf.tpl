# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafv2_rule_group                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafv2_rule_group" "this" {

  name        = ""     # string | required
  scope       = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed

}

