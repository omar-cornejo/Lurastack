# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafregional_ipset                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafregional_ipset" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

