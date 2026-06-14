# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_waf_rule                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_waf_rule" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

