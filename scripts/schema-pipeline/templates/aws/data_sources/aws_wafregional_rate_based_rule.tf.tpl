# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafregional_rate_based_rule                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafregional_rate_based_rule" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

