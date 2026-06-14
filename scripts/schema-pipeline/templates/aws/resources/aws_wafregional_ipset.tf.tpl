# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_ipset                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_ipset" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  ip_set_descriptor { # set
    type  = ""     # string | required
    value = ""     # string | required

  }

}

