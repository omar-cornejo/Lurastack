# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafregional_rule                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafregional_rule" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

