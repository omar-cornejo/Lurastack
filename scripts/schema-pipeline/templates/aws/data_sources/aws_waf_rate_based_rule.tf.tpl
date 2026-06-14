# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_waf_rate_based_rule                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_waf_rate_based_rule" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

