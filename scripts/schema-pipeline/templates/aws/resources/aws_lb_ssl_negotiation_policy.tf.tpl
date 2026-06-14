# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_ssl_negotiation_policy                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_ssl_negotiation_policy" "this" {

  lb_port       = 0      # number | required
  load_balancer = ""     # string | required
  name          = ""     # string | required
  id            = ""     # string | optional+computed
  triggers      = {}     # map(string) | optional

  attribute { # set
    name  = ""     # string | required
    value = ""     # string | required

  }

}

