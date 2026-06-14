# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_waf_ipset                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_waf_ipset" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  ip_set_descriptors { # set
    type  = ""     # string | required
    value = ""     # string | required

  }

}

