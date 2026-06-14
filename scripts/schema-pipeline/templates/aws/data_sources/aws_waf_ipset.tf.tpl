# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_waf_ipset                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_waf_ipset" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

